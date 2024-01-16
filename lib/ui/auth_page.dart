import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:mr_sunshine_client/bloc/user_view_model.dart';
import 'package:mr_sunshine_client/ui/components/auth/logo.dart';
import 'package:mr_sunshine_client/ui/components/public/bar_button.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          logo(),
          SizedBox(height: 234.w),
          barButton(
            prefix: const Image(
              image: AssetImage('assets/icons/google.png'),
            ),
            text: 'Sign Up With Google',
            onPressed: () {
              Get.find<UserController>().trySignIn().then((res) => {
                    if (res)
                      {Get.offNamed('/home')}
                    else
                      {Get.snackbar('Error', 'Sign In Failed')}
                  });
            },
          ),
        ],
      ),
    ));
  }
}
