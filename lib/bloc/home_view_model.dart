import 'package:get/get.dart';

import 'package:mr_sunshine_client/models/room.dart';
import 'package:mr_sunshine_client/ui/components/public/on_off_toggle.dart';

class HomePageController extends GetxController {
  RxList<Room> rooms = <Room>[
    Room(
        roomId: "1",
        roomName: "Living room",
        status: Status.auto,
        type: RoomType.livingRoom),
    Room(
        roomId: "2",
        roomName: "Bedroom",
        status: Status.auto,
        type: RoomType.livingRoom),
    Room(
        roomId: "3",
        roomName: "Kitchen",
        status: Status.auto,
        type: RoomType.livingRoom),
  ].obs;

  Future<bool> toggleRoomLightByRoomId(String roomId) async {
    Room? selectedRoom =
        rooms.firstWhereOrNull((element) => element.roomId == roomId);

    if (selectedRoom == null) {
      return false;
    }

    switch (selectedRoom.status) {
      case Status.auto:
        selectedRoom.status = Status.on;
        break;
      case Status.on:
        selectedRoom.status = Status.off;
        break;
      case Status.off:
        selectedRoom.status = Status.on;
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
