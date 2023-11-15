import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app/models/current_weather.dart';
import 'package:weather_app/models/weahter_detail.dart';
import 'package:weather_app/ui/widgets/current_weather_widget.dart';

void main() {
  testWidgets('CurrentWeatherWidget displays weather data',
      (WidgetTester tester) async {
    // Mock data for WeatherDetail
    final weatherDetail = WeatherDetail(
      id: 800,
      main: "Clear",
      description: "clear sky",
      icon: "01d",
    );

    // Mock data for CurrentWeather
    final currentWeather = CurrentWeather(
      dt: 1618317040, // Unix timestamp for date and time
      sunrise: 1618282134, // Unix timestamp for sunrise
      sunset: 1618333901, // Unix timestamp for sunset
      temp: 15.0, // Temperature in Celsius
      feelsLike: 14.5, // 'Feels like' temperature
      pressure: 1012, // Atmospheric pressure in hPa
      humidity: 60, // Humidity in percentage
      dewPoint: 10.0, // Dew point
      uvi: 5.0, // UV index
      clouds: 0, // Cloudiness in percentage
      visibility: 10000, // Visibility in meters
      windSpeed: 3.6, // Wind speed in m/s
      windDeg: 180, // Wind direction in degrees
      weather: [weatherDetail], // List of WeatherDetail
    );

    // Build our widget and trigger a frame
    await tester.pumpWidget(MaterialApp(
      home: CurrentWeatherWidget(
        currentWeather: currentWeather,
        locationName: 'Test Location',
      ),
    ));

    // Build our widget and trigger a frame
    await tester.pumpWidget(MaterialApp(
      home: CurrentWeatherWidget(
        currentWeather: currentWeather,
        locationName: 'Cupertino, Apple',
      ),
    ));

    // Verify that the widget displays the temperature and wind speed
    expect(find.text('Temperature: 15.0°C'), findsOneWidget);
    expect(find.text('Cupertino, Apple'), findsOneWidget);
  });
}
