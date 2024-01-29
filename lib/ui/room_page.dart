import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mr_sunshine_client/bloc/room_view_model.dart';

import 'package:mr_sunshine_client/ui/components/public/app_bar.dart';
import 'package:mr_sunshine_client/ui/components/public/buttons.dart';
import 'package:mr_sunshine_client/ui/components/public/components.dart';
import 'package:mr_sunshine_client/ui/components/room/auto_toggle.dart';
import 'package:mr_sunshine_client/ui/components/room/configuration_panel.dart';
import 'package:mr_sunshine_client/ui/components/room/device_list.dart';
import 'package:mr_sunshine_client/ui/components/room/device_value_control_panel.dart';

class RoomPage extends StatefulWidget {
  const RoomPage({super.key});

  @override
  State<RoomPage> createState() => _RoomPageState();
}

class _RoomPageState extends State<RoomPage> {
  String selectedDeviceId = "";

  @override
  void initState() {
    Get.find<RoomController>().initRoom(Get.arguments);
    Get.find<RoomController>().getDeviceList().then((value) =>
        {setDeviceID(Get.find<RoomController>().getFirstDeviceID() ?? "")});
    super.initState();
  }

  void setDeviceID(String deviceID) {
    setState(() {
      selectedDeviceId = deviceID;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          resizeToAvoidBottomInset: false,
          body: Column(
            children: [
              appBar(title: "Living Room", suffixWidget: cancelButton()),
              divier(
                width: 332.w,
                height: 22.h,
                topIndent: 0.h,
              ),
              autoToggle(),
              divier(
                width: 332.w,
                height: 51.h,
                topIndent: 21.h,
              ),
              deviceList(
                  selectedDeviceId: selectedDeviceId, setDeviceID: setDeviceID),
              divier(
                width: 332.w,
                height: 63.h,
                topIndent: 37.h,
              ),
              selectedDeviceId == ""
                  ? SizedBox(
                      width: 228.w,
                      height: 228.w,
                    )
                  : DeviceValueControlPanel(
                      deviceID: selectedDeviceId,
                      onOffVisible: true,
                      initValue: Get.find<RoomController>()
                          .getDevice(selectedDeviceId)!
                          .deviceValue,
                      setValue: (val) async {
                        return await Get.find<RoomController>()
                            .setDeviceValue(selectedDeviceId, val.toInt());
                      },
                    ),
              Container(
                height: 37.h,
              ),
              selectedDeviceId == ""
                  ? Container()
                  : configurationPanel(selectedDeviceId),
            ],
          ),
        ));
  }
}
