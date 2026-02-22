import 'package:flutter/material.dart';
import 'package:websockets/models/players.dart';

class RoomDataProvider extends ChangeNotifier{
  Map<String,dynamic> _data = {};
  Map<String,dynamic> get roomData => _data;
  
  Players _player1 = Players(nickName: '', socketId: '', points: 0, playerType: 'X');
  Players _player2 = Players(nickName: '', socketId: '', points: 0, playerType: 'o');

  Players get player1 => _player1;
  Players get player2 => _player2;

  void updateRoom(Map<String,dynamic> data) {
    _data = data;
    notifyListeners();
  }

  

  void updatePlayer1(Map<String,dynamic> data){
    _player1 = Players.fromMap(data);
    notifyListeners();
  }

  void updatePlayer2(Map<String,dynamic> data){
    _player2 = Players.fromMap(data);
    notifyListeners();
  }

}