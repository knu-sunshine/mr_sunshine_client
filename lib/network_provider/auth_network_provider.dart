import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class AuthNetworkProvider {
  static Future<http.Response> fetchSignUp(
      {required String googleAccessToken}) async {
    final response = await http.post(
        Uri.parse("${dotenv.env["SERVER_BASE_URL"]}/auth/signup"),
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
        },
        body: jsonEncode({
          "googleToken": googleAccessToken,
        }));
    print("[fetch] sign up : " + response.statusCode.toString());
    return response;
  }

  static Future<http.Response> fetchLogIn({required session}) async {
    final response = await http.post(
      Uri.parse("${dotenv.env["SERVER_BASE_URL"]}/auth/login"),
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
      },
      body: jsonEncode({
        "userId": session,
      }),
    );
    print("[fetch] log in : " + response.statusCode.toString());
    return response;
  }
}
