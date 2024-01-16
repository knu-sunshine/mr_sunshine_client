import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:mr_sunshine_client/bloc/user_view_model.dart';
import 'package:mr_sunshine_client/firebase_options.dart';
import 'package:mr_sunshine_client/ui/authPage.dart';
import 'package:mr_sunshine_client/ui/homePage.dart';

void main() async {
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
            home: const AuthPage(),
            initialBinding: BindingsBuilder(() {
              Get.put(UserController());
            }),
            getPages: [
              GetPage(name: '/auth', page: () => const AuthPage()),
              GetPage(name: '/home', page: () => const HomePage()),
            ],
          );
        });
  }
}
