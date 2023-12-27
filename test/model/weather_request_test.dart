import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_training/model/weather_request.dart';

void main() {
  group('WeatherRequest toJosn', () {
    test('リクエストデータをJSONにエンコード', () {
      // Arrange
      final request =
          WeatherRequest(area: 'tokyo', date: DateTime(2023, 12, 26));
      const expected = '{"area":"tokyo","date":"2023-12-26T00:00:00.000"}';

      // Act
      final actual = jsonEncode(request);

      // Assert
      expect(actual, expected);
    });
  });
}
