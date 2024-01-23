import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mr_sunshine_client/constants/colors.dart';

Widget appBar({required String title, Widget? suffixWidget}) {
  return Container(
    width: 393.w,
    height: 87.h,
    padding: EdgeInsets.only(
      top: 36.h,
      left: 28.w,
      right: 28.w,
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 24.sp,
            fontWeight: FontWeight.w700,
            color: AppColor.black,
          ),
        ),
        suffixWidget ?? Container(),
      ],
    ),
  );
}
