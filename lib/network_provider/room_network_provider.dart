import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class RoomNetworkProvider {
  static Future<http.Response> getRoomList({required String userId}) async {
    final response = await http.get(
      Uri.parse("${dotenv.env["SERVER_BASE_URL"]}/getroomlist?userId=$userId"),
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
      },
    );
    print("[fetch] get room list : " + response.statusCode.toString());
    return response;
  }

  static Future<http.Response> addRoom(
      {required String userId, required String roomName}) async {
    final response =
        await http.post(Uri.parse("${dotenv.env["SERVER_BASE_URL"]}/addroom"),
            headers: {
              "Content-Type": "application/json",
              "Accept": "application/json",
            },
            body: jsonEncode({
              "userId": userId,
              "roomName": roomName,
            }));
    print("[fetch] add room : " + response.statusCode.toString());
    return response;
  }
}
