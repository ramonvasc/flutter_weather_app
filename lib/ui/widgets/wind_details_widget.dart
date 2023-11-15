import 'package:flutter/material.dart';
import 'package:weather_app/models/daily_weather.dart';

class WindDetailsWidget extends StatelessWidget {
  final DailyWeather dailyWeather;

  const WindDetailsWidget({super.key, required this.dailyWeather});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Wind Speed: ${dailyWeather.windSpeed} m/s'),
        Text('Wind Direction: ${dailyWeather.windDeg}°'),
      ],
    );
  }
}
