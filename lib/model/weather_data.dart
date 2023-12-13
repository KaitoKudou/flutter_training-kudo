import 'package:flutter_training/model/weather_condition.dart';

class WeatherData {
  const WeatherData({
    required this.weatherCondition,
    required this.maxTemperature,
    required this.minTemperature,
  });

  factory WeatherData.fromJson(Map<String, dynamic> json) {
    final weatherCondition =
        WeatherCondition.from(json['weather_condition'].toString());
    final maxTemperature = int.parse(
      json['max_temperature'].toString(),
    );
    final minTemperature = int.parse(
      json['min_temperature'].toString(),
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
