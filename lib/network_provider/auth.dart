import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mr_sunshine_client/api/storage.dart';

Future<http.Response> fetchSignUp({required String googleAccessToken}) async {
  final response =
      await http.post(Uri.parse("http://192.168.203.120:3000/auth/signup"),
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

Future<http.Response> fetchLogIn({required session}) async {
  final response = await http.post(
    Uri.parse("http://192.168.203.120:3000/auth/login"),
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
