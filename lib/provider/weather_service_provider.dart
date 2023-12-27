import 'package:flutter_training/provider/yumemi_weather_provider.dart';
import 'package:flutter_training/service/weather_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'weather_service_provider.g.dart';

@Riverpod(keepAlive: true, dependencies: [yumemiWeather])
WeatherService weatherService(WeatherServiceRef ref) {
  final client = ref.watch(yumemiWeatherProvider);
  return WeatherService(client);
}
