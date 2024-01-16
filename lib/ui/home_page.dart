import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:mr_sunshine_client/ui/components/home/room_list.dart';
import 'package:mr_sunshine_client/ui/components/home/sun_panel.dart';
import 'package:mr_sunshine_client/ui/components/public/app_bar.dart';
import 'package:mr_sunshine_client/ui/components/public/divider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          appBar(),
          divier(
            height: 22.h,
            topIndent: 0.h,
          ),
          sunPanel(),
          divier(
            height: 65.h,
            topIndent: 36.h,
          ),
          roomList(),
        ],
      ),
    );
  }
}
