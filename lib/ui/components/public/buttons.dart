import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mr_sunshine_client/constants/colors.dart';

//// on Off Toggle button
enum Status { on, off, auto, none }

Widget onOffToggle({required Status status, required void Function() onClick}) {
  return GestureDetector(
    onTap: onClick,
    child: Container(
      width: 27.w,
      height: 27.w,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: AppColor.black.withOpacity(0.08),
          ),
          BoxShadow(
            color: {
                  Status.on: AppColor.primary,
                  Status.off: AppColor.surfaceStroke,
                  Status.auto: AppColor.surfaceStroke,
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
              Status.on: "On",
              Status.off: "Off",
              Status.auto: "Auto",
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

//// cancel button

Widget cancelButton() {
  return GestureDetector(
    onTap: () {
      Get.back();
    },
    child: Image.asset(
      "assets/icons/cancel.png",
      width: 24.w,
    ),
  );
}
