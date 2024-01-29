import 'dart:convert';

enum DeviceCategory { light, curtain, sensor, addDdevice, none }

class Device {
  String deviceID;
  String name;
  DeviceCategory deviceCategory;
  String roomId;

  bool isOn;
  int deviceValue;
  bool isWakeUpOn;
  int wakeUpValue;

  Device(
      {required this.deviceID,
      required this.name,
      required this.deviceCategory,
      required this.roomId,
      required this.isOn,
      required this.deviceValue,
      required this.isWakeUpOn,
      required this.wakeUpValue});

  factory Device.fromJson(Map<String, dynamic> json) {
    DeviceCategory category = {
          "Light": DeviceCategory.light,
          "Curtain": DeviceCategory.curtain,
          "Sensor": DeviceCategory.sensor,
        }[json["deviceCategory"]] ??
        DeviceCategory.none;
    return Device(
      deviceID: json["deviceId"],
      name: json["deviceName"],
      deviceCategory: category,
      roomId: json["roomId"],
      isOn: json["isdeviceOn"] as bool,
      deviceValue: json["deviceStatus"] as int,
      isWakeUpOn: json["isWakeUpOn"] as bool,
      wakeUpValue: json["wakeUpValue"] as int,
    );
  }
  factory Device.deviceAdd({
    required String roomId,
    required String roomName,
  }) =>
      Device(
        deviceID: "add",
        name: "Add Device",
        deviceCategory: DeviceCategory.addDdevice,
        roomId: roomId,
        isOn: false,
        deviceValue: 0,
        isWakeUpOn: false,
        wakeUpValue: 0,
      );
}

Device deviceFromJson(String str) => Device.fromJson(json.decode(str));

List<Device> deviceListFromJson(String str) {
  return List<Device>.from(json.decode(str).map((e) => Device.fromJson(e)));
}
