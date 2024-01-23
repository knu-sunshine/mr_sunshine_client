import 'package:get/get.dart';

import 'package:mr_sunshine_client/models/room.dart';
import 'package:mr_sunshine_client/ui/components/public/buttons.dart';

class HomeController extends GetxController {
  RxList<Room> rooms = <Room>[
    Room(
        roomId: "1",
        roomName: "Living room",
        status: RoomOnOffStatus.auto,
        category: RoomCategory.livingRoom),
    Room(
        roomId: "2",
        roomName: "Bedroom",
        status: RoomOnOffStatus.auto,
        category: RoomCategory.livingRoom),
    Room(
        roomId: "3",
        roomName: "Kitchen",
        status: RoomOnOffStatus.auto,
        category: RoomCategory.livingRoom),
  ].obs;

  Future<bool> toggleRoomLightByRoomId(String roomId) async {
    Room? selectedRoom =
        rooms.firstWhereOrNull((element) => element.roomId == roomId);

    if (selectedRoom == null) {
      return false;
    }

    switch (selectedRoom.status) {
      case RoomOnOffStatus.auto:
        selectedRoom.status = RoomOnOffStatus.on;
        break;
      case RoomOnOffStatus.on:
        selectedRoom.status = RoomOnOffStatus.off;
        break;
      case RoomOnOffStatus.off:
        selectedRoom.status = RoomOnOffStatus.on;
        break;
      default:
        break;
    }

    rooms.refresh();

    return true;
  }

  Future<bool> addRoom() async {
    print("add Room");

    rooms.refresh();

    return true;
  }

  Future<bool> goToRoom(Room room) async {
    print(room.roomId);

    rooms.refresh();

    return true;
  }
}
