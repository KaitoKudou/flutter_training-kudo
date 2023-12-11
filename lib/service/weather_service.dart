import 'dart:convert';

import 'package:flutter_training/model/weather_request.dart';
import 'package:flutter_training/model/weather_response.dart';
import 'package:yumemi_weather/yumemi_weather.dart';

class WeatherService {
  WeatherService(YumemiWeather client) : _client = client;

  final YumemiWeather _client;

  Result<WeatherResponse, String> fetchWeather(WeatherRequest request) {
    try {
      final jsonString = jsonEncode(request.toJson());
      final condition = _client.fetchWeather(jsonString);
      return Success(WeatherResponse.fromJson(condition));
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
