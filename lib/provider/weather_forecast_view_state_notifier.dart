import 'package:flutter_training/model/weather_request.dart';
import 'package:flutter_training/provider/weather_data_state_notifier.dart';
import 'package:flutter_training/provider/weather_service_provider.dart';
import 'package:flutter_training/service/result.dart';
import 'package:flutter_training/view/weather/weather_forecast_view_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'weather_forecast_view_state_notifier.g.dart';

// ignore: provider_dependencies
@riverpod
class WeatherForecastViewStateNotifier
    extends _$WeatherForecastViewStateNotifier {
  // buildではUI側に渡したい型を初期化する
  @override
  WeatherForecastViewState build() {
    return const WeatherForecastViewState.initial();
  }

  Future<void> fetchWeather(WeatherRequest request) async {
    state = const WeatherForecastViewState.loading();
    final result = await ref.read(weatherServiceProvider).fetchWeather(request);
    switch (result) {
      case Success(value: final value):
        ref
            .read(weatherDataStateNotifierProvider.notifier)
            .updateWeatherData(value);
        state = WeatherForecastViewState.success(value);
      case Failure(exceptionMessage: final exceptionMessage):
        state = WeatherForecastViewState.failure(exceptionMessage);
    }
  }
}
