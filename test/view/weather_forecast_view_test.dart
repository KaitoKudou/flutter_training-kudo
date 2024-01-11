import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_training/provider/yumemi_weather_provider.dart';
import 'package:flutter_training/view/component/common_text_button.dart';
import 'package:flutter_training/view/weather_forecast_view.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:yumemi_weather/yumemi_weather.dart';

import 'weather_forecast_view_test.mocks.dart';

@GenerateNiceMocks([MockSpec<YumemiWeather>()])
void main() {
  late MockYumemiWeather mockYumemiWeather;

  setUp(() {
    // Common Arrange
    mockYumemiWeather = MockYumemiWeather();
  });

  testWidgets('天気予報画面に晴れの画像が表示される', (widgetTester) async {
    final binding = TestWidgetsFlutterBinding.ensureInitialized();
    await binding.setSurfaceSize(const Size(1179, 2556)); // iPhone15のサイズ

    addTearDown(() => binding.setSurfaceSize(null));

    // Arrange
    await widgetTester.pumpWidget(
      ProviderScope(
        overrides: [
          yumemiWeatherProvider.overrideWithValue(mockYumemiWeather),
        ],
        child: const MaterialApp(
          home: WeatherForecastView(),
        ),
      ),
    );
    const response = '''
      {
        "weather_condition":"sunny",
        "max_temperature":25,
        "min_temperature":7
       }
      ''';
    when(mockYumemiWeather.fetchWeather(any)).thenReturn(response);

    // Act
    await widgetTester.tap(find.byKey(CommonTextButton.reloadButton));
    await widgetTester.pump();

    // Assert
    final actual = find.bySemanticsLabel('sunny image');
    expect(actual, findsOneWidget);
  });

  testWidgets('天気予報画面に曇りの画像が表示される', (widgetTester) async {
    final binding = TestWidgetsFlutterBinding.ensureInitialized();
    await binding.setSurfaceSize(const Size(1179, 2556)); // iPhone15のサイズ

    addTearDown(() => binding.setSurfaceSize(null));

    // Arrange
    await widgetTester.pumpWidget(
      ProviderScope(
        overrides: [
          yumemiWeatherProvider.overrideWithValue(mockYumemiWeather),
        ],
        child: const MaterialApp(
          home: WeatherForecastView(),
        ),
      ),
    );
    const response = '''
      {
        "weather_condition":"cloudy",
        "max_temperature":25,
        "min_temperature":7
       }
      ''';
    when(mockYumemiWeather.fetchWeather(any)).thenReturn(response);

    // Act
    await widgetTester.tap(find.byKey(CommonTextButton.reloadButton));
    await widgetTester.pump();

    // Assert
    final actual = find.bySemanticsLabel('cloudy image');
    expect(actual, findsOneWidget);
  });

  testWidgets('天気予報画面に雨の画像が表示される', (widgetTester) async {
    final binding = TestWidgetsFlutterBinding.ensureInitialized();
    await binding.setSurfaceSize(const Size(1179, 2556)); // iPhone15のサイズ

    addTearDown(() => binding.setSurfaceSize(null));

    // Arrange
    await widgetTester.pumpWidget(
      ProviderScope(
        overrides: [
          yumemiWeatherProvider.overrideWithValue(mockYumemiWeather),
        ],
        child: const MaterialApp(
          home: WeatherForecastView(),
        ),
      ),
    );
    const response = '''
      {
        "weather_condition":"rainy",
        "max_temperature":25,
        "min_temperature":7
       }
      ''';
    when(mockYumemiWeather.fetchWeather(any)).thenReturn(response);

    // Act
    await widgetTester.tap(find.byKey(CommonTextButton.reloadButton));
    await widgetTester.pump();

    // Assert
    final actual = find.bySemanticsLabel('rainy image');
    expect(actual, findsOneWidget);
  });

  testWidgets('天気予報画面に最高気温が表示される', (widgetTester) async {
    final binding = TestWidgetsFlutterBinding.ensureInitialized();
    await binding.setSurfaceSize(const Size(1179, 2556)); // iPhone15のサイズ

    addTearDown(() => binding.setSurfaceSize(null));

    // Arrange
    await widgetTester.pumpWidget(
      ProviderScope(
        overrides: [
          yumemiWeatherProvider.overrideWithValue(mockYumemiWeather),
        ],
        child: const MaterialApp(
          home: WeatherForecastView(),
        ),
      ),
    );
    const response = '''
      {
        "weather_condition":"sunny",
        "max_temperature":25,
        "min_temperature":7
       }
      ''';
    when(mockYumemiWeather.fetchWeather(any)).thenReturn(response);

    // Act
    await widgetTester.tap(find.byKey(CommonTextButton.reloadButton));
    await widgetTester.pump();

    // Assert
    final actual = find.text('25℃');
    expect(actual, findsOneWidget);
  });

  testWidgets('天気予報画面に最低気温が表示される', (widgetTester) async {
    final binding = TestWidgetsFlutterBinding.ensureInitialized();
    await binding.setSurfaceSize(const Size(1179, 2556)); // iPhone15のサイズ

    addTearDown(() => binding.setSurfaceSize(null));

    // Arrange
    await widgetTester.pumpWidget(
      ProviderScope(
        overrides: [
          yumemiWeatherProvider.overrideWithValue(mockYumemiWeather),
        ],
        child: const MaterialApp(
          home: WeatherForecastView(),
        ),
      ),
    );
    const response = '''
      {
        "weather_condition":"sunny",
        "max_temperature":25,
        "min_temperature":7
       }
      ''';
    when(mockYumemiWeather.fetchWeather(any)).thenReturn(response);

    // Act
    await widgetTester.tap(find.byKey(CommonTextButton.reloadButton));
    await widgetTester.pump();

    // Assert
    final actual = find.text('7℃');
    expect(actual, findsOneWidget);
  });

  testWidgets('天気予報画面にダイアログが表示され、特定のメッセージが表示されること', (widgetTester) async {
    final binding = TestWidgetsFlutterBinding.ensureInitialized();
    await binding.setSurfaceSize(const Size(1179, 2556)); // iPhone15のサイズ

    addTearDown(() => binding.setSurfaceSize(null));

    // Arrange
    await widgetTester.pumpWidget(
      ProviderScope(
        overrides: [
          yumemiWeatherProvider.overrideWithValue(mockYumemiWeather),
        ],
        child: const MaterialApp(
          home: WeatherForecastView(),
        ),
      ),
    );
    when(mockYumemiWeather.fetchWeather(any))
        .thenThrow(YumemiWeatherError.unknown);

    // Act
    await widgetTester.tap(find.byKey(CommonTextButton.reloadButton));
    await widgetTester.pump();

    // Assert
    final actual = find.widgetWithText(AlertDialog, '不明なエラーです');
    expect(actual, findsOneWidget);
  });
}
