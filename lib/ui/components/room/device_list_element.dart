import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mr_sunshine_client/bloc/room_view_model.dart';
import 'package:mr_sunshine_client/models/device.dart';
import 'package:mr_sunshine_client/ui/components/public/buttons.dart';
import 'package:mr_sunshine_client/ui/components/public/modal.dart';
import 'package:mr_sunshine_client/ui/components/public/texts.dart';

Widget deviceListElement(
    {required Device device,
    void Function(String deviceID)? setDeviceID,
    required bool selected}) {
  return GestureDetector(
    onTap: () {
      switch (device.deviceCategory) {
        case DeviceCategory.addDdevice:
          Get.dialog(
            TextInputModal(
              title: "Add Device",
              subscription: "Enter the name of the device",
              fields: const ["device Id", "device name"],
              onSubmit: (List<String> values) => {
                Get.find<RoomController>()
                    .addDevice(deviceId: values[0], deviceName: values[1])
                    .then((value) {
                  if (value) {
                    Get.back();
                  }
                })
              },
            ),
          );

          break;
        case DeviceCategory.sensor:
          break;
        default:
          Get.find<RoomController>().toggleDeviceOnOff(device.deviceID);
          if (setDeviceID != null) {
            setDeviceID(device.deviceID);
          }
          break;
      }
    },
    child: Container(
      width: 69.w,
      height: 88.h,
      margin: EdgeInsets.only(right: 20.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          deviceOnOffButton(device: device),
          elementDescription(device.name,
              fontWeight: selected ? FontWeight.w900 : FontWeight.w500),
        ],
      ),
    ),
  );
}
