import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mr_sunshine_client/constants/colors.dart';

Widget modalInputBox(String hintText, void Function(String) onChanged) {
  return Container(
    alignment: Alignment.center,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.r),
        border: Border.all(
          color: AppColor.surfaceStroke,
          width: 0.1.w,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColor.black.withOpacity(0.5),
          ),
          BoxShadow(
            color: AppColor.surface,
            offset: Offset(0, 1.5.w),
            spreadRadius: -1.5.w,
            blurRadius: 1.5.w,
          ),
        ]),
    width: 224.w,
    height: 47.h,
    padding: EdgeInsets.symmetric(horizontal: 13.w, vertical: 12.h),
    child: TextField(
      decoration: InputDecoration(
        border: InputBorder.none,
        enabledBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        focusedErrorBorder: InputBorder.none,
        contentPadding: EdgeInsets.zero,
        hintText: hintText,
        hintStyle: TextStyle(
          color: AppColor.black.withOpacity(0.5),
          fontSize: 17.sp,
          fontWeight: FontWeight.w500,
        ),
        isDense: true,
      ),
      // textAlignVertical: TextAlignVertical.top,
      onChanged: onChanged,
      style: TextStyle(
        color: AppColor.black,
        fontSize: 17.sp,
        fontWeight: FontWeight.w500,
      ),
      cursorColor: AppColor.black,
    ),
  );
}
