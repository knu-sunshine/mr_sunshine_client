import 'package:http/http.dart' as http;

import 'package:mr_sunshine_client/models/device.dart';
import 'package:mr_sunshine_client/network_provider/device_network_provider.dart';

class DeviceRepository {
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

      print(response.body);

      Device device = deviceFromJson(response.body);
      return device;
    } catch (error) {
      print(error);
      return null;
    }
  }
}
