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
  //deviceList

  Room(
      {required this.roomId,
      required this.roomName,
      required this.status,
      required this.category});

  Room.addRoom({
    this.roomId = "",
    this.roomName = "Add Room",
    this.status = RoomOnOffStatus.none,
    this.category = RoomCategory.addRoom,
  });
}
