import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_training/model/weather_condition.dart';
import 'package:flutter_training/service/weather_service.dart';
import 'package:flutter_training/view/component/common_temperature_text.dart';
import 'package:flutter_training/view/component/common_text_button.dart';
import 'package:flutter_training/view/weather_image.dart';
import 'package:yumemi_weather/yumemi_weather.dart';

final _client = YumemiWeather();
final _weatherService = WeatherService(_client);

class WeatherForecastView extends StatefulWidget {
  const WeatherForecastView({
    super.key,
  });

  @override
  State<WeatherForecastView> createState() => _WeatherForecastViewState();
}

class _WeatherForecastViewState extends State<WeatherForecastView> {
  WeatherCondition? _weatherCondition;

  Future<void> _showErrorDialog(String exceptionMessage) {
    return showDialog<void>(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Text(exceptionMessage),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FractionallySizedBox(
          widthFactor: 0.5,
          child: Column(
            children: [
              const Spacer(),
              WeatherImage(weatherCondition: _weatherCondition),
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
                      onClosePressed: () {
                        Navigator.pop(context);
                      },
                      onReloadPressed: () {
                        switch (_weatherService.fetchWeather()) {
                          case Success(value: final value):
                            setState(() {
                              _weatherCondition = value;
                            });
                          case Failure(
                              exceptionMessage: final exceptionMessage
                            ):
                            unawaited(
                              _showErrorDialog(exceptionMessage),
                            );
                        }
                      },
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
