import 'package:flutter/material.dart';
import 'package:websockets/responsive/responsive.dart';
import 'package:websockets/screens/gameScreen.dart';
import 'package:websockets/sockt_method.dart';
import 'package:websockets/utils/custom_button.dart';
import 'package:websockets/utils/custom_field.dart';
import 'package:websockets/utils/custom_text.dart';

class Createroom extends StatefulWidget {
  const Createroom({super.key});

  @override
  State<Createroom> createState() => _CreateroomState();
}

class _CreateroomState extends State<Createroom> {
  final TextEditingController _controller = TextEditingController();
  final SocketMethods _socketMethods = SocketMethods();

  @override
  void initState() {
    super.initState();
    _socketMethods.roomCreateListn(context);
    _socketMethods.joinRoomSucessListeners(context);
    _socketMethods.updatePlayerListner(context);
    
  }

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      body: Responsive(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomText(
                shadows: [Shadow(blurRadius: 50, color: Colors.blue)],
                text: 'Create Room',
                fontSize: 69,
              ),
              CustomField(controller: _controller, text: "Enter Name"),
              CustomButton(
                onPressed: () {
                  _socketMethods.createRoom(_controller.text);
                },
                text: "Create Room",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
