import 'dart:convert';

class SunTime {
  final DateTime sunrise;
  final DateTime sunset;

  SunTime({required this.sunrise, required this.sunset});

  factory SunTime.fromJson(Map<String, dynamic> json) {
    return SunTime(sunrise: json['sunrise'], sunset: json['sunset']);
  }
}

SunTime sunTimeFromJson(String str) {
  return SunTime.fromJson(jsonDecode(str));
}
