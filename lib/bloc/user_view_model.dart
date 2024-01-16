import 'package:get/get.dart';

import 'package:mr_sunshine_client/network_provider/google_oauth.dart';

class UserController extends GetxController {
  Future<bool> trySignIn() async {
    print(await GoogleOauth.getCredential());
    return true;
  }
}
