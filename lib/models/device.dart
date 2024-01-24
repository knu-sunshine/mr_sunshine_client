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

  Device.deviceAdd({
    this.deviceID = "add",
    this.name = "Add Device",
    this.deviceCategory = DeviceCategory.addDdevice,
    required this.roomId,
    required this.roomName,
    this.isOn = false,
    this.deviceValue = 0,
    this.wakeUpValue = 0,
  });
}
