import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:mr_sunshine_client/bloc/home_view_model.dart';
import 'package:mr_sunshine_client/bloc/room_view_model.dart';
import 'package:mr_sunshine_client/bloc/user_view_model.dart';
import 'package:mr_sunshine_client/firebase_options.dart';
import 'package:mr_sunshine_client/ui/auth_page.dart';
import 'package:mr_sunshine_client/ui/components/public/qrcode_widget.dart';
import 'package:mr_sunshine_client/ui/home_page.dart';
import 'package:mr_sunshine_client/ui/room_page.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(393, 852),
        builder: (context, child) {
          return GetMaterialApp(
            title: 'mr.sunshine',
            theme: ThemeData(
              fontFamily: "Noto-Sans",
            ),
            debugShowCheckedModeBanner: false,
            initialRoute: "/auth",
            initialBinding: BindingsBuilder(() {
              Get.put(UserController());
            }),
            getPages: [
              GetPage(name: '/auth', page: () => const AuthPage()),
              GetPage(
                  name: '/home',
                  page: () => const HomePage(),
                  transition: Transition.rightToLeft,
                  transitionDuration: const Duration(milliseconds: 300),
                  binding: BindingsBuilder(() {
                    Get.put(HomeController());
                  })),
              GetPage(
                  name: '/room',
                  page: () => const RoomPage(),
                  transition: Transition.rightToLeft,
                  transitionDuration: const Duration(milliseconds: 300),
                  binding: BindingsBuilder(() {
                    Get.put(RoomController());
                  })),
              GetPage(
                name: "/qr",
                page: () => const QRCodeWidget(),
                // arguments: {"setValue": (value) => print(value)},
              )
            ],
          );
        });
  }
}
