import 'package:get/get.dart';

import 'package:mr_sunshine_client/models/room.dart';
import 'package:mr_sunshine_client/models/sun_time.dart';
import 'package:mr_sunshine_client/repository/room_repository.dart';
import 'package:mr_sunshine_client/repository/sun_time_repository.dart';

class HomeController extends GetxController {
  RxList<Room> rooms = <Room>[].obs;

  Future<bool> toggleRoomLight(String roomId) async {
    Room? room = rooms.firstWhereOrNull((element) => element.roomId == roomId);
    if (room == null) {
      return false;
    }

    bool res = false;
    switch (room.status) {
      case RoomOnOffStatus.auto:
      case RoomOnOffStatus.off:
        res = await RoomRepository.turnOnRoom(roomId: roomId).then((value) {
          if (value) {
            room.status = RoomOnOffStatus.on;
            rooms.refresh();
          }
          return value;
        });
        break;
      case RoomOnOffStatus.on:
        res = await RoomRepository.turnOffRoom(roomId: roomId).then((value) {
          if (value) {
            room.status = RoomOnOffStatus.off;
            rooms.refresh();
          }
          return value;
        });
        break;
      default:
        break;
    }

    rooms.refresh();

    return res;
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

  Room getRoom(String roomId) {
    return rooms.firstWhere((element) => element.roomId == roomId);
  }

  //// sun time
  Rx<SunTime> sunTime = SunTime(
          sunrise: DateTime.now().copyWith(hour: 6),
          sunset: DateTime.now().copyWith(hour: 18))
      .obs;

  Future<bool> initSunTime() async {
    bool res = await SunTimeRepository.getSunTime().then((val) {
      if (val != null) {
        sunTime(val);
        return true;
      }
      return false;
    });
    return res;
  }
}
