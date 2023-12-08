import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_training/end_of_screen_drawing_mixin.dart';
import 'package:flutter_training/screen.dart';

class LaunchView extends StatefulWidget {
  const LaunchView({super.key});

  @override
  State<LaunchView> createState() => _LaunchViewState();
}

class _LaunchViewState extends State<LaunchView> with EndOfScreenDrawingMixin {
  Future<void> toWeatherForecastView() async {
    await Future<void>.delayed(const Duration(milliseconds: 500));

    if (!context.mounted) {
      return;
    }

    await Navigator.pushNamed(context, Screen.weatherForecast.route);

    unawaited(toWeatherForecastView());
  }

  @override
  Widget build(BuildContext context) {
    return const ColoredBox(color: Colors.green);
  }

  @override
  void endOfScreenDrawing() {
    unawaited(toWeatherForecastView());
  }
}
