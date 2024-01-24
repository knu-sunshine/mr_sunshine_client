import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mr_sunshine_client/bloc/room_view_model.dart';
import 'package:mr_sunshine_client/constants/colors.dart';
import 'package:mr_sunshine_client/ui/components/public/buttons.dart';
import 'package:mr_sunshine_client/ui/components/public/inputs.dart';
import 'package:mr_sunshine_client/ui/components/public/texts.dart';
import 'package:mr_sunshine_client/ui/components/room/device_value_control_panel.dart';

class TextInputModal extends StatefulWidget {
  final String title;
  final String subscription;
  final List<String> fields;

  const TextInputModal({
    super.key,
    required this.title,
    required this.subscription,
    required this.fields,
  });

  @override
  State<TextInputModal> createState() => _TextInputModalState();
}

class _TextInputModalState extends State<TextInputModal> {
  List<String> values = [];
  @override
  void initState() {
    for (var i = 0; i < widget.fields.length; i++) {
      values.add("");
    }
    super.initState();
  }

  void setRoomName(String val, int idx) {
    setState(() {
      values[idx] = val;
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
          height: 190.h + 76.h * widget.fields.length,
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
                        modalTitle(widget.title),
                        cancelButton(),
                      ],
                    ),
                  ),
                  Container(
                    width: 265.w,
                    height: 20.h,
                    alignment: Alignment.centerLeft,
                    child: modalDescription(widget.subscription),
                  ),
                  SizedBox(
                    height: 29.h,
                  ),
                ] +
                widget.fields.fold<List<Widget>>([], (prev, e) {
                  return [
                    ...prev,
                    modalInputBox(e, (val) {
                      setRoomName(val, widget.fields.indexOf(e));
                    }),
                    SizedBox(
                      height: 39.h,
                    ),
                  ];
                }) +
                [
                  textButton(
                      text: "Confirm",
                      onClick: () {
                        print(values);
                      }),
                ],
          ),
        ),
      ),
    );
  }
}

class WakeUpValueModal extends StatelessWidget {
  final String deviceId;
  const WakeUpValueModal({
    required this.deviceId,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
      child: Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: EdgeInsets.symmetric(horizontal: 0.w, vertical: 0.h),
        child: Container(
          width: 310.w,
          height: 442.h,
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
                    modalTitle(
                        Get.find<RoomController>().getDevice(deviceId)!.name),
                    cancelButton(),
                  ],
                ),
              ),
              Container(
                width: 265.w,
                height: 20.h,
                alignment: Alignment.centerLeft,
                child: modalDescription("Set amount of Light for waking up"),
              ),
              SizedBox(
                height: 32.h,
              ),
              DeviceValueControlPanel(
                deviceID: deviceId,
                onOffVisible: false,
              ),
              SizedBox(
                height: 31.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  textButton(text: "Test", onClick: () {}),
                  SizedBox(
                    width: 22.w,
                  ),
                  textButton(text: "Confirm", onClick: () {}),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class DeviceInfoModal extends StatelessWidget {
  final String deviceId;
  const DeviceInfoModal({
    required this.deviceId,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
      child: Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: EdgeInsets.symmetric(horizontal: 0.w, vertical: 0.h),
        child: Container(
          width: 310.w,
          height: 442.h,
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
                    modalTitle(
                        Get.find<RoomController>().getDevice(deviceId)!.name),
                    cancelButton(),
                  ],
                ),
              ),
              Container(
                width: 265.w,
                height: 20.h,
                alignment: Alignment.centerLeft,
                child: modalDescription("Set amount of Light for waking up"),
              ),
              SizedBox(
                height: 32.h,
              ),
              DeviceValueControlPanel(
                deviceID: deviceId,
                onOffVisible: false,
              ),
              SizedBox(
                height: 31.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  textButton(text: "Test", onClick: () {}),
                  SizedBox(
                    width: 22.w,
                  ),
                  textButton(text: "Confirm", onClick: () {}),
                ],
              )
              // textButton(() {}),
            ],
          ),
        ),
      ),
    );
  }
}
