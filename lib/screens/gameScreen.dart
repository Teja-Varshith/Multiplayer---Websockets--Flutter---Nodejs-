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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Center(
        child: Text(
          Provider.of<RoomDataProvider>(context).roomData.toString(),
        )
      ),
    );
  }
}