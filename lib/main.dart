import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:websockets/constants/constants.dart';
import 'package:websockets/provider/room_prodr.dart';
import 'package:websockets/screens/createRoom.dart';
import 'package:websockets/screens/gameScreen.dart';
import 'package:websockets/screens/home_screen.dart';
import 'package:websockets/screens/joinRoomScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RoomDataProvider(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: const Color.fromARGB(255, 37, 31, 31)),
        home: HomeScreen(),
        routes: {
          "/CreateeRoom": (context) => Createroom(),
          "/JoinnRoom": (context) => Joinroomscreen(),
          "/gameRoom": (context) => Gamescreen(),
        },
      ),
    );
  }
}

