import 'package:http/http.dart' as http;
import 'package:mr_sunshine_client/models/sun_time.dart';
import 'package:mr_sunshine_client/network_provider/sun_time_network_provider.dart';

class SunTimeRepository {
  static Future<SunTime?> getSunTime() async {
    try {
      http.Response response = await SunTimeNetworkProvider.getSunTime();
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
      SunTime sunTime = sunTimeFromJson(response.body);
      return sunTime;
    } catch (error) {
      return null;
    }
  }
}
