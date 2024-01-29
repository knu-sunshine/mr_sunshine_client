import 'package:get/get.dart';
import 'package:mr_sunshine_client/bloc/home_view_model.dart';
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

  Future<bool> initRoom(String roomId) async {
    room.value = Get.find<HomeController>().getRoom(roomId);
    room.refresh();
    return true;
  }

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

  Future<bool> getDeviceList() async {
    List<Device>? newDeviceList =
        await DeviceRepository.getDeviceList(roomId: room.value.roomId);
    if (newDeviceList == null) {
      return false;
    }
    deviceList.value = newDeviceList;
    deviceList.refresh();
    return true;
  }

  Future<bool> toggleDeviceOnOff(String deviceID) async {
    Device? device =
        deviceList.firstWhereOrNull((element) => element.deviceID == deviceID);
    if (device == null) {
      return false;
    }
    bool res = false;
    if (device.isOn == true) {
      res = await DeviceRepository.turnOffDevice(deviceId: device.deviceID)
          .then((val) {
        if (val) {
          device.isOn = false;
          deviceList.refresh();
        }
        return val;
      });
    } else {
      res = await DeviceRepository.turnOnDevice(deviceId: device.deviceID)
          .then((val) {
        if (val) {
          device.isOn = true;
          deviceList.refresh();
        }
        return val;
      });
    }
    return res;
  }

  Future<bool> setDeviceValue(String deviceID, int value) async {
    Device? device =
        deviceList.firstWhereOrNull((element) => element.deviceID == deviceID);
    if (device == null) {
      return false;
    }
    bool res = await DeviceRepository.setDeviceValue(
            deviceId: device.deviceID, value: value)
        .then((val) {
      if (val) {
        device.deviceValue = value;
        deviceList.refresh();
        return true;
      }
      return false;
    });
    return res;
  }

  String? getFirstDeviceID() {
    if (deviceList.isEmpty) {
      return null;
    } else {
      return deviceList.first.deviceID;
    }
  }
}
