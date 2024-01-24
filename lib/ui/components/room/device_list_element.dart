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
      if (device.deviceCategory == DeviceCategory.addDdevice) {
        Get.dialog(
          const TextInputModal(
            title: "Add Device",
            subscription: "Enter the name of the device",
            fields: ["device Id", "device name"],
          ),
        );
      } else {
        Get.find<RoomController>().toggleDeviceOnOff(device.deviceID);
        if (setDeviceID != null) {
          setDeviceID(device.deviceID);
        }
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
