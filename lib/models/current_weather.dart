import 'package:weather_app/models/weahter_detail.dart';

class CurrentWeather {
  final int dt;
  final int sunrise;
  final int sunset;
  final double temp;
  final double feelsLike;
  final int pressure;
  final int humidity;
  final double dewPoint;
  final double uvi;
  final int clouds;
  final int visibility;
  final double windSpeed;
  final int windDeg;
  final List<WeatherDetail> weather;

  CurrentWeather({
    required this.dt,
    required this.sunrise,
    required this.sunset,
    required this.temp,
    required this.feelsLike,
    required this.pressure,
    required this.humidity,
    required this.dewPoint,
    required this.uvi,
    required this.clouds,
    required this.visibility,
    required this.windSpeed,
    required this.windDeg,
    required this.weather,
  });

  factory CurrentWeather.fromJson(Map<String, dynamic> json) {
    return CurrentWeather(
      dt: json['dt'],
      sunrise: json['sunrise'],
      sunset: json['sunset'],
      temp: json['temp'].toDouble(),
      feelsLike: json['feels_like'].toDouble(),
      pressure: json['pressure'],
      humidity: json['humidity'],
      dewPoint: json['dew_point'].toDouble(),
      uvi: json['uvi'].toDouble(),
      clouds: json['clouds'],
      visibility: json['visibility'],
      windSpeed: json['wind_speed'].toDouble(),
      windDeg: json['wind_deg'],
      weather: List<WeatherDetail>.from(
          json['weather'].map((item) => WeatherDetail.fromJson(item))),
    );
  }
}
