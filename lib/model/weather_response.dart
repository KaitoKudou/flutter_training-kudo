import 'dart:convert';

import 'package:flutter_training/model/weather_condition.dart';

class WeatherResponse {
  const WeatherResponse({
    required this.weatherCondition,
    required this.maxTemperature,
    required this.minTemperature,
  });

  factory WeatherResponse.fromJson(String jsonString) {
    final decoded = jsonDecode(jsonString) as Map<String, dynamic>;

    return WeatherResponse(
      weatherCondition:
          WeatherCondition.from(decoded['weather_condition'] as String),
      maxTemperature: decoded['max_temperature'] as int,
      minTemperature: decoded['min_temperature'] as int,
    );
  }

  final WeatherCondition weatherCondition;
  final int maxTemperature;
  final int minTemperature;
}
