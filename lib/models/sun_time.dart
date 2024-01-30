import 'dart:convert';

import 'package:intl/intl.dart';

class SunTime {
  final DateTime sunrise;
  final DateTime sunset;

  SunTime({required this.sunrise, required this.sunset});

  factory SunTime.fromJson(Map<String, dynamic> json) {
    DateFormat dateFormat = DateFormat('M/d/yyyy, h:mm:ss a');

    return SunTime(
        sunrise: dateFormat.parse(json['sunrise']),
        sunset: dateFormat.parse(json['sunset']));
  }
}

SunTime sunTimeFromJson(String str) {
  return SunTime.fromJson(jsonDecode(str));
}
