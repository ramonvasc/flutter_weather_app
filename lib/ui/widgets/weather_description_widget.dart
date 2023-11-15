import 'package:flutter/material.dart';
import 'package:weather_app/models/daily_weather.dart';

class WeatherDescriptionWidget extends StatelessWidget {
  final DailyWeather dailyWeather;

  const WeatherDescriptionWidget({super.key, required this.dailyWeather});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Weather Description:',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        ...dailyWeather.weather
            .map((detail) => Text(detail.description))
            .toList(),
      ],
    );
  }
}
