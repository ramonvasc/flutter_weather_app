import 'package:flutter/material.dart';
import 'package:weather_app/models/daily_weather.dart';

class DailyWeatherWidget extends StatelessWidget {
  final DailyWeather dailyWeather;

  const DailyWeatherWidget({super.key, required this.dailyWeather});

  @override
  Widget build(BuildContext context) {
    var dayTemperature = dailyWeather.temp.day.toString();
    var description = dailyWeather.weather.isNotEmpty
        ? dailyWeather.weather.first.description
        : 'No description';

    return ListTile(
      title: Text('${dailyWeather.formattedDate}: $dayTemperature°C'),
      subtitle: Text(description),
    );
  }
}
