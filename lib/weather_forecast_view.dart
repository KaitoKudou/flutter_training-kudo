import 'package:flutter/material.dart';
import 'package:flutter_training/common_temperature_text.dart';
import 'package:flutter_training/common_text_button.dart';
import 'package:flutter_training/model/weather_condition.dart';
import 'package:flutter_training/service/weather_service.dart';
import 'package:flutter_training/weather_image.dart';
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
                      onClosePressed: () {},
                      onReloadPressed: () {
                        setState(() {
                          _weatherCondition = _weatherService.fetchWeather();
                        });
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
