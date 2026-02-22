
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





}
