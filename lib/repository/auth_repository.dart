import 'package:http/http.dart' as http;
import 'package:mr_sunshine_client/api/storage.dart';

import 'package:mr_sunshine_client/models/user.dart';
import 'package:mr_sunshine_client/network_provider/auth_network_provider.dart';
import 'package:mr_sunshine_client/network_provider/google_oauth_network_provider.dart';

class AuthRepository {
  static Future<User?> signUp() async {
    try {
      final credential = await GoogleOauth.getCredential();
      if (credential.accessToken == null) {
        throw Exception("Google Account is unauthorized");
      }

      http.Response response = await AuthNetworkProvider.fetchSignUp(
          googleAccessToken: credential.accessToken!);
      switch (response.statusCode) {
        case 201:
          break;
        case 401:
          throw Exception("Unauthorized");
        case 500:
          throw Exception("Internal Server Error");
        default:
          throw Exception("Unknown Error");
      }

      User newUser = userFromJson(response.body);
      saveSession(newUser.userId);
      return newUser;
    } catch (error) {
      print(error);
      return null;
    }
  }

  static Future<User?> logIn() async {
    try {
      final session = await getSession();
      if (session == null) {
        throw Exception("Session is null");
      }

      http.Response response =
          await AuthNetworkProvider.fetchLogIn(session: session);
      switch (response.statusCode) {
        case 201:
          break;
        case 401:
          throw Exception("Unauthorized");
        case 500:
          throw Exception("Internal Server Error");
        default:
          throw Exception("Unknown Error");
      }

      User newUser = userFromJson(response.body);
      saveSession(newUser.userId);
      print(newUser.userId);
      return newUser;
    } catch (error) {
      print(error);
      return null;
    }
  }
}
