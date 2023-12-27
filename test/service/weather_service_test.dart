import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_training/model/weather_condition.dart';
import 'package:flutter_training/model/weather_data.dart';
import 'package:flutter_training/model/weather_request.dart';
import 'package:flutter_training/provider/weather_service_provider.dart';
import 'package:flutter_training/provider/yumemi_weather_provider.dart';
import 'package:flutter_training/service/weather_service.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:yumemi_weather/yumemi_weather.dart';

import 'weather_service_test.mocks.dart';

@GenerateNiceMocks([MockSpec<YumemiWeather>()])
void main() {
  late MockYumemiWeather mockYumemiWeather;
  late ProviderContainer container;
  late WeatherRequest request;

  group('Weather Service Tests', () {
    setUpAll(() {
      // Common Arrange
      mockYumemiWeather = MockYumemiWeather();
      container = ProviderContainer(
        overrides: [yumemiWeatherProvider.overrideWithValue(mockYumemiWeather)],
      );
      request = WeatherRequest(
        area: 'tokyo',
        date: DateTime.now(),
      );
    });

    tearDownAll(() {
      addTearDown(container.dispose);
    });

    test('天気情報の取得に成功した場合', () {
      // Arrange
      const expectedResponseJson = '''
      {
        "weather_condition":"cloudy",
        "max_temperature":25,
        "min_temperature":7
       }
      ''';
      when(mockYumemiWeather.fetchWeather(any))
          .thenReturn(expectedResponseJson);

      // Act
      final actual =
          container.read(weatherServiceProvider).fetchWeather(request);

      // Assert
      expectSuccessResult(
        actual,
        const WeatherData(
          weatherCondition: WeatherCondition.cloudy,
          maxTemperature: 25,
          minTemperature: 7,
        ),
      );
    });

    test('天気情報の取得に失敗した場合(YumemiWeatherError.unknown)', () {
      // Arrange
      when(mockYumemiWeather.fetchWeather(any))
          .thenThrow(YumemiWeatherError.unknown);

      // Act
      final actual =
          container.read(weatherServiceProvider).fetchWeather(request);

      // Assert
      expectFailureResult(actual, '不明なエラーです');
    });

    test('天気情報の取得に失敗した場合(YumemiWeatherError.invalidParameter)', () {
      // Arrange
      when(mockYumemiWeather.fetchWeather(any))
          .thenThrow(YumemiWeatherError.invalidParameter);

      // Act
      final actual =
          container.read(weatherServiceProvider).fetchWeather(request);

      // Assert
      expectFailureResult(actual, '無効なパラメータが入力されました');
    });

    test('天気情報の取得に失敗した場合(CheckedFromJsonException)', () {
      // Arrange
      const expectedResponseJson = '''
      {
        "weather_condition":"cloudy",
        "max_temperature":"25",
        "min_temperature":7
       }
      ''';
      when(mockYumemiWeather.fetchWeather(any))
          .thenReturn(expectedResponseJson);

      // Act
      final actual =
          container.read(weatherServiceProvider).fetchWeather(request);

      // Assert
      expectFailureResult(actual, '不適切なデータを受け取りました');
    });
  });
}

void expectSuccessResult(
  Result<WeatherData, String> actual,
  WeatherData expectedValue,
) {
  expect(
    actual,
    isA<Success<WeatherData, String>>().having(
      (success) => success.value,
      'expected weather data',
      expectedValue,
    ),
  );
}

void expectFailureResult(
  Result<WeatherData, String> actual,
  String expectedExceptionMessage,
) {
  expect(
    actual,
    isA<Failure<WeatherData, String>>().having(
      (failure) => failure.exceptionMessage,
      'expected exception message',
      expectedExceptionMessage,
    ),
  );
}
