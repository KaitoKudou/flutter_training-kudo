import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_training/model/weather_condition.dart';
import 'package:flutter_training/model/weather_data.dart';
import 'package:flutter_training/model/weather_request.dart';
import 'package:flutter_training/provider/weather_forecast_view_state_notifier.dart';
import 'package:flutter_training/provider/yumemi_weather_provider.dart';
import 'package:flutter_training/view/weather/weather_forecast_view_state.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:yumemi_weather/yumemi_weather.dart';

import 'weather_forecast_view_state_test.mocks.dart';

class Listener<T> extends Mock {
  void call(T? previous, T value);
}

@GenerateNiceMocks([MockSpec<YumemiWeather>()])
void main() {
  late MockYumemiWeather mockYumemiWeather;
  late Listener<WeatherForecastViewState> mockListener;
  late ProviderContainer container;
  late WeatherRequest request;

  group('Weather Forecast View State Tests', () {
    setUp(() {
      // Common Arrange
      mockYumemiWeather = MockYumemiWeather();
      mockListener = Listener();
      container = ProviderContainer(
        overrides: [yumemiWeatherProvider.overrideWithValue(mockYumemiWeather)],
      );
      container.listen<WeatherForecastViewState>(
        weatherForecastViewStateNotifierProvider,
        mockListener.call,
        fireImmediately: true,
      );
      request = WeatherRequest(
        area: 'tokyo',
        date: DateTime.now(),
      );
    });

    tearDown(() {
      addTearDown(container.dispose);
    });

    test('天気情報取得中にローディング状態になる', () async {
      // Arrange
      const expectedResponseJson = '''
      {
        "weather_condition":"cloudy",
        "max_temperature":25,
        "min_temperature":7
       }
      ''';
      when(mockYumemiWeather.syncFetchWeather(any))
          .thenReturn(expectedResponseJson);

      // Act
      await _fetchWeatherAndReturnState(container, request: request);

      // Assert
      verifyInOrder(
        [
          mockListener.call(
            null,
            const WeatherForecastViewState.initial(),
          ),
          mockListener.call(
            const WeatherForecastViewState.initial(),
            const WeatherForecastViewState.loading(),
          ),
        ],
      );
    });

    test('stateの更新に成功した場合', () async {
      // Arrange
      const expectedResponseJson = '''
      {
        "weather_condition":"cloudy",
        "max_temperature":25,
        "min_temperature":7
       }
      ''';
      const expected = WeatherData(
        weatherCondition: WeatherCondition.cloudy,
        maxTemperature: 25,
        minTemperature: 7,
      );
      when(mockYumemiWeather.syncFetchWeather(any))
          .thenReturn(expectedResponseJson);

      // Act
      final initialState =
          container.read(weatherForecastViewStateNotifierProvider);
      final actualState =
          await _fetchWeatherAndReturnState(container, request: request);

      // Assert
      expect(initialState, const WeatherForecastViewState.initial());
      expect(actualState, const WeatherForecastViewState.success(expected));
    });

    test('stateの更新に失敗した場合(YumemiWeatherError.unknown)', () async {
      // Arrange
      when(mockYumemiWeather.syncFetchWeather(any))
          .thenThrow(YumemiWeatherError.unknown);

      // Act
      final actualState =
          await _fetchWeatherAndReturnState(container, request: request);

      // Assert
      expect(
        actualState,
        const WeatherForecastViewState.failure('不明なエラーです'),
      );
    });

    test('stateの更新に失敗した場合(YumemiWeatherError.invalidParameter)', () async {
      // Arrange
      when(mockYumemiWeather.syncFetchWeather(any))
          .thenThrow(YumemiWeatherError.invalidParameter);

      // Act
      final actualState =
          await _fetchWeatherAndReturnState(container, request: request);

      // Assert
      expect(
        actualState,
        const WeatherForecastViewState.failure('無効なパラメータが入力されました'),
      );
    });

    test('stateの更新に失敗した場合(CheckedFromJsonException)', () async {
      // Arrange
      const responseJson = '''
      {
        "weather_condition":"cloudy",
        "max_temperature":"25",
        "min_temperature":7
       }
      ''';
      when(mockYumemiWeather.fetchWeather(any)).thenReturn(responseJson);

      // Act
      final actualState =
          await _fetchWeatherAndReturnState(container, request: request);

      // Assert
      expect(
        actualState,
        const WeatherForecastViewState.failure('例外エラーが発生しました'),
      );
    });
  });
}

Future<WeatherForecastViewState> _fetchWeatherAndReturnState(
  ProviderContainer container, {
  required WeatherRequest request,
}) async {
  await container
      .read(weatherForecastViewStateNotifierProvider.notifier)
      .fetchWeather(
        request,
      );
  return container.read(weatherForecastViewStateNotifierProvider);
}
