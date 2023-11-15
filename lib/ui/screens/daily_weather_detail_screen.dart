import 'package:flutter/material.dart';
import 'package:weather_app/models/daily_weather.dart';
import 'package:weather_app/ui/widgets/humidity_pressure_widget.dart';
import 'package:weather_app/ui/widgets/temperature_details_widget.dart';
import 'package:weather_app/ui/widgets/weather_description_widget.dart';
import 'package:weather_app/ui/widgets/wind_details_widget.dart';

class DailyWeatherDetailScreen extends StatelessWidget {
  final DailyWeather dailyWeather;

  const DailyWeatherDetailScreen({super.key, required this.dailyWeather});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Date: ${dailyWeather.formattedDate}',
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold)),
              const Divider(),
              TemperatureDetailsWidget(dailyWeather: dailyWeather),
              const Divider(),
              WindDetailsWidget(dailyWeather: dailyWeather),
              const Divider(),
              HumidityPressureWidget(dailyWeather: dailyWeather),
              const Divider(),
              WeatherDescriptionWidget(dailyWeather: dailyWeather),
            ],
          ),
        ),
      ),
    );
  }
}
