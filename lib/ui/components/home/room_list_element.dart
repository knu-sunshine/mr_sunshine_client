import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mr_sunshine_client/bloc/home_view_model.dart';

import 'package:mr_sunshine_client/constants/colors.dart';
import 'package:mr_sunshine_client/models/room.dart';
import 'package:mr_sunshine_client/ui/components/public/buttons.dart';
import 'package:mr_sunshine_client/ui/components/public/components.dart';
import 'package:mr_sunshine_client/ui/components/public/modal.dart';

Widget roomListElement(Room room) {
  Widget prefixIcon = {
        RoomCategory.livingRoom: icon(
            url: "assets/icons/room/living_room.png",
            width: 25.w,
            boxWidth: 27.w),
        RoomCategory.addRoom: icon(
            url: "assets/icons/public/add.png", width: 15.w, boxWidth: 27.w),
      }[room.category] ??
      SizedBox(
        width: 27.w,
      );

  Widget onOffButton = {
        RoomCategory.livingRoom: onOffToggle(
            status: room.status,
            onClick: () {
              Get.find<HomeController>().toggleRoomLightByRoomId(room.roomId);
            }),
      }[room.category] ??
      SizedBox(
        width: 27.w,
      );

  return Container(
    margin: EdgeInsets.only(bottom: 11.h),
    child: barButton(
        text: room.roomName,
        fontSize: 14.sp,
        height: 58.h,
        prefix: prefixIcon,
        suffix: onOffButton,
        onPressed: () {
          if (room.category == RoomCategory.addRoom) {
            Get.dialog(
                TextInputModal(
                  title: "Add Room",
                  subscription: "Enter the name of the room",
                  fields: [room.roomName],
                  onSubmit: (List<String> values) {
                    Get.find<HomeController>()
                        .addRoom(values[0])
                        .then((value) => Get.back());
                  },
                ),
                barrierColor: AppColor.black.withOpacity(0.3));
          } else {
            Get.find<HomeController>().goToRoom(room);
          }
        }),
  );
}
