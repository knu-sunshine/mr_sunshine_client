import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'view/00_authPage/authPage.dart';
import 'viewModel/userViewModel.dart';
import 'firebase_options.dart';

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
            home: AuthPage(),
            initialBinding: BindingsBuilder(() {
              Get.put(UserController());
            }),
            getPages: [
              GetPage(name: '/auth', page: () => AuthPage()),
            ],
          );
        }
    );
  }
}