import 'package:intl/intl.dart';
import 'package:weather_app/models/temperature.dart';
import 'package:weather_app/models/weahter_detail.dart';

class DailyWeather {
  final int dt;
  final int sunrise;
  final int sunset;
  final Temperature temp;
  final Map<String, dynamic> feelsLike;
  final int pressure;
  final int humidity;
  final double dewPoint;
  final double windSpeed;
  final int windDeg;
  final List<WeatherDetail> weather;
  final int clouds;
  final double pop; // Probability of precipitation
  final double uvi; // UV index
  final String formattedDate;

  DailyWeather({
    required this.dt,
    required this.sunrise,
    required this.sunset,
    required this.temp,
    required this.feelsLike,
    required this.pressure,
    required this.humidity,
    required this.dewPoint,
    required this.windSpeed,
    required this.windDeg,
    required this.weather,
    required this.clouds,
    required this.pop,
    required this.uvi,
  }) : formattedDate = DateFormat('EEEE, MMMM d')
            .format(DateTime.fromMillisecondsSinceEpoch(dt * 1000));

  factory DailyWeather.fromJson(Map<String, dynamic> json) {
    return DailyWeather(
      dt: json['dt'],
      sunrise: json['sunrise'],
      sunset: json['sunset'],
      temp: Temperature.fromJson(json['temp']),
      feelsLike: Map<String, dynamic>.from(json['feels_like']),
      pressure: json['pressure'],
      humidity: json['humidity'],
      dewPoint: json['dew_point'].toDouble(),
      windSpeed: json['wind_speed'].toDouble(),
      windDeg: json['wind_deg'],
      weather: List<WeatherDetail>.from(
          json['weather'].map((item) => WeatherDetail.fromJson(item))),
      clouds: json['clouds'],
      pop: json['pop'].toDouble(),
      uvi: json['uvi'].toDouble(),
    );
  }
}
