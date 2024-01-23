import 'dart:async';
import 'dart:math';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/semantics.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geekyants_flutter_gauges/geekyants_flutter_gauges.dart';
import 'package:get/get.dart';
import 'package:mr_sunshine_client/bloc/room_view_model.dart';

import 'package:mr_sunshine_client/constants/colors.dart';
import 'package:mr_sunshine_client/models/device.dart';
import 'package:mr_sunshine_client/models/room.dart';
import 'package:mr_sunshine_client/ui/components/public/buttons.dart';
import 'package:mr_sunshine_client/ui/components/public/components.dart';
import 'package:mr_sunshine_client/ui/components/public/texts.dart';

class ControlPanel extends StatefulWidget {
  final String deviceID;
  const ControlPanel({
    super.key,
    required this.deviceID,
  });

  @override
  State<ControlPanel> createState() => _ControlPanelState();
}

class _ControlPanelState extends State<ControlPanel> {
  double sliderValue = 0;
  Timer? _debounce;

  void setSliderValue(double value) {
    if (0 <= sliderValue && sliderValue <= 10) {
      if (value <= 20) {
        setState(() {
          sliderValue = value;
        });
      }
    } else if (90 <= sliderValue && sliderValue <= 100) {
      if (value >= 80) {
        setState(() {
          sliderValue = value;
        });
      }
    } else {
      setState(() {
        sliderValue = value;
      });
    }

    if (_debounce?.isActive ?? false) {
      _debounce!.cancel();
    }
    _debounce = Timer(const Duration(milliseconds: 500), () {
      Get.find<RoomController>().setDeviceValue(widget.deviceID, sliderValue);
    });
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 228.w,
      height: 228.w,
      // color: Colors.blue,
      child: Stack(
        children: [
          Positioned(
            width: 228.w,
            height: 228.w,
            child: CustomPaint(
              painter: BackgroundPainter(),
            ),
          ),
          Positioned(
            width: 228.w,
            height: 228.w,
            child: CustomPaint(
              painter: ForegroundPainter(
                value: sliderValue,
              ),
            ),
          ),
          Positioned(
            width: 228.w,
            height: 228.w,
            child: CustomPaint(
              painter: ValueBarPainter(
                value: sliderValue,
              ),
            ),
          ),
          Positioned(
            width: 228.w,
            height: 228.w,
            child: radialGauge(
              sliderValue: sliderValue,
              setSliderValue: setSliderValue,
            ),
          ),
          Positioned(
              width: 228.w, height: 228.w, child: midPanel(widget.deviceID)),
        ],
      ),
    );
  }
}

Widget radialGauge({
  required double sliderValue,
  required Function(double) setSliderValue,
}) {
  return RadialGauge(
    radiusFactor: 1.075,
    shapePointer: [
      RadialShapePointer(
        value: sliderValue,
        isInteractive: true,
        onChanged: setSliderValue,
        color: AppColor.surface,
        width: 7.5.w,
      ),
    ],
    valueBar: [],
    track: RadialTrack(
      start: 0,
      end: 100,
      startAngle: 90,
      endAngle: 450,
      thickness: 15.w,
      color: Colors.transparent,
      trackStyle: const TrackStyle(
        showLabel: false,
        showSecondaryRulers: false,
        showPrimaryRulers: false,
      ),
    ),
  );
}

Widget midPanel(String deviceID) {
  RoomOnOffStatus status = Get.find<RoomController>().getDevice(deviceID)!.isOn
      ? RoomOnOffStatus.on
      : RoomOnOffStatus.off;
  void onClick() {
    Get.find<RoomController>().toggleDeviceOnOff(deviceID);
  }

  String iconUrl = {
    DeviceCategory.light: "assets/icons/device/light.png",
    DeviceCategory.curtain: "assets/icons/device/curtain.png",
    DeviceCategory.addDdevice: "assets/icons/device/add_device.png",
  }[Get.find<RoomController>().getDevice(deviceID)!.deviceCategory]!;

  return Container(
    alignment: Alignment.center,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        icon(url: iconUrl, width: 54.w),
        SizedBox(
          height: 8.h,
        ),
        subTitle(Get.find<RoomController>().getDevice(deviceID)!.name),
        SizedBox(
          height: 16.h,
        ),
        onOffToggle(status: status, onClick: onClick),
      ],
    ),
  );
}

class ValueBarPainter extends CustomPainter {
  double value;

  ValueBarPainter({
    required this.value,
  });

  @override
  void paint(Canvas canvas, Size size) {
    //Value Bar Shadow
    Paint trackShadowPaint = Paint()
      ..color = AppColor.black.withOpacity(0.08)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 15.w
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(
      Rect.fromCenter(
        center: Offset(size.width / 2, size.height / 2),
        width: size.width - 15.w,
        height: size.width - 15.w,
      ),
      -0.5 * pi,
      2 * pi * (value / 100),
      false,
      trackShadowPaint,
    );

    //Value Bar
    Paint trackPaint = Paint()
      ..color = const Color(0xFFFDEEB6)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 13.w
      ..strokeCap = StrokeCap.round
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, 3.w);

    canvas.drawArc(
      Rect.fromCenter(
        center: Offset(size.width / 2, size.height / 2),
        width: size.width - 15.w,
        height: size.width - 15.w,
      ),
      -0.5 * pi,
      2 * pi * (value / 100),
      false,
      trackPaint,
    );
  }

  @override
  bool shouldRepaint(ValueBarPainter oldDelegate) => false;
}

class BackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    //background Shadow
    Paint backgroundShadowPaint = Paint()
      ..color = AppColor.black.withOpacity(0.08);

    canvas.drawCircle(
      Offset(size.width / 2, size.height / 2),
      size.width / 2,
      backgroundShadowPaint,
    );

    //background
    Paint backgroundPaint = Paint()
      ..color = AppColor.surface
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, 7.w);

    canvas.drawCircle(
      Offset(size.width / 2, size.height / 2),
      (size.width - 14.w) / 2,
      backgroundPaint,
    );
  }

  @override
  bool shouldRepaint(BackgroundPainter oldDelegate) => false;
}

class ForegroundPainter extends CustomPainter {
  double value;
  ForegroundPainter({
    required this.value,
  });

  @override
  void paint(Canvas canvas, Size size) {
    //foreground Shadow
    Paint foregroundShadowPaint = Paint()
      ..color = AppColor.black.withOpacity(0.08);

    canvas.drawCircle(
      Offset(size.width / 2, size.height / 2),
      size.width / 2 - 15.w,
      foregroundShadowPaint,
    );

    //foreground
    Paint foregroundPaint = Paint()
      ..shader = SweepGradient(
        startAngle: 3 * pi / 2 + (value / 100) * 2 * pi,
        endAngle: 7 * pi / 2 + (value / 100) * 2 * pi,
        colors: [AppColor.primary, AppColor.surface],
        tileMode: TileMode.repeated,
      ).createShader(
        Rect.fromCircle(
          center: Offset(size.width / 2, size.height / 2),
          radius: size.width / 2 - 15.w,
        ),
      )
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, 7.w);

    canvas.drawArc(
      Rect.fromCenter(
        center: Offset(size.width / 2, size.height / 2),
        width: size.width - 30.w,
        height: size.width - 30.w,
      ),
      -0.5 * pi,
      2 * pi,
      // 2 * pi * (35 / 100),
      true,
      foregroundPaint,
    );
  }

  @override
  bool shouldRepaint(ForegroundPainter oldDelegate) => false;
}
