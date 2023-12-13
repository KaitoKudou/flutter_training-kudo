import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_training/model/weather_data.dart';
import 'package:flutter_training/model/weather_request.dart';
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
  WeatherData? _weatherData;

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
              WeatherImage(
                weatherCondition: _weatherData?.weatherCondition,
              ),
              const SizedBox(height: 16),
              CommonTemperatureText(
                minTemperature: _weatherData?.minTemperature,
                maxTemperature: _weatherData?.maxTemperature,
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
                        switch (_weatherService.fetchWeather(
                          WeatherRequest(area: 'tokyo', date: DateTime.now()),
                        )) {
                          case Success(value: final value):
                            setState(() {
                              _weatherData = value;
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
