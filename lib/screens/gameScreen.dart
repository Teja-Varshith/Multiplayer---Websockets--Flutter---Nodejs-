import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:websockets/provider/room_prodr.dart';
import 'package:websockets/sockt_method.dart';

class Gamescreen extends StatefulWidget {
  const Gamescreen({super.key});

  @override
  State<Gamescreen> createState() => _GamescreenState();
}

class _GamescreenState extends State<Gamescreen> {
  final SocketMethods _socketMethods = SocketMethods();

  @override
  void initState() {
    _socketMethods.joinRoomSucessListeners(context);
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    final RoomDataProvider roomData = Provider.of<RoomDataProvider>(context);
    return Scaffold(
      body:  (roomData.roomData['isJoin']) ? CircularProgressIndicator() :
       Center(
        child: Text(
          roomData.player1.nickName
        )
      ),
    );
  }
}