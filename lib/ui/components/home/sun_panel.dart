import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mr_sunshine_client/bloc/home_view_model.dart';
import 'package:mr_sunshine_client/constants/colors.dart';
import 'package:mr_sunshine_client/models/sun_time.dart';
import 'package:mr_sunshine_client/ui/components/public/texts.dart';

Widget sunPanel() {
  return SizedBox(
    width: 332.w,
    height: 295.h,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        subTitle("Sunrise / Sunset"),
        Container(
          width: 332.w,
          height: 256.h,
          decoration: BoxDecoration(
            color: AppColor.surface,
            border:
                Border.all(color: AppColor.black.withOpacity(0.08), width: 1.w),
            borderRadius: BorderRadius.all(Radius.circular(11.r)),
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              sunLocation(Get.find<HomeController>().sunTime.value),
              sun(Get.find<HomeController>().sunTime.value),
              indicator(Get.find<HomeController>().sunTime.value),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget sunLocation(
  SunTime sunTime,
) {
  return Positioned(
    child: SizedBox(
      width: 332.w,
      height: 256.h,
      child: ClipRRect(
        child: CustomPaint(
          painter: SunLocationPainter(sunTime),
        ),
      ),
    ),
  );
}

Widget sun(
  SunTime sunTime,
) {
  bool isSunRise = DateTime.now().isAfter(sunTime.sunrise);
  bool isSunSet = DateTime.now().isAfter(sunTime.sunset);

  return Positioned(
      top: 39.h,
      child: Container(
        width: 69.w,
        height: 69.w,
        decoration: BoxDecoration(
          color: (isSunRise && !isSunSet) ? AppColor.sunWarm : AppColor.sunCold,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: (isSunRise && !isSunSet)
                  ? AppColor.sunWarm
                  : AppColor.sunCold,
              blurRadius: 10,
              offset: const Offset(0, 2),
            )
          ],
        ),
      ));
}

Widget indicator(SunTime sunTime) {
  bool isSunRise = DateTime.now().isAfter(sunTime.sunrise);
  bool isSunSet = DateTime.now().isAfter(sunTime.sunset);
  return Positioned(
      top: 198.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            (isSunRise && !(isSunSet)) ? "Sunset" : "Sunrise",
            style: TextStyle(
              color: AppColor.black,
              fontSize: 18.sp,
              fontWeight: FontWeight.w500,
              height: 1.0,
            ),
          ),
          Text(
            isSunRise && !(isSunSet)
                ? "${sunTime.sunset.hour.toString().padLeft(2, '0')}:${sunTime.sunset.minute.toString().padLeft(2, '0')}"
                : "${sunTime.sunrise.hour.toString().padLeft(2, '0')}:${sunTime.sunrise.minute.toString().padLeft(2, '0')}",
            style: TextStyle(
              color: AppColor.black,
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
              height: 1.0,
            ),
          )
        ],
      ));
}

class SunLocationPainter extends CustomPainter {
  final SunTime sunTime;
  SunLocationPainter(this.sunTime);

  @override
  void paint(Canvas canvas, Size size) {
    bool isSunRise = DateTime.now().isAfter(sunTime.sunrise);
    bool isSunSet = DateTime.now().isAfter(sunTime.sunset);
    double sunPercentage;
    if (isSunSet) {
      sunPercentage = DateTime.now().difference(sunTime.sunset).inSeconds /
          sunTime.sunrise
              .add(const Duration(days: 1))
              .difference(sunTime.sunset)
              .inSeconds;
    } else if (isSunRise) {
      sunPercentage = DateTime.now().difference(sunTime.sunrise).inSeconds /
          sunTime.sunset.difference(sunTime.sunrise).inSeconds;
    } else {
      sunPercentage = DateTime.now()
              .difference(sunTime.sunset.subtract(const Duration(days: 1)))
              .inSeconds /
          sunTime.sunrise
              .difference(sunTime.sunset.subtract(const Duration(days: 1)))
              .inSeconds;
    }

    //sunTrack
    Paint sunTrackPaint = Paint()
      ..shader = LinearGradient(
        colors: const [AppColor.sunCold, AppColor.sunWarm],
        transform: isSunRise
            ? const GradientRotation(pi * 1.25)
            : const GradientRotation(pi * 0.25),
      ).createShader(
        Rect.fromCircle(
          center: Offset((size.width * 1.4) / 2, size.height * 1.57),
          radius: (size.width * 1.4) / 2,
        ),
      )
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.w;

    canvas.drawArc(
      Rect.fromCenter(
        center: Offset(size.width / 2, size.height * 1.57),
        width: (size.width * 1.4),
        height: (size.width * 1.4),
      ),
      0,
      2 * pi,
      false,
      sunTrackPaint,
    );

    //sunTrack Shadow
    Paint sunTrackShadowPaint = Paint()
      ..shader = LinearGradient(
        colors: const [AppColor.sunCold, AppColor.sunWarm],
        transform: isSunRise
            ? const GradientRotation(pi * 1.25)
            : const GradientRotation(pi * 0.25),
      ).createShader(
        Rect.fromCircle(
          center: Offset((size.width * 1.4) / 2, size.height * 1.57),
          radius: (size.width * 1.4) / 2,
        ),
      )
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.w
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, 3.w);

    canvas.drawArc(
      Rect.fromCenter(
        center: Offset(size.width / 2, size.height * 1.57),
        width: (size.width * 1.4),
        height: (size.width * 1.4),
      ),
      0,
      2 * pi,
      false,
      sunTrackShadowPaint,
    );

    //Sun Shadow
    Paint sunShadowPaint = Paint()
      ..color = AppColor.black.withOpacity(0.3)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 15.w
      ..strokeCap = StrokeCap.round
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, 2.w);

    canvas.drawArc(
      Rect.fromCenter(
        center: Offset(size.width / 2, size.height * 1.57 + 1.h),
        width: (size.width * 1.4),
        height: (size.width * 1.4),
      ),
      1.25 * pi + (sunPercentage) * 0.5 * pi,
      0.0001 * pi,
      false,
      sunShadowPaint,
    );

    //Sun
    Paint sunPaint = Paint()
      ..color = AppColor.surface
      ..style = PaintingStyle.stroke
      ..strokeWidth = 15.w
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(
      Rect.fromCenter(
        center: Offset(size.width / 2, size.height * 1.57),
        width: (size.width * 1.4),
        height: (size.width * 1.4),
      ),
      1.25 * pi + (sunPercentage) * 0.5 * pi,
      0.00001 * pi,
      false,
      sunPaint,
    );
  }

  @override
  bool shouldRepaint(SunLocationPainter oldDelegate) => false;
}
