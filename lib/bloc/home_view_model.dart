import 'package:get/get.dart';

import 'package:mr_sunshine_client/models/room.dart';
import 'package:mr_sunshine_client/repository/room_repository.dart';

class HomeController extends GetxController {
  RxList<Room> rooms = <Room>[].obs;

  Future<bool> toggleRoomLight(String roomId) async {
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

  Future<bool> getRoomList() async {
    final List<Room>? roomList = await RoomRepository.getRoomList();
    if (roomList == null) {
      return false;
    }
    rooms.value = roomList;
    rooms.refresh();
    return true;
  }

  Future<bool> addRoom(String roomName) async {
    final Room? room = await RoomRepository.addRoom(roomName: roomName);
    if (room == null) {
      return false;
    }
    rooms.add(room);

    rooms.refresh();
    return true;
  }

  Future<bool> goToRoom(Room room) async {
    print(room.roomId);

    rooms.refresh();

    return true;
  }
}
