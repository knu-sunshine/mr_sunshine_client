enum DeviceCategory { light, curtain, addDdevice }

class Device {
  String deviceID;
  String name;
  DeviceCategory deviceCategory;

  bool isOn;
  double deviceValue;
  double wakeUpValue;

  Device(
      {required this.deviceID,
      required this.name,
      required this.deviceCategory,
      required this.isOn,
      required this.deviceValue,
      required this.wakeUpValue});
}
