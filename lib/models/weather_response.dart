import 'package:weather_app/models/current_weather.dart';
import 'package:weather_app/models/daily_weather.dart';

class WeatherResponse {
  final double lat;
  final double lon;
  final String timezone;
  final int timezoneOffset;
  final CurrentWeather current;
  final List<DailyWeather> daily;

  WeatherResponse({
    required this.lat,
    required this.lon,
    required this.timezone,
    required this.timezoneOffset,
    required this.current,
    required this.daily,
  });

  factory WeatherResponse.fromJson(Map<String, dynamic> json) {
    return WeatherResponse(
      lat: json['lat'].toDouble(),
      lon: json['lon'].toDouble(),
      timezone: json['timezone'],
      timezoneOffset: json['timezone_offset'],
      current: CurrentWeather.fromJson(json['current']),
      daily: List<DailyWeather>.from(
          json['daily'].map((x) => DailyWeather.fromJson(x))),
    );
  }
}
