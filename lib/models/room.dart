import 'dart:convert';

enum RoomCategory {
  livingRoom,
  addRoom,
}

enum RoomOnOffStatus { on, off, auto, none }

class Room {
  String roomId;
  String roomName;
  RoomOnOffStatus status;
  RoomCategory category;
  int lightValue;
  //deviceList

  Room({
    required this.roomId,
    required this.roomName,
    required this.status,
    required this.category,
    required this.lightValue,
  });

  factory Room.addRoom() => Room(
        roomId: "",
        roomName: "Add Room",
        status: RoomOnOffStatus.none,
        category: RoomCategory.addRoom,
        lightValue: 0,
      );

  factory Room.fromJson(Map<String, dynamic> json) {
    late RoomOnOffStatus status;
    if (json["isAutoMode"]) {
      status = RoomOnOffStatus.auto;
    } else if (json["isRoomLightOn"]) {
      status = RoomOnOffStatus.on;
    } else {
      status = RoomOnOffStatus.off;
    }
    return Room(
        roomId: json["roomId"],
        roomName: json["roomName"],
        status: status,
        category: RoomCategory.livingRoom,
        lightValue: json["lightValue"] as int);
  }
}

Room roomFromJson(String str) => Room.fromJson(json.decode(str));

List<Room> roomListFromJson(String str) {
  return List<Room>.from(json.decode(str).map((x) => Room.fromJson(x)));
}
