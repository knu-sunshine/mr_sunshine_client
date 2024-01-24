import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:mr_sunshine_client/bloc/home_view_model.dart';
import 'package:mr_sunshine_client/models/room.dart';
import 'package:mr_sunshine_client/ui/components/home/room_list_element.dart';
import 'package:mr_sunshine_client/ui/components/public/texts.dart';

Widget roomList() {
  return SizedBox(
    width: 332.w,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        subTitleWithIcon(
            text: "Rooms",
            iconUrl: "assets/icons/room/room.png",
            iconWidth: 14.41.w),
        SizedBox(
          height: 25.h,
        ),
        SizedBox(
          width: 332.w,
          child: Column(
            children: Get.find<HomeController>()
                    .rooms
                    .map((room) => roomListElement(room))
                    .toList() +
                [
                  roomListElement(Room.addRoom()),
                ],
          ),
        ),
      ],
    ),
  );
}
