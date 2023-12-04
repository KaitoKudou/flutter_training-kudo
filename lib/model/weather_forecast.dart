enum WeatherCondition {
  sunny(path: 'images/sunny.svg'),
  cloudy(path: 'images/cloudy.svg'),
  rainy(path: 'images/rainy.svg');

  const WeatherCondition({required this.path});

  final String path;
}
