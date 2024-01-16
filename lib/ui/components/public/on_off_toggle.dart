import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mr_sunshine_client/constants/colors.dart';

enum OnOffStatus {
  on,
  off,
  auto,
}

Widget onOffToggle(OnOffStatus status) {
  return Container(
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
                OnOffStatus.on: AppColor.primary,
                OnOffStatus.off: AppColor.surfaceStroke,
                OnOffStatus.auto: AppColor.surfaceStroke,
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
            OnOffStatus.on: "On",
            OnOffStatus.off: "Off",
            OnOffStatus.auto: "Auto",
          }[status] ??
          "",
      style: TextStyle(
        fontSize: 9.sp,
        fontWeight: FontWeight.w300,
        color: AppColor.black,
        height: 1.0,
      ),
    ),
  );
}
