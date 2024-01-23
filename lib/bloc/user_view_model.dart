import 'package:get/get.dart';
import 'package:mr_sunshine_client/repository/auth_repository.dart';

class UserController extends GetxController {
  Future<bool> tryLogIn() async {
    final authLoginResult = await AuthRepository.logIn();
    if (authLoginResult) {
      return true;
    }
    return false;
  }

  Future<bool> trySignUp() async {
    final signUpResult = await AuthRepository.signUp();
    if (signUpResult) {
      return true;
    }
    return false;
  }
}
