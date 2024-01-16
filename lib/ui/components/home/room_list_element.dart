import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:mr_sunshine_client/constants/colors.dart';
import 'package:mr_sunshine_client/ui/components/public/on_off_toggle.dart';

enum RoomType {
  livingRoom,
  addRoom,
}

Widget roomListElement({RoomType type = RoomType.livingRoom}) {
  return Container(
    width: 332.w,
    height: 58.h,
    margin: EdgeInsets.only(bottom: 10.h),
    padding: EdgeInsets.only(left: 18.w, right: 15.w),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(11.r),
      color: AppColor.surface,
      border: Border.all(
        color: AppColor.surfaceStroke,
        width: 0.3.w,
      ),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.08),
          spreadRadius: 0,
          blurRadius: 1,
          offset: const Offset(1, 1), // changes position of shadow
        ),
      ],
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        {
              RoomType.livingRoom:
                  _icon(url: "assets/icons/room/living_room.png", width: 25.w),
              RoomType.addRoom: _icon(url: "assets/icons/add.png", width: 15.w),
            }[type] ??
            SizedBox(
              width: 27.w,
            ),
        {
              RoomType.addRoom: _text("Add room"),
            }[type] ??
            _text("Living room"),
        {
              RoomType.livingRoom: onOffToggle(OnOffStatus.auto),
            }[type] ??
            SizedBox(
              width: 27.w,
            ),
      ],
    ),
  );
}

Widget _icon({required String url, required double width}) {
  return SizedBox(
    width: 27.w,
    child: Center(
      child: Image.asset(
        url,
        width: width,
      ),
    ),
  );
}

Widget _text(String text) {
  return Container(
    width: 197.w,
    alignment: Alignment.centerLeft,
    child: Text(
      text,
      style: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
        color: AppColor.black,
        height: 1.0,
      ),
    ),
  );
}
