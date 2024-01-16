import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mr_sunshine_client/constants/colors.dart';

Widget barButton({
  required Widget prefix,
  required String text,
  Widget? suffix,
  Function()? onPressed,
}){
  return ElevatedButton(
    onPressed: onPressed,
    style: ElevatedButton.styleFrom(
      alignment: Alignment.center,
      fixedSize: Size(332.w, 58.h),
      backgroundColor: AppColor.surface,
      foregroundColor: AppColor.primary,
      padding: EdgeInsets.symmetric(horizontal: 18.w),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.r),
        side: BorderSide(
          color: AppColor.surfaceStroke,
          width: 0.3.w,
        ),
      ),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: 27.w,
          height: 27.w,
          child: prefix,
        ),
        SizedBox(
          width: 194.w,
          child: Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14.sp,
              color: AppColor.black,
            ),
          ),
        ),
        SizedBox(
          width: 27.w,
          height: 27.w,
          child: suffix,
        ),
      ],
    ),
  );
}