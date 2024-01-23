import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:mr_sunshine_client/constants/colors.dart';

Widget subTitle(String text) {
  return Text(
    text,
    style: TextStyle(
      fontSize: 17.sp,
      fontWeight: FontWeight.w600,
      color: AppColor.black,
      height: 1.0,
    ),
  );
}

Widget miniSubTitle(String text) {
  return Text(
    text,
    style: TextStyle(
      fontSize: 10.sp,
      fontWeight: FontWeight.w500,
      color: AppColor.black.withOpacity(0.8),
      height: 1.0,
    ),
  );
}

Widget subTitleWithIcon(
    {required String text,
    required String iconUrl,
    required double iconWidth}) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Container(
        width: 17.w,
        alignment: Alignment.center,
        child: Image.asset(
          iconUrl,
          width: iconWidth,
        ),
      ),
      SizedBox(
        width: 11.w,
      ),
      Text(
        text,
        style: TextStyle(
          fontSize: 17.sp,
          fontWeight: FontWeight.w600,
          color: AppColor.black,
          height: 1.0,
        ),
      ),
    ],
  );
}

Widget modalTitle(String text) {
  return Text(
    text,
    style: TextStyle(
      fontSize: 30.sp,
      fontWeight: FontWeight.w700,
      color: AppColor.black,
      height: 1.0,
    ),
  );
}

Widget modalDescription(String text) {
  return Text(
    text,
    style: TextStyle(
      fontSize: 15.sp,
      fontWeight: FontWeight.w500,
      color: AppColor.black,
      height: 1.0,
    ),
  );
}

Widget elementTitle(String text) {
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

Widget elementDescription(String text,
    {FontWeight fontWeight = FontWeight.w500}) {
  return Text(
    text,
    style: TextStyle(
      fontSize: 10.sp,
      fontWeight: fontWeight,
      color: AppColor.black,
    ),
  );
}
