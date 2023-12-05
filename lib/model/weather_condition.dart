import 'package:flutter_training-kudo/gen/assets.gen.dart';

enum WeatherCondition {
  sunny(path: 'images/sunny.svg'),
  cloudy(path: 'images/cloudy.svg'),
  rainy(path: 'images/rainy.svg');

  const WeatherCondition({required this.path});

  factory WeatherCondition.from(String path) {
    return WeatherCondition.values.singleWhere(
      (condition) => condition.name == path,
      orElse: () => throw Exception('Unexpected weather condition: $path'),
    );
  }

  final String path;
}
