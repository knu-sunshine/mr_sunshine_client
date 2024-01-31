import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mr_sunshine_client/bloc/room_view_model.dart';
import 'package:mr_sunshine_client/ui/components/public/buttons.dart';
import 'package:mr_sunshine_client/ui/components/public/texts.dart';

Widget autoToggle() {
  return SizedBox(
    width: 334.w,
    height: 27.h,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        subTitleWithIcon(
            text: "Auto",
            iconUrl: "assets/icons/room/auth.png",
            iconWidth: 16.w),
        onOffSwitch(
            status: Get.find<RoomController>().room.value.status,
            onClick: (val) {
              Get.find<RoomController>().toggleAuto();
            }),
      ],
    ),
  );
}
