import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

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

Widget subTitleWithSVGIcon(
    {required String text,
    required String iconUrl,
    required double iconWidth}) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      SvgPicture.asset(
        iconUrl,
        width: iconWidth,
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
