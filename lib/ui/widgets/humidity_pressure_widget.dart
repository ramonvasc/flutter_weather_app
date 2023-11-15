import 'package:flutter/material.dart';
import 'package:weather_app/models/daily_weather.dart';

class HumidityPressureWidget extends StatelessWidget {
  final DailyWeather dailyWeather;

  const HumidityPressureWidget({super.key, required this.dailyWeather});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Humidity: ${dailyWeather.humidity}%'),
        Text('Pressure: ${dailyWeather.pressure} hPa'),
      ],
    );
  }
}
