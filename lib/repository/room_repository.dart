import 'package:get/get.dart';

import 'package:http/http.dart' as http;

import 'package:mr_sunshine_client/bloc/user_view_model.dart';
import 'package:mr_sunshine_client/models/room.dart';
import 'package:mr_sunshine_client/network_provider/room_network_provider.dart';

class RoomRepository {
  static Future<List<Room>?> getRoomList() async {
    try {
      http.Response response = await RoomNetworkProvider.getRoomList(
          userId: Get.find<UserController>().user.userId);
      switch (response.statusCode) {
        case 200:
          break;
        case 401:
          throw Exception("Unauthorized");
        case 500:
          throw Exception("Internal Server Error");
        default:
          throw Exception("Unknown Error");
      }
      List<Room> newRoomList = roomListFromJson(response.body);
      return newRoomList;
    } catch (error) {
      return null;
    }
  }

  static Future<Room?> addRoom({required String roomName}) async {
    try {
      http.Response response = await RoomNetworkProvider.addRoom(
          roomName: roomName, userId: Get.find<UserController>().user.userId);
      switch (response.statusCode) {
        case 201:
          break;
        case 401:
          throw Exception("Unauthorized");
        case 500:
          throw Exception("Internal Server Error");
        default:
          throw Exception("Unknown Error");
      }

      Room room = roomFromJson(response.body);
      return room;
    } catch (error) {
      return null;
    }
  }
}
