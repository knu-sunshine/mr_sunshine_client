import 'package:http/http.dart' as http;

import 'package:mr_sunshine_client/models/device.dart';
import 'package:mr_sunshine_client/network_provider/device_network_provider.dart';

class DeviceRepository {
  static Future<List<Device>?> getDeviceList({
    required String roomId,
  }) async {
    try {
      http.Response response = await DeviceNetworkProvider.getDeviceList(
        roomId: roomId,
      );
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
      List<Device> newDeviceList = deviceListFromJson(response.body);
      return newDeviceList;
    } catch (error) {
      return null;
    }
  }

  static Future<Device?> addDevice({
    required String roomId,
    required String deviceId,
    required String deviceName,
  }) async {
    try {
      http.Response response = await DeviceNetworkProvider.addDevice(
        roomId: roomId,
        deviceId: deviceId,
        deviceName: deviceName,
      );
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

      Device device = deviceFromJson(response.body);
      return device;
    } catch (error) {
      print(error);
      return null;
    }
  }

  static Future<bool> turnOnDevice({
    required String deviceId,
  }) async {
    try {
      http.Response response = await DeviceNetworkProvider.turnOnDevice(
        deviceId: deviceId,
      );
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
      return true;
    } catch (error) {
      return false;
    }
  }

  static Future<bool> turnOffDevice({
    required String deviceId,
  }) async {
    try {
      http.Response response = await DeviceNetworkProvider.turnOffDevice(
        deviceId: deviceId,
      );
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
      return true;
    } catch (error) {
      return false;
    }
  }

  static Future<bool> setDeviceValue({
    required String deviceId,
    required int value,
  }) async {
    try {
      http.Response response = await DeviceNetworkProvider.setDeviceValue(
        deviceId: deviceId,
        value: value,
      );
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
      return true;
    } catch (error) {
      return false;
    }
  }

  static Future<bool> testWakeUpValue({
    required String deviceId,
    required int value,
  }) async {
    try {
      http.Response response = await DeviceNetworkProvider.testWakeUpValue(
        deviceId: deviceId,
        value: value,
      );
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
      return true;
    } catch (error) {
      print(error);
      return false;
    }
  }

  static Future<bool> setWakeUpValue({
    required String deviceId,
    required int value,
  }) async {
    try {
      http.Response response = await DeviceNetworkProvider.setWakeUpValue(
        deviceId: deviceId,
        value: value,
      );
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
      return true;
    } catch (error) {
      print(error);
      return false;
    }
  }
}
