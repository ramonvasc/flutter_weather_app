import 'package:flutter/material.dart';
import 'package:weather_app/models/current_weather.dart';

class CurrentWeatherWidget extends StatelessWidget {
  final CurrentWeather currentWeather;
  final String locationName;

  const CurrentWeatherWidget(
      {super.key, required this.currentWeather, required this.locationName});

  @override
  Widget build(BuildContext context) {
    var temperature = currentWeather.temp.toString();
    var description = currentWeather.weather.isNotEmpty
        ? currentWeather.weather.first.description
        : 'No description';

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              locationName,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ), // Display location name
            Text('Temperature: $temperature°C'),
            Text(description),
            // Add more fields as needed
          ],
        ),
      ),
    );
  }
}
