import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/services/location_service.dart';
import 'package:weather_app/services/weather_service.dart';
import 'package:weather_app/ui/screens/main_screen.dart';
import 'bloc/weather_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Replace '' with the actual API key for
    // https://openweathermap.org/api/one-call-3
    final WeatherService weatherService = WeatherService('');
    final LocationService locationService = LocationService();

    return MaterialApp(
      title: 'Flutter Weather App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) => WeatherBloc(
          weatherService: weatherService,
          locationService: locationService,
        ),
        child: const MainScreen(),
      ),
    );
  }
}
