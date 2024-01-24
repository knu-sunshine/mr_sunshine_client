
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mr_sunshine_client/constants/colors.dart';

Widget logo(){
  return Container(
    width: 298.w,
    height: 172.h,
    alignment: Alignment.center,
    child: Text("LOGO", style: TextStyle(
        color: AppColor.black,
        fontSize: 50.sp,
        fontWeight: FontWeight.w700
      ),
    ),
  );
}