import 'package:flutter/material.dart';
import 'package:websockets/responsive/responsive.dart';
import 'package:websockets/screens/gameScreen.dart';
import 'package:websockets/sockt_method.dart';
import 'package:websockets/utils/custom_button.dart';
import 'package:websockets/utils/custom_field.dart';
import 'package:websockets/utils/custom_text.dart';

class Joinroomscreen extends StatefulWidget {
  const Joinroomscreen({super.key});

  @override
  State<Joinroomscreen> createState() => _JoinroomscreenState();
}

class _JoinroomscreenState extends State<Joinroomscreen> {
  final TextEditingController _roomIdController = new TextEditingController();
  final TextEditingController _nameController = new TextEditingController();
  final SocketMethods _socketMethods = SocketMethods();

  @override
  void initState() {
    super.initState();
    _socketMethods.joinRoomSucessListeners(context);
  }



  @override
  Widget build(BuildContext context) {
    
    
    return Scaffold(
      body: Responsive(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:
            [
               CustomText(shadows: [Shadow(blurRadius: 50,color: Colors.blue)], text: 'Join Room', fontSize: 69),
               CustomField(controller: _roomIdController, text: "Enter Room Code"),
               CustomField(controller: _nameController, text: "Enter NickNme"),
               CustomButton(onPressed: () {
                  _socketMethods.JoinRoom(_roomIdController.text, _nameController.text);
               }, text: "Join Room")
            ]
          ),
        ),
      ),
    );
  }
}