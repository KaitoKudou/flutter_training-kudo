import 'package:flutter_training/model/weather_condition.dart';
import 'package:yumemi_weather/yumemi_weather.dart';

class WeatherService {
  WeatherService(YumemiWeather client) : _client = client;

  final YumemiWeather _client;

  Result fetchWeather() {
    try {
      final condition = _client.fetchThrowsWeather('tokyo');
      return Success(WeatherCondition.from(condition));
    } on YumemiWeatherError catch (e) {
      return Failure(e.toExceptionMessage);
    }
  }
}

sealed class Result {}

class Success implements Result {
  const Success(this.value);
  final WeatherCondition value;
}

class Failure implements Result {
  const Failure(this.exceptionMessage);
  final String exceptionMessage;
}

extension YumemiWeatherErrorException on YumemiWeatherError {
  String get toExceptionMessage => switch (this) {
        YumemiWeatherError.invalidParameter => '無効なパラメータが入力されました',
        YumemiWeatherError.unknown => '不明なエラーです',
      };
}
