import 'dart:convert';

enum DeviceCategory { light, curtain, addDdevice }

class Device {
  String deviceID;
  String name;
  DeviceCategory deviceCategory;
  String roomId;
  String roomName;

  bool isOn;
  double deviceValue;
  double wakeUpValue;

  Device(
      {required this.deviceID,
      required this.name,
      required this.deviceCategory,
      required this.roomId,
      required this.roomName,
      required this.isOn,
      required this.deviceValue,
      required this.wakeUpValue});

  factory Device.fromJson(Map<String, dynamic> json) => Device(
        deviceID: json["deviceId"],
        name: json["deviceName"],
        deviceCategory: DeviceCategory.light,
        roomId: json["roomId"],
        roomName: json["roomName"],
        isOn: json["isOn"],
        deviceValue: json["deviceValue"],
        wakeUpValue: json["wakeUpValue"],
      );

// {"deviceId":"L002",
// "currentStatus":0,
// "ifDeviceOn":false,
// "wakeUpDegree":0,
// "category":"Light",
// "roomId":"r1",
// "roomName":"chanroom"};

  factory Device.deviceAdd({
    required String roomId,
    required String roomName,
  }) =>
      Device(
        deviceID: "add",
        name: "Add Device",
        deviceCategory: DeviceCategory.addDdevice,
        roomId: roomId,
        roomName: roomName,
        isOn: false,
        deviceValue: 0,
        wakeUpValue: 0,
      );
}

Device deviceFromJson(String str) => Device.fromJson(json.decode(str));
