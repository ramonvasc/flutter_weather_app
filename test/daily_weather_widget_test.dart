import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app/models/daily_weather.dart';
import 'package:weather_app/models/temperature.dart';
import 'package:weather_app/models/weahter_detail.dart';
import 'package:weather_app/ui/widgets/daily_weather_widget.dart';

void main() {
  testWidgets('DailyWeatherWidget displays daily weather data',
      (WidgetTester tester) async {
    // Mock data for Temperature
    final testTemperature = Temperature(
      day: 20.0,
      min: 15.0,
      max: 22.0,
      night: 18.0,
      eve: 21.0,
      morn: 16.0,
    );

    // Mock data for WeatherDetail
    final weatherDetail = WeatherDetail(
      id: 500,
      main: "Rain",
      description: "light rain",
      icon: "10d",
    );

    // Creating an instance of DailyWeather with test data
    final dailyWeather = DailyWeather(
      dt: 1618317040, // Unix timestamp for date and time
      sunrise: 1618282134, // Unix timestamp for sunrise
      sunset: 1618333901, // Unix timestamp for sunset
      temp: testTemperature, // Temperature object
      feelsLike: {
        "day": 19.0,
        "night": 17.0,
        "eve": 20.0,
        "morn": 15.0
      }, // Feels like temperatures
      pressure: 1012, // Atmospheric pressure in hPa
      humidity: 60, // Humidity in percentage
      dewPoint: 10.0, // Dew point
      uvi: 5.0, // UV index
      clouds: 75, // Cloudiness in percentage
      windSpeed: 3.6, // Wind speed in m/s
      windDeg: 180, // Wind direction in degrees
      weather: [weatherDetail], // List of WeatherDetail
      pop: 0.5, // Probability of precipitation
    );

    // Build our widget and trigger a frame, wrapping DailyWeatherWidget with Material
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: Material(
          child: DailyWeatherWidget(dailyWeather: dailyWeather),
        ),
      ),
    ));

    // Verify that the widget displays the expected data
    expect(find.text('Tuesday, April 13: 20.0°C'), findsOneWidget);
    expect(find.text('light rain'), findsOneWidget);
  });
}
