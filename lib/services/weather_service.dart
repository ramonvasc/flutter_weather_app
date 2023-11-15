import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_app/models/weather_response.dart';

class WeatherService {
  final String apiKey;

  WeatherService(this.apiKey);

  Future<WeatherResponse?> getWeather(double latitude, double longitude) async {
    if (apiKey.isEmpty) {
      // Return null or an error response when the API key is invalid
      return null;
    }

    final url = Uri.parse(
        'https://api.openweathermap.org/data/2.5/onecall?lat=$latitude&lon=$longitude&units=metric&exclude=minutely,hourly,alerts&appid=$apiKey');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      return WeatherResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load weather data');
    }
  }
}
