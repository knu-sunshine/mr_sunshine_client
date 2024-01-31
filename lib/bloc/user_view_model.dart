import 'package:get/get.dart';
import 'package:mr_sunshine_client/models/user.dart';
import 'package:mr_sunshine_client/repository/auth_repository.dart';

class UserController extends GetxController {
  late User user;

  Future<bool> tryLogIn() async {
    final User? user = await AuthRepository.logIn();
    if (user != null) {
      this.user = user;
      return true;
    }
    return false;
  }

  Future<bool> trySignUp() async {
    final User? user = await AuthRepository.signUp();
    if (user != null) {
      this.user = user;
      return true;
    }
    return false;
  }
}
