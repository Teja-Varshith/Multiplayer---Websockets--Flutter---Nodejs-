const express = require("express");
const http = require("http");
const { default: mongoose } = require("mongoose");
const app = express();

var server = http.createServer(app);
var io = require("socket.io")(server);

const Room = require("./models/room");




io.on("connection", (socket) => {
    console.log("connnected" + socket.id);
    socket.on("createRoom", async(name) => {
        // create room
        let room = new Room();
        let player = {
            nickName: name,
            socketId: socket.id,
            playerType: 'X',
        };
        room.players.push(player);
        room.turn = player;
        room = await room.save();
        const roomId = room._id.toString();
        socket.join(roomId);

        console.log(room);

        var e = io.to(roomId).emit("createRoomSucess", room);
        console.log(e);

    })

    socket.on("joinRoom", async({nickname,roomId}) => {
        // check if isJoin true
        var room = await Room.findById(roomId);
        console.log(room);
        if(room.isJoin){
            let player = {
                nickName: nickname,
                socketId: socket.id,
                playerType: 'O',
            }
            room.players.push(player);
            room.isJoin = false;
            room = await room.save();
            console.log(`new room is` + room);
            socket.join(roomId);
            io.to(roomId).emit("joinRoomSucessListener", room);
            io.to(roomId).emit("updatePlayers", room.players);
        }
    });

    socket.on("tap", async({index, roomId}) => {
        var room = await Room.findById(roomId);
        let choice = room.turn.playerType;
        if(room.turnIndex == 0){
            room.turnIndex = 1;
            room.turn = room.players[1];
        }
        else{
            room.turnIndex = 0;
            room.turn = room.players[0];
        }
        room = await room.save();
        io.to(roomId).emit('tapped', {
            index,
            choice,
            room
        });
    });
});




app.use(express.json());

const db = mongoose.connect("").then(()=>{
    console.log('Db connected');
    server.listen(3000, "0.0.0.0", () =>{
    console.log("connected and listening at 3k");
});
});


