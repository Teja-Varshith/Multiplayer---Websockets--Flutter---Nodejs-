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
    _socketMethods.updatePlayerListner(context);
    _socketMethods.onTapListner(context);
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    final RoomDataProvider roomData = Provider.of<RoomDataProvider>(context);
    return Scaffold(
      body:  (roomData.roomData['isJoin']) ? CircularProgressIndicator() :
       SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("${roomData.player1.nickName}"),
                  Text(roomData.player1.points.toInt().toString()),
                  SizedBox(width: 10,),
                  Text("${roomData.player2.nickName}"),
                  Text(roomData.player2.points.toInt().toString()),
                ],
              ),

              ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.height * 0.7,
                  maxWidth: 500,
                ),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                  itemCount: 9,
                   itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                         _socketMethods.onTap(index, roomData.roomData['_id'], roomData.allElement);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.white
                          )
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(50),
                          child: Center(
                            child: Text(
                              roomData.allElement[index],
                              style: TextStyle(fontSize: 50),
                            )
                          ),
                        ),
                      ),
                    );
                   }
                  ),
              )
            ],
          ),
        ),
       ),
    );
  }
}