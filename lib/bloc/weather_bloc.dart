import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/bloc/weather_event.dart';
import 'package:weather_app/bloc/weather_state.dart';
import 'package:weather_app/services/location_service.dart';
import 'package:weather_app/services/weather_service.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherService weatherService;
  final LocationService locationService;

  WeatherBloc({
    required this.weatherService,
    required this.locationService,
  }) : super(WeatherInitial()) {
    on<FetchWeather>(_onFetchWeather);
  }

  Future<void> _onFetchWeather(
      FetchWeather event, Emitter<WeatherState> emit) async {
    try {
      emit(WeatherLoading());
      Position? position = await locationService.getCurrentLocation();

      double latitude = position?.latitude ?? 40.7128; // Default latitude
      double longitude = position?.longitude ?? -74.0060; // Default longitude

      String locationName = await _getPlaceName(latitude, longitude);

      final weatherResponse =
          await weatherService.getWeather(latitude, longitude);
      if (weatherResponse == null) {
        emit(WeatherError("Invalid API key. Please provide a valid API key."));
      } else {
        emit(WeatherLoaded(weatherResponse, locationName));
      }
    } catch (error) {
      emit(WeatherError("Error loading weather: ${error.toString()}"));
    }
  }

  Future<String> _getPlaceName(double latitude, double longitude) async {
    try {
      List<Placemark> placemarks =
          await placemarkFromCoordinates(latitude, longitude);
      if (placemarks.isNotEmpty) {
        return "${placemarks.first.locality}, ${placemarks.first.country}";
      }
      return "Unknown Location";
    } catch (e) {
      return "Location Unavailable";
    }
  }
}
