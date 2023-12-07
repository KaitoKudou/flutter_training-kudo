enum Screen {
  launch(route: '/launch'),
  weatherForecast(route: '/weather_forecast');

  const Screen({
    required this.route,
  });

  final String route;
}
