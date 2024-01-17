import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:mr_sunshine_client/bloc/home_view_model.dart';
import 'package:mr_sunshine_client/models/room.dart';
import 'package:mr_sunshine_client/ui/components/home/room_list_element.dart';
import 'package:mr_sunshine_client/ui/components/public/titles.dart';

Widget roomList() {
  return Container(
    width: 332.w,
    height: 313.h,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        subTitleWithSVGIcon(
            text: "Rooms",
            iconUrl: "assets/icons/room/room.svg",
            iconWidth: 14.41.w),
        Container(
          width: 332.w,
          height: 265.h,
          child: SingleChildScrollView(
            child: Column(
              children: Get.find<HomePageController>()
                      .rooms
                      .map((room) => roomListElement(room))
                      .toList() +
                  [
                    roomListElement(Room.addRoom()),
                  ],
            ),
          ),
        ),
      ],
    ),
  );
}
