import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mr_sunshine_client/ui/components/public/texts.dart';

Widget sunPanel() {
  return Container(
    width: 332.w,
    height: 295.h,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        subTitle("Sunrise / Sunset"),
        Container(
          width: 332.w,
          height: 256.h,
          color: Colors.blue,
        ),
      ],
    ),
  );
}
