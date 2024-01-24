import 'dart:convert';

import 'package:http/http.dart';
import 'package:mr_sunshine_client/api/storage.dart';
import 'package:mr_sunshine_client/network_provider/auth.dart';
import 'package:mr_sunshine_client/network_provider/google_oauth.dart';

class AuthRepository {
  static Future<bool> signUp() async {
    final credential = await GoogleOauth.getCredential();
    if (credential.accessToken == null) {
      return false;
    }

    try {
      Response response =
          await fetchSignUp(googleAccessToken: credential.accessToken!);
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
      saveSession(jsonDecode(response.body));
    } catch (error) {
      return false;
    }

    return true;
  }

  static Future<bool> logIn() async {
    final session = await getSession();
    if (session == null) {
      return false;
    }

    try {
      Response response = await fetchLogIn(session: session);
      switch (response.statusCode) {
        case 200:
          break;
        case 401:
          throw Exception("Unauthorized");
        case 500:
          throw Exception("Internal Server Error");
        default:
          throw Exception("Unknown Error");
      }
      // saveSession(response.body);
    } catch (error) {
      return false;
    }
    return true;
  }
}
