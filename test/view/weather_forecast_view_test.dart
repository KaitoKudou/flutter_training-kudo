import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_training/main.dart';
import 'package:flutter_training/model/weather_condition.dart';
import 'package:flutter_training/model/weather_data.dart';
import 'package:flutter_training/provider/weather_service_provider.dart';
import 'package:flutter_training/service/result.dart';
import 'package:flutter_training/service/weather_service.dart';
import 'package:flutter_training/view/component/common_text_button.dart';
import 'package:flutter_training/view/launch_view.dart';
import 'package:flutter_training/view/weather_forecast_view.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'weather_forecast_view_test.mocks.dart';

@GenerateNiceMocks([MockSpec<WeatherService>()])
void main() {
  late MockWeatherService mockWeatherService;
  const defaultResponse = Result<WeatherData, String>.success(
    WeatherData(
      weatherCondition: WeatherCondition.sunny,
      maxTemperature: 25,
      minTemperature: 7,
    ),
  );

  Future<void> initializeDeviceSurfaceSize() async {
    final binding = TestWidgetsFlutterBinding.ensureInitialized();
    await binding.setSurfaceSize(const Size(1179, 2556)); // iPhone15のサイズ

    addTearDown(() => binding.setSurfaceSize(null));
  }

  setUp(() {
    // Common Arrange
    mockWeatherService = MockWeatherService();
  });

  testWidgets('天気情報取得中にローディング画面になる', (widgetTester) async {
    await initializeDeviceSurfaceSize();

    // Arrange
    final completer = Completer<Result<WeatherData, String>>();
    await widgetTester.pumpWidget(
      ProviderScope(
        overrides: [
          weatherServiceProvider.overrideWithValue(mockWeatherService),
        ],
        child: const MaterialApp(
          home: WeatherForecastView(),
        ),
      ),
    );
    when(mockWeatherService.fetchWeather(any))
        .thenAnswer((_) async => completer.future);

    // Act
    await widgetTester.tap(find.byKey(CommonTextButton.reloadButton));
    await widgetTester.pump();

    // Assert
    final actual = find.byType(CircularProgressIndicator);
    expect(actual, findsOneWidget);
    completer.complete(defaultResponse);
  });

  testWidgets('天気予報画面に晴れの画像が表示される', (widgetTester) async {
    await initializeDeviceSurfaceSize();

    // Arrange
    final completer = Completer<Result<WeatherData, String>>();
    await widgetTester.pumpWidget(
      ProviderScope(
        overrides: [
          weatherServiceProvider.overrideWithValue(mockWeatherService),
        ],
        child: const MaterialApp(
          home: WeatherForecastView(),
        ),
      ),
    );
    when(mockWeatherService.fetchWeather(any))
        .thenAnswer((_) async => completer.future);

    // Act
    await widgetTester.tap(find.byKey(CommonTextButton.reloadButton));
    await widgetTester.pump();
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
    completer.complete(defaultResponse);
    await widgetTester.pump();

    // Assert
    final actual = find.bySemanticsLabel(WeatherCondition.sunny.name);
    expect(actual, findsOneWidget);
  });

  testWidgets('天気情報(曇り)の取得に成功した時に曇りの画像が表示される', (widgetTester) async {
    await initializeDeviceSurfaceSize();

    // Arrange
    final completer = Completer<Result<WeatherData, String>>();
    await widgetTester.pumpWidget(
      ProviderScope(
        overrides: [
          weatherServiceProvider.overrideWithValue(mockWeatherService),
        ],
        child: const MaterialApp(
          home: WeatherForecastView(),
        ),
      ),
    );
    const response = Result<WeatherData, String>.success(
      WeatherData(
        weatherCondition: WeatherCondition.cloudy,
        maxTemperature: 25,
        minTemperature: 7,
      ),
    );
    when(mockWeatherService.fetchWeather(any))
        .thenAnswer((_) async => completer.future);

    // Act
    await widgetTester.tap(find.byKey(CommonTextButton.reloadButton));
    await widgetTester.pump();
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
    completer.complete(response);
    await widgetTester.pump();

    // Assert
    final actual = find.bySemanticsLabel(WeatherCondition.cloudy.name);
    expect(actual, findsOneWidget);
  });

  testWidgets('天気情報(雨)の取得に成功した時に雨の画像が表示される', (widgetTester) async {
    await initializeDeviceSurfaceSize();

    // Arrange
    final completer = Completer<Result<WeatherData, String>>();
    await widgetTester.pumpWidget(
      ProviderScope(
        overrides: [
          weatherServiceProvider.overrideWithValue(mockWeatherService),
        ],
        child: const MaterialApp(
          home: WeatherForecastView(),
        ),
      ),
    );
    const response = Result<WeatherData, String>.success(
      WeatherData(
        weatherCondition: WeatherCondition.rainy,
        maxTemperature: 25,
        minTemperature: 7,
      ),
    );
    when(mockWeatherService.fetchWeather(any))
        .thenAnswer((_) async => completer.future);

    // Act
    await widgetTester.tap(find.byKey(CommonTextButton.reloadButton));
    await widgetTester.pump();
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
    completer.complete(response);
    await widgetTester.pump();

    // Assert
    final actual = find.bySemanticsLabel(WeatherCondition.rainy.name);
    expect(actual, findsOneWidget);
  });

  testWidgets('天気情報の取得に成功した時に最高気温が表示される', (widgetTester) async {
    await initializeDeviceSurfaceSize();

    // Arrange
    final completer = Completer<Result<WeatherData, String>>();
    await widgetTester.pumpWidget(
      ProviderScope(
        overrides: [
          weatherServiceProvider.overrideWithValue(mockWeatherService),
        ],
        child: const MaterialApp(
          home: WeatherForecastView(),
        ),
      ),
    );
    when(mockWeatherService.fetchWeather(any))
        .thenAnswer((_) async => completer.future);

    // Act
    await widgetTester.tap(find.byKey(CommonTextButton.reloadButton));
    await widgetTester.pump();
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
    completer.complete(defaultResponse);
    await widgetTester.pump();

    // Assert
    final actual = find.text('25℃');
    expect(actual, findsOneWidget);
  });

  testWidgets('天気情報の取得に成功した時に最低気温が表示される', (widgetTester) async {
    await initializeDeviceSurfaceSize();

    // Arrange
    final completer = Completer<Result<WeatherData, String>>();
    await widgetTester.pumpWidget(
      ProviderScope(
        overrides: [
          weatherServiceProvider.overrideWithValue(mockWeatherService),
        ],
        child: const MaterialApp(
          home: WeatherForecastView(),
        ),
      ),
    );
    when(mockWeatherService.fetchWeather(any))
        .thenAnswer((_) async => completer.future);

    // Act
    await widgetTester.tap(find.byKey(CommonTextButton.reloadButton));
    await widgetTester.pump();
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
    completer.complete(defaultResponse);
    await widgetTester.pump();

    // Assert
    final actual = find.text('7℃');
    expect(actual, findsOneWidget);
  });

  testWidgets('天天気情報の取得に失敗した時にエラーダイアログが表示される', (widgetTester) async {
    await initializeDeviceSurfaceSize();

    // Arrange
    final completer = Completer<Result<WeatherData, String>>();
    await widgetTester.pumpWidget(
      ProviderScope(
        overrides: [
          weatherServiceProvider.overrideWithValue(mockWeatherService),
        ],
        child: const MaterialApp(
          home: WeatherForecastView(),
        ),
      ),
    );
    const response = Result<WeatherData, String>.failure('不明なエラーです');
    when(mockWeatherService.fetchWeather(any))
        .thenAnswer((_) async => completer.future);

    // Act
    await widgetTester.tap(find.byKey(CommonTextButton.reloadButton));
    await widgetTester.pump();
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
    completer.complete(response);
    await widgetTester.pump();

    // Assert
    final actual = find.widgetWithText(AlertDialog, '不明なエラーです');
    expect(actual, findsOneWidget);
  });

  testWidgets('初期状態でプレースホルダー画像が表示される', (widgetTester) async {
    await initializeDeviceSurfaceSize();

    // Arrange
    await widgetTester.pumpWidget(
      const ProviderScope(
        child: MaterialApp(
          home: WeatherForecastView(),
        ),
      ),
    );

    // Assert
    final actual = find.byType(Placeholder);
    expect(actual, findsOneWidget);
  });

  testWidgets('初期状態でデフォルトの最高気温と最低気温が表示される', (widgetTester) async {
    await initializeDeviceSurfaceSize();

    // Arrange
    await widgetTester.pumpWidget(
      const ProviderScope(
        child: MaterialApp(
          home: WeatherForecastView(),
        ),
      ),
    );

    // Assert
    final actual = find.text('**℃');
    expect(actual, findsNWidgets(2));
  });

  testWidgets('クローズボタン押下で画面を閉じる', (widgetTester) async {
    await initializeDeviceSurfaceSize();

    await widgetTester.runAsync(() async {
      // Arrange
      await widgetTester.pumpWidget(
        const ProviderScope(
          child: MaterialApp(
            home: MainApp(),
          ),
        ),
      );
      await Future<void>.delayed(const Duration(milliseconds: 500));
      await widgetTester.pumpAndSettle();

      // Act
      await widgetTester.tap(find.byKey(CommonTextButton.closeButton));
      await widgetTester.pumpAndSettle();

      // Assert
      final actual = find.byType(LaunchView);
      expect(actual, findsOneWidget);
    });
  });
}
