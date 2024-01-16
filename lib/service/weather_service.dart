import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_training/model/weather_data.dart';
import 'package:flutter_training/model/weather_request.dart';
import 'package:flutter_training/service/result.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yumemi_weather/yumemi_weather.dart';

class WeatherService {
  WeatherService(YumemiWeather client) : _client = client;

  final YumemiWeather _client;

  /// [YumemiWeather.syncFetchWeather]は内部で同期処理を行っているため、メインスレッドがブロックされる
  /// [compute]を使って、別isolateで処理を行うようにし、メインスレッドのブロックを防ぐ
  Future<Result<WeatherData, String>> fetchWeather(
    WeatherRequest request,
  ) async {
    try {
      final requestJson = jsonEncode(request);
      final responseJson = await compute(_client.syncFetchWeather, requestJson);
      final weatherData = jsonDecode(responseJson) as Map<String, dynamic>;
      return Success(WeatherData.fromJson(weatherData));
    } on CheckedFromJsonException catch (_) {
      return const Failure('不適切なデータを受け取りました');
    } on YumemiWeatherError catch (e) {
      return Failure(e.toExceptionMessage);
    } on Exception catch (_) {
      return const Failure('例外エラーが発生しました');
    }
  }
}

extension YumemiWeatherErrorException on YumemiWeatherError {
  String get toExceptionMessage => switch (this) {
        YumemiWeatherError.invalidParameter => '無効なパラメータが入力されました',
        YumemiWeatherError.unknown => '不明なエラーです',
      };
}
