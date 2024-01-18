import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mr_sunshine_client/constants/colors.dart';
import 'package:mr_sunshine_client/ui/components/public/buttons.dart';
import 'package:mr_sunshine_client/ui/components/public/inputs.dart';
import 'package:mr_sunshine_client/ui/components/public/titles.dart';

class AddRoomModal extends StatefulWidget {
  const AddRoomModal({super.key});

  @override
  State<AddRoomModal> createState() => _AddRoomModalState();
}

class _AddRoomModalState extends State<AddRoomModal> {
  String roomName = "";
  void setRoomName(String val) {
    setState(() {
      roomName = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
      child: Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: EdgeInsets.symmetric(horizontal: 0.w, vertical: 0.h),
        child: Container(
          width: 310.w,
          height: 266.h,
          color: AppColor.background,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 265.w,
                height: 41.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    modalTitle("Add Room"),
                    cancelButton(),
                  ],
                ),
              ),
              Container(
                width: 265.w,
                height: 20.h,
                alignment: Alignment.centerLeft,
                child: modalDescription("enter name for your new Room"),
              ),
              SizedBox(
                height: 29.h,
              ),
              modalInputBox(setRoomName),
              SizedBox(
                height: 39.h,
              ),
              confirmButton(() {
                print(roomName);
              }),
            ],
          ),
        ),
      ),
    );
  }
}
