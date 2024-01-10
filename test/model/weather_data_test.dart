import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_training/model/weather_condition.dart';
import 'package:flutter_training/model/weather_data.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

void main() {
  group('WeatherData fromJosn', () {
    test('レスポンスデータのJSONをデコードに成功', () {
      // Arrange
      const responseJson = '''
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

      // Act
      final weatherData = jsonDecode(responseJson) as Map<String, dynamic>;
      final actual = WeatherData.fromJson(weatherData);

      // Assert
      expect(actual, expected);
    });

    test('レスポンスデータのJSONをデコードに失敗(CheckedFromJsonException)', () {
      // Arrange
      const responseJson = '''
      {
        "weather_condition":"cloudy",
        "max_temperature":"25",
        "min_temperature":7
       }
      ''';

      // Act
      final weatherData = jsonDecode(responseJson) as Map<String, dynamic>;

      // Assert
      expect(
        () => WeatherData.fromJson(weatherData),
        throwsA(isA<CheckedFromJsonException>()),
      );
    });
  });
}
