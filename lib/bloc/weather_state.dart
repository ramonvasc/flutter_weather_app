import 'package:weather_app/models/weather_response.dart';

abstract class WeatherState {}

class WeatherInitial extends WeatherState {}

class WeatherLoading extends WeatherState {}

class WeatherLoaded extends WeatherState {
  final WeatherResponse weatherResponse;
  final String locationName;

  WeatherLoaded(this.weatherResponse, this.locationName);
}

class WeatherError extends WeatherState {
  final String message;

  WeatherError(this.message);
}
