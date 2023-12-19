import 'package:flutter_training/service/weather_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:yumemi_weather/yumemi_weather.dart';

part 'weather_service_provider.g.dart';

@riverpod
WeatherService weatherService(WeatherServiceRef ref) {
  final client = YumemiWeather();
  return WeatherService(client);
}
