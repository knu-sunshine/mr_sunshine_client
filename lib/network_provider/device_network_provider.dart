import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class DeviceNetworkProvider {
  static Future<http.Response> addDevice(
      {required String roomId,
      required String deviceId,
      required String deviceName}) async {
    final response = await http.post(
        Uri.parse("${dotenv.env["SERVER_BASE_URL"]}/room/addDevice"),
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
        },
        body: jsonEncode({
          "roomId": roomId,
          "deviceId": deviceId,
          "deviceName": deviceName,
        }));
    print("[fetch] add device : " + response.statusCode.toString());
    return response;
  }
}
