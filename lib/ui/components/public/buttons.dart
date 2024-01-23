import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:mr_sunshine_client/constants/colors.dart';
import 'package:mr_sunshine_client/models/device.dart';
import 'package:mr_sunshine_client/models/room.dart';

//// on Off Toggle button
Widget onOffToggle(
    {required RoomOnOffStatus status, required void Function() onClick}) {
  return GestureDetector(
    onTap: onClick,
    child: Container(
      width: 27.w,
      height: 27.w,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: AppColor.black.withOpacity(0.3),
          ),
          BoxShadow(
            color: {
                  RoomOnOffStatus.on: AppColor.primary,
                  RoomOnOffStatus.off: AppColor.surfaceStroke,
                  RoomOnOffStatus.auto: AppColor.surfaceStroke,
                }[status] ??
                AppColor.surfaceStroke,
            offset: Offset(0, 1.w),
            spreadRadius: -0.5.r,
            blurRadius: 1.r,
          ),
        ],
      ),
      alignment: Alignment.center,
      child: Text(
        {
              RoomOnOffStatus.on: "On",
              RoomOnOffStatus.off: "Off",
              RoomOnOffStatus.auto: "Auto",
            }[status] ??
            "",
        style: TextStyle(
          fontSize: 9.sp,
          fontWeight: FontWeight.w300,
          color: AppColor.black,
          height: 1.0,
        ),
      ),
    ),
  );
}

////
Widget onOffSwitch(
    {required RoomOnOffStatus status, required void Function(bool) onClick}) {
  return Switch(
    value: status == RoomOnOffStatus.on,
    onChanged: onClick,
    activeColor: AppColor.surface,
    activeTrackColor: AppColor.primary,
    // inactiveThumbColor: AppColor.surface,
    inactiveTrackColor: AppColor.inActive,
  );
}

////
Widget confirmButton(void Function() onClick) {
  return ElevatedButton(
      onPressed: onClick,
      style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          fixedSize: Size(103.w, 34.h),
          backgroundColor: AppColor.surface,
          foregroundColor: AppColor.primary,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.r),
              side: BorderSide(color: AppColor.surfaceStroke, width: 1.w))),
      child: Text(
        "Confirm",
        style: TextStyle(
          color: AppColor.black,
          fontSize: 15.sp,
          fontWeight: FontWeight.w500,
        ),
      ));
}

//// cancel button
Widget cancelButton() {
  return GestureDetector(
    onTap: () {
      Get.back();
    },
    child: Image.asset(
      "assets/icons/public/cancel.png",
      width: 24.w,
    ),
  );
}

//// long bar button
Widget barButton({
  Widget? prefix,
  Widget? suffix,
  required String text,
  Function()? onPressed,
  required double fontSize,
  required double height,
}) {
  return ElevatedButton(
    onPressed: onPressed,
    style: ElevatedButton.styleFrom(
      alignment: Alignment.center,
      fixedSize: Size(332.w, height),
      backgroundColor: AppColor.surface,
      foregroundColor: AppColor.primary,
      padding: EdgeInsets.symmetric(horizontal: 18.w),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.r),
        side: BorderSide(
          color: AppColor.surfaceStroke,
          width: 0.3.w,
        ),
      ),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ...(prefix != null
            ? [
                SizedBox(
                  width: 27.w,
                  height: 27.w,
                  child: prefix,
                ),
              ]
            : []),
        SizedBox(
          width: 194.w,
          child: Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: fontSize,
              color: AppColor.black,
            ),
          ),
        ),
        SizedBox(
          width: 27.w,
          height: 27.w,
          child: suffix,
        ),
      ],
    ),
  );
}

////
Widget deviceOnOffButton({required Device device}) {
  Widget deviceIcon = {
        DeviceCategory.light: Align(
          alignment: Alignment.topCenter,
          child: Image.asset(
            "assets/icons/device/light.png",
            width: 41.w,
          ),
        ),
        DeviceCategory.curtain: Align(
          alignment: Alignment.center,
          child: Image.asset(
            "assets/icons/device/curtain.png",
            width: 30.w,
          ),
        ),
        DeviceCategory.addDdevice: Align(
          alignment: Alignment.center,
          child: Image.asset(
            "assets/icons/public/add.png",
            width: 15.w,
          ),
        ),
      }[device.deviceCategory] ??
      Container();

  return AnimatedContainer(
    duration: Duration(milliseconds: 75),
    curve: Curves.easeOut,
    width: 69.w,
    height: 69.w,
    decoration: BoxDecoration(
      boxShadow: device.isOn
          ? [
              BoxShadow(
                color: AppColor.black.withOpacity(0.3),
              ),
              BoxShadow(
                color: AppColor.primary,
                offset: Offset(0, 2.w),
                spreadRadius: -2.r,
                blurRadius: 3.r,
              ),
            ]
          : [
              BoxShadow(
                color: AppColor.black.withOpacity(0.08),
                offset: Offset(0, 1.5.w),
                spreadRadius: 1.5.r,
                blurRadius: 1.5.r,
              ),
              BoxShadow(
                color: AppColor.surface,
              ),
            ],
      shape: BoxShape.circle,
    ),
    child: deviceIcon,
  );
}
