import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:mr_sunshine_client/bloc/user_view_model.dart';
import 'package:mr_sunshine_client/ui/components/auth/logo.dart';
import 'package:mr_sunshine_client/ui/components/public/buttons.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool needSignUp = false;

  @override
  void initState() {
    Get.find<UserController>().tryLogIn().then((res) => {
          if (res)
            {Get.offNamed('/home')}
          else
            {
              setState(() {
                needSignUp = true;
              })
            }
        });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          logo(),
          AnimatedContainer(
            duration: const Duration(milliseconds: 700),
            curve: Curves.easeInOut,
            height: needSignUp ? 406.h : 0.h,
            alignment: Alignment.bottomCenter,
            child: (needSignUp
                ? barButton(
                    prefix: const Image(
                      image: AssetImage('assets/icons/public/google.png'),
                    ),
                    text: 'Sign Up With Google',
                    onPressed: () {
                      Get.find<UserController>().trySignUp().then((res) => {
                            if (res)
                              {Get.offNamed('/home')}
                            else
                              {Get.snackbar('Error', 'Sign In Failed')}
                          });
                    },
                    fontSize: 14.sp,
                    height: 58.h,
                  )
                : Container()),
          ),
        ],
      ),
    ));
  }
}
