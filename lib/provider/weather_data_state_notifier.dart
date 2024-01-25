import 'package:flutter_training/model/weather_data.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'weather_data_state_notifier.g.dart';

@riverpod
class WeatherDataStateNotifier extends _$WeatherDataStateNotifier {
  // buildではUI側に渡したい型を初期化する
  @override
  WeatherData? build() {
    return null;
  }

  // ignore: use_setters_to_change_properties
  void updateWeatherData(WeatherData weatherData) {
    state = weatherData;
  }
}
