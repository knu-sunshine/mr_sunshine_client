import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mr_sunshine_client/bloc/room_view_model.dart';
import 'package:mr_sunshine_client/models/device.dart';
import 'package:mr_sunshine_client/ui/components/public/texts.dart';
import 'package:mr_sunshine_client/ui/components/room/device_list_element.dart';

Widget deviceList({
  required String selectedDeviceId,
  required void Function(String deviceID) setDeviceID,
}) {
  return SizedBox(
    width: 334.w,
    height: 143.h,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        subTitleWithIcon(
            text: "Devices",
            iconUrl: "assets/icons/room/device_list.png",
            iconWidth: 13.8.w),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: Get.find<RoomController>().deviceList.map((element) {
                  return deviceListElement(
                    device: element,
                    setDeviceID: setDeviceID,
                    selected: selectedDeviceId == element.deviceID,
                  );
                }).toList() +
                [
                  deviceListElement(
                    device: Device.deviceAdd(
                      roomId: Get.find<RoomController>().room.value.roomId,
                      roomName: Get.find<RoomController>().room.value.roomName,
                    ),
                    selected: false,
                  ),
                ],
          ),
        )
      ],
    ),
  );
}
