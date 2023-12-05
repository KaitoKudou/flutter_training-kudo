enum WeatherCondition {
  sunny,
  cloudy,
  rainy;

  factory WeatherCondition.from(String path) {
    return WeatherCondition.values.singleWhere(
      (condition) => condition.name == path,
      orElse: () => throw Exception('Unexpected weather condition: $path'),
    );
  }
}
