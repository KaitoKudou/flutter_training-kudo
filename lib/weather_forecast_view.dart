import 'package:flutter/material.dart';
import 'package:flutter_training/common_temperature_text.dart';
import 'package:flutter_training/common_text_button.dart';

class WeatherForecastView extends StatelessWidget {
  const WeatherForecastView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FractionallySizedBox(
          widthFactor: 0.5,
          child: Column(
            children: [
              const Spacer(),
              const AspectRatio(
                aspectRatio: 1,
                child: Placeholder(),
              ),
              const SizedBox(height: 16),
              const CommonTemperatureText(
                minTemperatureText: '** ℃',
                maxTemperatureText: '** ℃',
              ),
              const SizedBox(height: 16),
              Flexible(
                child: Column(
                  children: [
                    const SizedBox(height: 80),
                    CommonTextButton(
                      onClosePressed: () {},
                      onReloadPressed: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
