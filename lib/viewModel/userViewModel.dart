
import 'package:get/get.dart';
import 'package:mr_sunshine_client/model/google_oauth.dart';

class UserController extends GetxController {

  void trySignIn() async {
    print(await GoogleOauth.getCredential());
  }

}