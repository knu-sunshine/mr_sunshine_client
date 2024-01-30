import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class SunTimeNetworkProvider {
  static Future<http.Response> getSunTime() async {
    final response = await http.get(
      Uri.parse("${dotenv.env["SERVER_BASE_URL"]}/sun"),
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
      },
    );
    print("[fetch] get sun time : ${response.statusCode}");
    return response;
  }
}
