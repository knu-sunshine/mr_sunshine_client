import 'package:get/get.dart';
import 'package:mr_sunshine_client/models/device.dart';

import 'package:mr_sunshine_client/models/room.dart';
import 'package:mr_sunshine_client/repository/device_repository.dart';

class RoomController extends GetxController {
  Rx<Room> room = Room(
    roomId: "r1",
    roomName: "chan",
    category: RoomCategory.livingRoom,
    status: RoomOnOffStatus.auto,
    lightValue: 50,
  ).obs;

  Future<bool> toggleAuto() async {
    room.update((val) {
      if (val == null) return;
      switch (val.status) {
        case RoomOnOffStatus.on:
        case RoomOnOffStatus.off:
          val.status = RoomOnOffStatus.auto;
          break;
        case RoomOnOffStatus.auto:
          val.status = RoomOnOffStatus.on;
          break;
        default:
          break;
      }
    });
    return true;
  }

  ////devices

  RxList<Device> deviceList = <Device>[].obs;

  Future<bool> toggleDeviceOnOff(String deviceID) async {
    Device? device =
        deviceList.firstWhereOrNull((element) => element.deviceID == deviceID);
    if (device == null) {
      return false;
    }
    device.isOn = !device.isOn;

    deviceList.refresh();
    return true;
  }

  Future<bool> setDeviceValue(String deviceID, double value) async {
    print(value);
    return true;
  }

  String? getFirstDeviceID() {
    if (deviceList.isEmpty) {
      return null;
    } else {
      return deviceList.first.deviceID;
    }
  }

  Device? getDevice(String deviceID) {
    return deviceList
        .firstWhereOrNull((element) => element.deviceID == deviceID);
  }

  Future<bool> addDevice({
    required String deviceId,
    required String deviceName,
  }) async {
    Device? device = await DeviceRepository.addDevice(
      deviceId: deviceId,
      roomId: room.value.roomId,
      deviceName: deviceName,
    );
    if (device == null) {
      return false;
    }
    deviceList.add(device);
    deviceList.refresh();
    return true;
  }
}
