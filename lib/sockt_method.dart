
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:websockets/provider/room_prodr.dart';
import 'package:websockets/screens/gameScreen.dart';
import 'package:websockets/socketCliet.dart' show SocketClient;


class SocketMethods {
  final socket = SocketClient.instance.socket;

  void createRoom(String name) {
    socket!.emit("createRoom",name);
  }


  void roomCreateListn(BuildContext context) {
    socket!.on("createRoomSucess", (room) {
      print("The room value from the backend is $room");
      Provider.of<RoomDataProvider>(context, listen: false).updateRoom(room);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Gamescreen(),)
      );
    });
  }

  void JoinRoom(String roomId, String name) {
    socket!.emit("joinRoom", {
      'nickname' : name,
      'roomId' : roomId,
    });
  }

  void joinRoomSucessListeners(BuildContext context) {
    socket!.on("joinRoomSucessListener", (room) {
      Provider.of<RoomDataProvider>(context, listen: false).updateRoom(room);
      print(room.toString());
      Navigator.push(context, MaterialPageRoute(builder: (context) => Gamescreen(),));
    });
  }

  void updatePlayerListner(BuildContext context) {
    socket!.on("updatePlayers", (players) {
      print("THE PLAYERS ARE UPDTDD $players[0] $players[1]");
      Provider.of<RoomDataProvider>(context,listen: false).updatePlayer1(players[0]);
      Provider.of<RoomDataProvider>(context,listen: false).updatePlayer2(players[1]);
    });
  }

  void onTap(int index, String roomId, List<String> elements){
      if(elements[index] == ''){
        socket!.emit('tap',{
          "index": index,
          "roomId": roomId
        });
      }
  }

  void onTapListner(BuildContext context){
    socket!.on(
      'tapped',
      (data) {
        RoomDataProvider room = Provider.of<RoomDataProvider>(context,listen: false);
        room.updateDisplayElements(data['index'], data['choice']);
        room.updateRoom(data['room']);
      }
    );
  }





}
