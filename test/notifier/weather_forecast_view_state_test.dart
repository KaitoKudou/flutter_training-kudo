import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_training/model/weather_condition.dart';
import 'package:flutter_training/model/weather_data.dart';
import 'package:flutter_training/model/weather_request.dart';
import 'package:flutter_training/notifier/weather_forecast_view_state.dart';
import 'package:flutter_training/provider/yumemi_weather_provider.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:yumemi_weather/yumemi_weather.dart';

import 'weather_forecast_view_state_test.mocks.dart';

@GenerateNiceMocks([MockSpec<YumemiWeather>()])
void main() {
  late MockYumemiWeather mockYumemiWeather;
  late ProviderContainer container;
  late WeatherRequest request;
  String? exceptionMessage;

  group('Weather Forecast View State Tests', () {
    setUp(() {
      // Common Arrange
      mockYumemiWeather = MockYumemiWeather();
      container = ProviderContainer(
        overrides: [yumemiWeatherProvider.overrideWithValue(mockYumemiWeather)],
      );
      request = WeatherRequest(
        area: 'tokyo',
        date: DateTime.now(),
      );
      exceptionMessage = null;
    });

    tearDown(() {
      addTearDown(container.dispose);
    });

    test('stateの更新に成功した場合', () {
      // Arrange
      const expectedResponseJson = '''
      {
        "weather_condition":"cloudy",
        "max_temperature":25,
        "min_temperature":7
       }
      ''';
      const expectedState = WeatherData(
        weatherCondition: WeatherCondition.cloudy,
        maxTemperature: 25,
        minTemperature: 7,
      );
      when(mockYumemiWeather.fetchWeather(any))
          .thenReturn(expectedResponseJson);

      // Act
      final initialState = container.read(weatherForecastViewStateProvider);
      final actualState =
          _fetchWeatherAndReturnState(container, request: request);

      // Assert
      expect(initialState, null);
      expect(actualState, expectedState);
    });

    test('stateの更新に失敗した場合(YumemiWeatherError.unknown)', () {
      // Arrange
      when(mockYumemiWeather.fetchWeather(any))
          .thenThrow(YumemiWeatherError.unknown);

      // Act
      expect(exceptionMessage, null);
      container.read(weatherForecastViewStateProvider.notifier).fetchWeather(
        request,
        (error) {
          exceptionMessage = error;
        },
      );
      final state = _fetchWeatherAndReturnState(container, request: request);
      expect(state, null);

      // Assert
      expect(exceptionMessage, '不明なエラーです');
    });

    test('stateの更新に失敗した場合(YumemiWeatherError.invalidParameter)', () {
      // Arrange
      when(mockYumemiWeather.fetchWeather(any))
          .thenThrow(YumemiWeatherError.invalidParameter);

      // Act
      expect(exceptionMessage, null);
      container.read(weatherForecastViewStateProvider.notifier).fetchWeather(
        request,
        (error) {
          exceptionMessage = error;
        },
      );
      final state = _fetchWeatherAndReturnState(container, request: request);
      expect(state, null);

      // Assert
      expect(exceptionMessage, '無効なパラメータが入力されました');
    });

    test('stateの更新に失敗した場合(CheckedFromJsonException)', () {
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
      expect(exceptionMessage, null);
      container.read(weatherForecastViewStateProvider.notifier).fetchWeather(
        request,
        (error) {
          exceptionMessage = error;
        },
      );
      final state = _fetchWeatherAndReturnState(container, request: request);
      expect(state, null);

      // Assert
      expect(exceptionMessage, '不適切なデータを受け取りました');
    });
  });
}

WeatherData? _fetchWeatherAndReturnState(
  ProviderContainer container, {
  required WeatherRequest request,
}) {
  container.read(weatherForecastViewStateProvider.notifier).fetchWeather(
        request,
        (_) {},
      );
  return container.read(weatherForecastViewStateProvider);
}
