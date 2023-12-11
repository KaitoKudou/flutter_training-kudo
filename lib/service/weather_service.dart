import 'package:flutter_training/model/weather_condition.dart';
import 'package:yumemi_weather/yumemi_weather.dart';

class WeatherService {
  WeatherService(YumemiWeather client) : _client = client;

  final YumemiWeather _client;

  Result<WeatherCondition, String> fetchWeather() {
    try {
      final condition = _client.fetchThrowsWeather('tokyo');
      return Success(WeatherCondition.from(condition));
    } on YumemiWeatherError catch (e) {
      return Failure(e.toExceptionMessage);
    } on Exception catch (_) {
      return const Failure('例外エラーが発生しました');
    }
  }
}

sealed class Result<S, E> {}

class Success<S, E> implements Result<S, E> {
  const Success(this.value);
  final S value;
}

class Failure<S, E> implements Result<S, E> {
  const Failure(this.exceptionMessage);
  final E exceptionMessage;
}

extension YumemiWeatherErrorException on YumemiWeatherError {
  String get toExceptionMessage => switch (this) {
        YumemiWeatherError.invalidParameter => '無効なパラメータが入力されました',
        YumemiWeatherError.unknown => '不明なエラーです',
      };
}
