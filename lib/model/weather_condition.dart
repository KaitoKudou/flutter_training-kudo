enum WeatherCondition {
  sunny,
  cloudy,
  rainy;

  factory WeatherCondition.from(String path) {
    return WeatherCondition.values.singleWhere(
      (condition) => condition.name == path,
      orElse: () => throw const FormatException('不適切なデータを受け取りました'),
    );
  }
}
