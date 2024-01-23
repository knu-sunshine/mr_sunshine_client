import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mr_sunshine_client/ui/components/public/buttons.dart';
import 'package:mr_sunshine_client/ui/components/public/texts.dart';

Widget configurationPanel() {
  return SizedBox(
    width: 332.w,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        miniSubTitle("Configurations"),
        SizedBox(
          height: 13.h,
        ),
        barButton(
            text: "Set Wakeup Degree",
            fontSize: 17.sp,
            height: 42.h,
            onPressed: () {}),
        SizedBox(
          height: 13.h,
        ),
        barButton(
            text: "Show Info", fontSize: 17.sp, height: 42.h, onPressed: () {}),
      ],
    ),
  );
}
