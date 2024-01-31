import 'package:get/get.dart';
import 'package:mr_sunshine_client/bloc/home_view_model.dart';
import 'package:mr_sunshine_client/models/device.dart';

import 'package:mr_sunshine_client/models/room.dart';
import 'package:mr_sunshine_client/repository/device_repository.dart';
import 'package:mr_sunshine_client/repository/room_repository.dart';

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
    switch (room.value.status) {
      case RoomOnOffStatus.on:
      case RoomOnOffStatus.off:
        return await RoomRepository.setAutoOn(roomId: room.value.roomId)
            .then((value) {
          if (value) {
            room.value.status = RoomOnOffStatus.auto;
            room.refresh();
            return true;
          }
          return false;
        });
      case RoomOnOffStatus.auto:
        return await RoomRepository.setAutoOff(roomId: room.value.roomId)
            .then((value) {
          if (value) {
            room.value.status = RoomOnOffStatus.off;
            room.refresh();
            return true;
          }
          return false;
        });
      default:
        return false;
    }
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
          device.deviceValue = 0;
          deviceList.refresh();
        }
        return val;
      });
    } else {
      res = await DeviceRepository.turnOnDevice(deviceId: device.deviceID)
          .then((val) {
        if (val) {
          device.isOn = true;
          device.deviceValue = 100;
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

  Future<bool> toggleDeviceWakeUpOnOff(String deviceID) async {
    Device? device =
        deviceList.firstWhereOrNull((element) => element.deviceID == deviceID);
    if (device == null) {
      return false;
    }
    bool res = false;
    if (device.isWakeUpOn == true) {
      res =
          await DeviceRepository.turnOffDeviceWakeUp(deviceId: device.deviceID)
              .then((val) {
        if (val) {
          device.isWakeUpOn = false;
          deviceList.refresh();
        }
        return val;
      });
    } else {
      res = await DeviceRepository.turnOnDeviceWakeUp(deviceId: device.deviceID)
          .then((val) {
        if (val) {
          device.isWakeUpOn = true;
          deviceList.refresh();
        }
        return val;
      });
    }
    return res;
  }

  Future<bool> testWakeUpValue(String deviceID, int value) async {
    Device? device =
        deviceList.firstWhereOrNull((element) => element.deviceID == deviceID);
    if (device == null) {
      return false;
    }
    bool res = await DeviceRepository.testWakeUpValue(
        deviceId: device.deviceID, value: value);
    return res;
  }

  Future<bool> setWakeUpValue(String deviceID, int value) async {
    Device? device =
        deviceList.firstWhereOrNull((element) => element.deviceID == deviceID);
    if (device == null) {
      return false;
    }
    bool res = await DeviceRepository.setWakeUpValue(
            deviceId: device.deviceID, value: value)
        .then((val) {
      if (val) {
        device.wakeUpValue = value;
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
