import 'package:flutter_training/model/weather_forecast.dart';
import 'package:yumemi_weather/yumemi_weather.dart';

class WeatherService {
  WeatherCondition fetchWeather() {
    final client = YumemiWeather();
    final condition = client.fetchSimpleWeather();

    switch (condition) {
      case 'sunny':
        return WeatherCondition.sunny;
      case 'cloudy':
        return WeatherCondition.cloudy;
      case 'rainy':
        return WeatherCondition.rainy;
      default:
        throw Exception('Unexpected weather condition: $condition');
    }
  }
}
