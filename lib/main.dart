import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_training/screen.dart';
import 'package:flutter_training/view/launch_view.dart';
import 'package:flutter_training/view/weather_forecast_view.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const LaunchView(),
      routes: {
        Screen.launch.route: (context) => const LaunchView(),
        Screen.weatherForecast.route: (context) => const WeatherForecastView(),
      },
    );
  }
}
