import 'package:mr_sunshine_client/network_provider/google_oauth.dart';

class AuthRepository {
  Future<bool> login() async {
    final credential = await GoogleOauth.getCredential();
    print(credential);
    return true;
  }
}
