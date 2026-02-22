// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Players {
  final String nickName;
  final String socketId;
  final double points;
  final String playerType;
  Players({
    required this.nickName,
    required this.socketId,
    required this.points,
    required this.playerType,
  });

  Players copyWith({
    String? nickName,
    String? socketId,
    double? points,
    String? playerType,
  }) {
    return Players(
      nickName: nickName ?? this.nickName,
      socketId: socketId ?? this.socketId,
      points: points ?? this.points,
      playerType: playerType ?? this.playerType,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'nickName': nickName,
      'socketId': socketId,
      'points': points,
      'playerType': playerType,
    };
  }

  factory Players.fromMap(Map<String, dynamic> map) {
    return Players(
      nickName: map['nickName'] as String,
      socketId: map['socketId'] as String,
      points: map['points'] as double,
      playerType: map['playerType'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Players.fromJson(String source) => Players.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Players(nickName: $nickName, socketId: $socketId, points: $points, playerType: $playerType)';
  }


  @override
  bool operator ==(covariant Players other) {
    if (identical(this, other)) return true;
  
    return 
      other.nickName == nickName &&
      other.socketId == socketId &&
      other.points == points &&
      other.playerType == playerType;
  }

  @override
  int get hashCode {
    return nickName.hashCode ^
      socketId.hashCode ^
      points.hashCode ^
      playerType.hashCode;
  }
}
