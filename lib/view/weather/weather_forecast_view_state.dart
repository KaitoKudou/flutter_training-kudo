import 'package:flutter_training/model/weather_data.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'weather_forecast_view_state.freezed.dart';

@freezed
class WeatherForecastViewState with _$WeatherForecastViewState {
  const factory WeatherForecastViewState.initial() = Initial;
  const factory WeatherForecastViewState.loading() = Loading;
  const factory WeatherForecastViewState.success(WeatherData value) =
      WeatherForecastSuccessState;
  const factory WeatherForecastViewState.failure(String exceptionMessage) =
      WeatherForecastFailureState;
}
