import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
              children: [
                roomListElement(),
                roomListElement(),
                roomListElement(),
                roomListElement(type: RoomType.addRoom),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
