import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/bloc/weather_bloc.dart';
import 'package:weather_app/bloc/weather_event.dart';
import 'package:weather_app/bloc/weather_state.dart';
import 'package:weather_app/ui/screens/daily_weather_detail_screen.dart';
import 'package:weather_app/ui/widgets/current_weather_widget.dart';
import 'package:weather_app/ui/widgets/daily_weather_widget.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
      ),
      body: BlocBuilder<WeatherBloc, WeatherState>(
        builder: (context, state) {
          if (state is WeatherInitial) {
            context.read<WeatherBloc>().add(FetchWeather());
            return const Center(child: CircularProgressIndicator());
          } else if (state is WeatherLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is WeatherLoaded) {
            return Column(
              children: [
                CurrentWeatherWidget(
                  currentWeather: state.weatherResponse.current,
                  locationName: state.locationName,
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: state.weatherResponse.daily.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => DailyWeatherDetailScreen(
                                dailyWeather:
                                    state.weatherResponse.daily[index],
                              ),
                            ),
                          );
                        },
                        child: DailyWeatherWidget(
                            dailyWeather: state.weatherResponse.daily[index]),
                      );
                    },
                  ),
                ),
              ],
            );
          } else if (state is WeatherError) {
            return Center(child: Text(state.message));
          } else {
            return const Center(child: Text('Unexpected state'));
          }
        },
      ),
    );
  }
}
