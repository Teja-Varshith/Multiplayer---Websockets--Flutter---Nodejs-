import 'package:flutter/material.dart';

class RoomDataProvider extends ChangeNotifier{
  Map<String,dynamic> _data = {};
  Map<String,dynamic> get roomData => _data;

  void updateRoom(Map<String,dynamic> data) {
    _data = data;
    notifyListeners();
  }

}