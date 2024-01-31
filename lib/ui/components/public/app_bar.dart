import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:mr_sunshine_client/constants/colors.dart';
import 'package:mr_sunshine_client/ui/components/public/buttons.dart';
import 'package:mr_sunshine_client/ui/components/public/texts.dart';

Widget appBar({required String title, Widget? prefixWidget}) {
  return Container(
    width: 393.w,
    height: 87.h,
    padding: EdgeInsets.only(
      top: 36.h,
      left: 28.w,
      right: 28.w,
    ),
    child: Row(
      children: [
        prefixWidget != null
            ? Container(
                margin: EdgeInsets.only(right: 15.w), child: prefixWidget!)
            : Container(),
        Text(
          title,
          style: TextStyle(
            fontSize: 24.sp,
            fontWeight: FontWeight.w700,
            color: AppColor.black,
          ),
        ),
      ],
    ),
  );
}

Widget dialogIconAppBar({
  required Widget icon,
  required String title,
}) {
  return SizedBox(
    width: 274.w,
    height: 48.h,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 48.w,
          height: 48.w,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColor.surface,
            border: Border.all(
              color: AppColor.surfaceStroke,
              width: 1.w,
            ),
            boxShadow: [
              BoxShadow(
                color: AppColor.black.withOpacity(0.1),
                blurRadius: 2,
                offset: const Offset(0, 2),
              )
            ],
          ),
          child: icon,
        ),
        SizedBox(width: 170.w, child: dialogMiniTitle(title)),
        cancelButton(),
      ],
    ),
  );
}
