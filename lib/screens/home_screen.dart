import 'package:flutter/material.dart';
import 'package:websockets/responsive/responsive.dart';
import 'package:websockets/screens/createRoom.dart';
import 'package:websockets/screens/joinRoomScreen.dart';
import 'package:websockets/utils/custom_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Responsive(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomButton(onPressed: () {
                Navigator.pushNamed(context, "/JoinnRoom");
              }, text: 'Join Room'),
              CustomButton(onPressed: () {
                Navigator.pushNamed(context, "/CreateeRoom");
              }, text: 'Create Room'),
            ],
          ),
        ),
      ),
    );
  }
}