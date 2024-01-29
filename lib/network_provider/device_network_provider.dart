import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class DeviceNetworkProvider {
  static Future<http.Response> getDeviceList({required String roomId}) async {
    final response = await http.get(
      Uri.parse(
          "${dotenv.env["SERVER_BASE_URL"]}/room/getDeviceList?roomId=$roomId"),
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
      },
    );
    print("[fetch] get device list : " + response.statusCode.toString());
    return response;
  }

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

  static Future<http.Response> turnOnDevice({required String deviceId}) async {
    final response =
        await http.post(Uri.parse("${dotenv.env["SERVER_BASE_URL"]}/device/on"),
            headers: {
              "Content-Type": "application/json",
              "Accept": "application/json",
            },
            body: jsonEncode({
              "deviceId": deviceId,
            }));
    print("[fetch] turn on device : " + response.statusCode.toString());
    return response;
  }

  static Future<http.Response> turnOffDevice({required String deviceId}) async {
    final response = await http.post(
        Uri.parse("${dotenv.env["SERVER_BASE_URL"]}/device/off"),
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
        },
        body: jsonEncode({
          "deviceId": deviceId,
        }));
    print("[fetch] turn off device : " + response.statusCode.toString());
    return response;
  }

  static Future<http.Response> setDeviceValue(
      {required String deviceId, required int value}) async {
    final response = await http.post(
        Uri.parse("${dotenv.env["SERVER_BASE_URL"]}/device/setValue"),
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
        },
        body: jsonEncode({
          "deviceId": deviceId,
          "value": value,
        }));
    print("[fetch] set device value : " + response.statusCode.toString());
    return response;
  }

  static Future<http.Response> testWakeUpValue(
      {required String deviceId, required int value}) async {
    final response = await http.get(
      Uri.parse(
          "${dotenv.env["SERVER_BASE_URL"]}/device/testWakeUpValue?deviceId=$deviceId&value=$value"),
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
      },
    );
    print("[fetch] test wake up value : " + response.statusCode.toString());
    return response;
  }

  static Future<http.Response> setWakeUpValue(
      {required String deviceId, required int value}) async {
    final response = await http.post(
        Uri.parse("${dotenv.env["SERVER_BASE_URL"]}/device/setWakeUpValue"),
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
        },
        body: jsonEncode({
          "deviceId": deviceId,
          "value": value,
        }));
    print("[fetch] set wake up value : " + response.statusCode.toString());
    return response;
  }
}
