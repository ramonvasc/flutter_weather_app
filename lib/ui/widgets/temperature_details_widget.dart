import 'package:flutter/material.dart';
import 'package:weather_app/models/daily_weather.dart';

class TemperatureDetailsWidget extends StatelessWidget {
  final DailyWeather dailyWeather;

  const TemperatureDetailsWidget({super.key, required this.dailyWeather});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Max Temperature: ${dailyWeather.temp.max}°C'),
        Text('Min Temperature: ${dailyWeather.temp.min}°C'),
        Text('Morning: ${dailyWeather.temp.morn}°C'),
        Text('Evening: ${dailyWeather.temp.eve}°C'),
        Text('Night: ${dailyWeather.temp.night}°C'),
      ],
    );
  }
}
