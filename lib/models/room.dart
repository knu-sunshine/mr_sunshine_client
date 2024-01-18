import 'package:mr_sunshine_client/ui/components/public/buttons.dart';

enum RoomType {
  livingRoom,
  addRoom,
}

class Room {
  String roomId;
  String roomName;
  Status status;
  RoomType type;

  Room(
      {required this.roomId,
      required this.roomName,
      required this.status,
      required this.type});

  Room.addRoom({
    this.roomId = "",
    this.roomName = "Add Room",
    this.status = Status.none,
    this.type = RoomType.addRoom,
  });
}
