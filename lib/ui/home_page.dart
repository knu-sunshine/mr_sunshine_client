import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mr_sunshine_client/bloc/home_view_model.dart';
import 'package:mr_sunshine_client/bloc/room_view_model.dart';
import 'package:mr_sunshine_client/bloc/user_view_model.dart';

import 'package:mr_sunshine_client/ui/components/home/room_list.dart';
import 'package:mr_sunshine_client/ui/components/home/sun_panel.dart';
import 'package:mr_sunshine_client/ui/components/public/app_bar.dart';
import 'package:mr_sunshine_client/ui/components/public/components.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    Get.find<HomeController>().getRoomList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          resizeToAvoidBottomInset: false,
          body: SingleChildScrollView(
            child: Column(
              children: [
                appBar(
                    title:
                        "${Get.find<UserController>().user.userName}'s Home"),
                divier(
                  width: 332.w,
                  height: 22.h,
                  topIndent: 0.h,
                ),
                sunPanel(),
                divier(
                  width: 332.w,
                  height: 65.h,
                  topIndent: 36.h,
                ),
                roomList(),
              ],
            ),
          ),
        ));
  }
}
