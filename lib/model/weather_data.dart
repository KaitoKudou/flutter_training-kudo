import 'dart:convert';

import 'package:flutter_training/model/weather_condition.dart';

class WeatherData {
  const WeatherData({
    required this.weatherCondition,
    required this.maxTemperature,
    required this.minTemperature,
  });

  factory WeatherData.fromJson(String jsonString) {
    final decoded = jsonDecode(jsonString) as Map<String, dynamic>;
    final weatherCondition =
        WeatherCondition.from(decoded['weather_condition'].toString());
    final maxTemperature = int.parse(
      decoded['max_temperature'].toString(),
    );
    final minTemperature = int.parse(
      decoded['min_temperature'].toString(),
    );

    return WeatherData(
      weatherCondition: weatherCondition,
      maxTemperature: maxTemperature,
      minTemperature: minTemperature,
    );
  }

  final WeatherCondition weatherCondition;
  final int maxTemperature;
  final int minTemperature;
}
