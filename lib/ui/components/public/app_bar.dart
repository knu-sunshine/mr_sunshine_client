import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mr_sunshine_client/constants/colors.dart';

Widget appBar() {
  return Container(
    width: 393.w,
    height: 87.h,
    padding: EdgeInsets.only(
      top: 30.h,
      left: 28.w,
    ),
    child: Text(
      "Andrew's HOME",
      style: TextStyle(
        fontSize: 24.sp,
        fontWeight: FontWeight.w700,
        color: AppColor.black,
      ),
    ),
  );
}
