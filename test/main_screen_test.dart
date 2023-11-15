import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:weather_app/bloc/weather_bloc.dart';
import 'package:weather_app/bloc/weather_state.dart';
import 'package:weather_app/ui/screens/main_screen.dart';

import 'mocks/mock_weather_block.dart';

void main() {
  group('MainScreen Tests', () {
    late MockWeatherBloc mockWeatherBloc;

    setUp(() {
      mockWeatherBloc = MockWeatherBloc();
    });

    testWidgets(
        'MainScreen displays loading indicator when state is WeatherLoading',
        (WidgetTester tester) async {
      when(mockWeatherBloc.state).thenReturn(WeatherLoading());

      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<WeatherBloc>(
            create: (context) => mockWeatherBloc,
            child: const MainScreen(),
          ),
        ),
      );

      // Verify that a loading indicator is displayed
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('MainScreen displays error message when state is WeatherError',
        (WidgetTester tester) async {
      const errorMessage = "Error loading weather";
      when(mockWeatherBloc.state).thenReturn(WeatherError(errorMessage));

      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<WeatherBloc>(
            create: (context) => mockWeatherBloc,
            child: const MainScreen(),
          ),
        ),
      );

      // Verify that an error message is displayed
      expect(find.text(errorMessage), findsOneWidget);
    });

    tearDown(() {
      mockWeatherBloc.close();
    });
  });
}
