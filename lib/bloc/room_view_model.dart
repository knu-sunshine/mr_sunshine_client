import 'package:get/get.dart';
import 'package:mr_sunshine_client/models/device.dart';

import 'package:mr_sunshine_client/models/room.dart';

class RoomController extends GetxController {
  Rx<Room> room = Room(
    roomId: "1",
    roomName: "Living Room",
    category: RoomCategory.livingRoom,
    status: RoomOnOffStatus.auto,
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

  RxList<Device> deviceList = [
    Device(
      deviceCategory: DeviceCategory.light,
      deviceID: "1",
      name: "Light1",
      roomId: "1234",
      roomName: "1234",
      isOn: true,
      deviceValue: 50,
      wakeUpValue: 0,
    ),
    Device(
      deviceCategory: DeviceCategory.curtain,
      deviceID: "2",
      name: "Light1",
      roomId: "1234",
      roomName: "1234",
      isOn: true,
      deviceValue: 50,
      wakeUpValue: 0,
    )
  ].obs;

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
}
