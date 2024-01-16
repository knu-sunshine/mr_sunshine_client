import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mr_sunshine_client/constants/colors.dart';

Widget divier({
  required double height,
  double? thickness,
  required double topIndent,
}) {
  return Container(
    width: 332.w,
    height: height,
    padding: EdgeInsets.only(
      top: topIndent,
    ),
    alignment: Alignment.topCenter,
    child: Container(
      width: 332.w,
      height: thickness ?? 1.h,
      color: AppColor.surfaceStroke,
    ),
  );
}
