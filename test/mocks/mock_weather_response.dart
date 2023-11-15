import 'package:weather_app/models/current_weather.dart';
import 'package:weather_app/models/daily_weather.dart';
import 'package:weather_app/models/temperature.dart';
import 'package:weather_app/models/weahter_detail.dart';
import 'package:weather_app/models/weather_response.dart';

class MockWeatherResponse {
  static WeatherResponse get mockResponse {
    // Mock data for WeatherDetail
    final weatherDetailClear = WeatherDetail(
        id: 800, main: "Clear", description: "clear sky", icon: "01d");
    final weatherDetailClouds = WeatherDetail(
        id: 802, main: "Clouds", description: "scattered clouds", icon: "03d");

    // Mock data for CurrentWeather
    final currentWeather = CurrentWeather(
      dt: 1700074115,
      sunrise: 1700048558,
      sunset: 1700084325,
      temp: 284.32,
      feelsLike: 282.9,
      pressure: 1029,
      humidity: 54,
      dewPoint: 275.37,
      uvi: 1.22,
      clouds: 0,
      visibility: 10000,
      windSpeed: 5.14,
      windDeg: 220,
      weather: [weatherDetailClear],
    );

    // Mock data for DailyWeather (add as many days as needed)
    final dailyWeatherList = <DailyWeather>[
      DailyWeather(
        dt: 1700064000,
        sunrise: 1700048558,
        sunset: 1700084325,
        temp: Temperature(
            day: 283,
            min: 278.57,
            max: 284.4,
            night: 282.54,
            eve: 284.17,
            morn: 278.75),
        feelsLike: {
          "day": 281.52,
          "night": 280.44,
          "eve": 282.58,
          "morn": 278.75
        },
        pressure: 1030,
        humidity: 54,
        dewPoint: 274.14,
        windSpeed: 4.29,
        windDeg: 220,
        weather: [weatherDetailClouds],
        clouds: 25,
        pop: 0,
        uvi: 2.21,
      ),
      // Add more DailyWeather objects for each day as needed
    ];

    // Create the mock WeatherResponse
    return WeatherResponse(
      lat: 40.7128,
      lon: -74.006,
      timezone: "America/New_York",
      timezoneOffset: -18000,
      current: currentWeather,
      daily: dailyWeatherList,
    );
  }
}
