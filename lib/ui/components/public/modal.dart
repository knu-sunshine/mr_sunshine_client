import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mr_sunshine_client/bloc/home_view_model.dart';
import 'package:mr_sunshine_client/bloc/room_view_model.dart';
import 'package:mr_sunshine_client/constants/colors.dart';
import 'package:mr_sunshine_client/models/device.dart';
import 'package:mr_sunshine_client/ui/components/public/app_bar.dart';
import 'package:mr_sunshine_client/ui/components/public/buttons.dart';
import 'package:mr_sunshine_client/ui/components/public/components.dart';
import 'package:mr_sunshine_client/ui/components/public/inputs.dart';
import 'package:mr_sunshine_client/ui/components/public/texts.dart';
import 'package:mr_sunshine_client/ui/components/room/device_value_control_panel.dart';

class AddRoomModal extends StatefulWidget {
  const AddRoomModal({
    super.key,
  });

  @override
  State<AddRoomModal> createState() => _AddRoomModalState();
}

class _AddRoomModalState extends State<AddRoomModal> {
  String? roomName;

  void setRoomName(String val) {
    setState(() {
      roomName = val;
    });
  }

  void onSubmit() {
    if (roomName == null) return;
    Get.find<HomeController>().addRoom(roomName!).then((value) => Get.back());
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
                child: modalDescription("Enter the name of the room"),
              ),
              SizedBox(
                height: 29.h,
              ),
              modalInputBox("room name", setRoomName),
              SizedBox(
                height: 39.h,
              ),
              textButton(text: "Confirm", onClick: onSubmit),
            ],
          ),
        ),
      ),
    );
  }
}

class AddDeviceModal extends StatefulWidget {
  const AddDeviceModal({
    super.key,
  });

  @override
  State<AddDeviceModal> createState() => _AddDeviceModalState();
}

class _AddDeviceModalState extends State<AddDeviceModal> {
  String? deviceId;
  String? deviceName;

  void setDeviceID(String val) {
    setState(() {
      deviceId = val;
    });
  }

  void setDeviceName(String val) {
    setState(() {
      deviceName = val;
    });
  }

  void onSubmit() {
    if (deviceId == null) return;
    if (deviceName == null) return;
    Get.find<RoomController>()
        .addDevice(deviceId: deviceId!, deviceName: deviceName!)
        .then((value) {
      if (value) {
        Get.back();
      }
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
          height: 342.h,
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
                    modalTitle("Add Device"),
                    cancelButton(),
                  ],
                ),
              ),
              Container(
                width: 265.w,
                height: 20.h,
                alignment: Alignment.centerLeft,
                child: modalDescription("Enter the name of the device"),
              ),
              SizedBox(
                height: 29.h,
              ),
              textButton(
                text: deviceId ?? "Scan QR",
                onClick: () => {
                  Get.toNamed("/qr", arguments: {"setValue": setDeviceID})
                },
              ),
              SizedBox(
                height: 39.h,
              ),
              modalInputBox("device name", setDeviceName),
              SizedBox(
                height: 39.h,
              ),
              textButton(text: "Confirm", onClick: onSubmit),
            ],
          ),
        ),
      ),
    );
  }
}

class WakeUpValueModal extends StatefulWidget {
  final String deviceId;
  const WakeUpValueModal({
    required this.deviceId,
    super.key,
  });

  @override
  State<WakeUpValueModal> createState() => _WakeUpValueModalState();
}

class _WakeUpValueModalState extends State<WakeUpValueModal> {
  int value = 0;

  void setValue(int val) {
    setState(() {
      value = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
      child: Dialog(
          backgroundColor: Colors.transparent,
          insetPadding: EdgeInsets.symmetric(horizontal: 0.w, vertical: 0.h),
          child: Obx(
            () => Container(
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
                        modalTitle(Get.find<RoomController>()
                            .getDevice(widget.deviceId)!
                            .name),
                        cancelButton(),
                      ],
                    ),
                  ),
                  Container(
                    width: 265.w,
                    height: 20.h,
                    alignment: Alignment.centerLeft,
                    child:
                        modalDescription("Set amount of Light for waking up"),
                  ),
                  SizedBox(
                    height: 32.h,
                  ),
                  DeviceValueControlPanel(
                    deviceID: widget.deviceId,
                    initValue: Get.find<RoomController>()
                        .getDevice(widget.deviceId)!
                        .wakeUpValue,
                    setValue: (val) async {
                      setValue(val);
                      return true;
                    },
                    isOn: Get.find<RoomController>()
                        .getDevice(widget.deviceId)!
                        .isWakeUpOn,
                    onToggle: () {
                      Get.find<RoomController>()
                          .toggleDeviceWakeUpOnOff(widget.deviceId);
                    },
                  ),
                  SizedBox(
                    height: 31.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      textButton(
                          text: "Test",
                          onClick: () {
                            Get.find<RoomController>()
                                .testWakeUpValue(widget.deviceId, value);
                          }),
                      SizedBox(
                        width: 22.w,
                      ),
                      textButton(
                          text: "Confirm",
                          onClick: () {
                            Get.find<RoomController>()
                                .setWakeUpValue(widget.deviceId, value)
                                .then((value) => {
                                      if (value) {Get.back()}
                                    });
                          }),
                    ],
                  )
                ],
              ),
            ),
          )),
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
    Device device = Get.find<RoomController>().getDevice(deviceId)!;

    Widget deviceIcon = {
          DeviceCategory.light: Align(
            alignment: Alignment.topCenter,
            child: Image.asset(
              "assets/icons/device/light.png",
              width: 31.w,
            ),
          ),
          DeviceCategory.curtain: Align(
            alignment: Alignment.center,
            child: Image.asset(
              "assets/icons/device/curtain.png",
              width: 20.w,
            ),
          ),
        }[device.deviceCategory] ??
        Container();

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
              dialogIconAppBar(icon: deviceIcon, title: device.name),
              SizedBox(
                height: 36.h,
              ),
              _infoBox(device),
            ],
          ),
        ),
      ),
    );
  }

  Widget _infoBox(Device device) {
    String category = {
          DeviceCategory.light: "Light",
          DeviceCategory.curtain: "Curatin",
        }[device.deviceCategory] ??
        "";

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        miniSubTitle("Device Info"),
        divier(width: 270.w, height: 21.h, topIndent: 11.h),
        _infoElement(index: "Device Id", value: device.deviceID),
        divier(width: 270.w, height: 21.h, topIndent: 11.h),
        _infoElement(
            index: "Room",
            value: Get.find<RoomController>().room.value.roomName),
        divier(width: 270.w, height: 21.h, topIndent: 11.h),
        _infoElement(index: "Category", value: category),
        divier(width: 270.w, height: 21.h, topIndent: 11.h),
        _infoElement(index: "Wake Up Degree", value: "${device.wakeUpValue}%"),
        divier(width: 270.w, height: 21.h, topIndent: 11.h),
      ],
    );
  }

  Widget _infoElement({required String index, required String value}) {
    return Container(
      width: 271.w,
      height: 37.h,
      alignment: Alignment.center,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(width: 134.w, child: infoIndexText(index)),
          SizedBox(width: 137.w, child: infoValueText(value)),
        ],
      ),
    );
  }
}
