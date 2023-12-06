import 'package:flutter_training/model/weather_condition.dart';
import 'package:yumemi_weather/yumemi_weather.dart';

class WeatherService {
  WeatherService(YumemiWeather client) : _client = client;

  final YumemiWeather _client;

  WeatherCondition fetchWeather() {
    final condition = _client.fetchSimpleWeather();

    return WeatherCondition.from(condition);
  }
}
