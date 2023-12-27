import 'package:flutter_training/model/weather_data.dart';
import 'package:flutter_training/model/weather_request.dart';
import 'package:flutter_training/provider/weather_service_provider.dart';
import 'package:flutter_training/service/weather_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'weather_forecast_view_state.g.dart';

@Riverpod(dependencies: [weatherService])
class WeatherForecastViewState extends _$WeatherForecastViewState {
  // buildではUI側に渡したい型を初期化する
  @override
  WeatherData? build() {
    return null;
  }

  void fetchWeather(
    WeatherRequest request,
    void Function(String) failureAction,
  ) {
    final result = ref.read(weatherServiceProvider).fetchWeather(request);

    switch (result) {
      case Success(value: final value):
        state = value;
      case Failure(exceptionMessage: final exceptionMessage):
        failureAction(exceptionMessage);
    }
  }
}
