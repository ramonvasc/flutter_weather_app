import 'package:mockito/mockito.dart';
import 'package:weather_app/bloc/weather_bloc.dart';
import 'package:weather_app/bloc/weather_state.dart';

// Create a MockWeatherBloc class
class MockWeatherBloc extends Mock implements WeatherBloc {
  @override
  WeatherState get state => super.noSuchMethod(
        Invocation.getter(#state),
        returnValue: WeatherInitial(),
        returnValueForMissingStub: WeatherInitial(),
      );

  @override
  Stream<WeatherState> get stream => super.noSuchMethod(
        Invocation.getter(#stream),
        returnValue: const Stream<
            WeatherState>.empty(), // Provide a default return value
        returnValueForMissingStub: const Stream<WeatherState>.empty(),
      );

  @override
  Future<void> close() {
    return super.noSuchMethod(
      Invocation.method(#close, []),
      returnValue: Future<void>.value(),
      returnValueForMissingStub: Future<void>.value(),
    );
  }
}
