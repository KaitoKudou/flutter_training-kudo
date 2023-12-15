import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_training/gen/assets.gen.dart';
import 'package:flutter_training/model/weather_condition.dart';

class WeatherImage extends StatelessWidget {
  const WeatherImage({
    required WeatherCondition? weatherCondition,
    super.key,
  }) : _weatherCondition = weatherCondition;

  final WeatherCondition? _weatherCondition;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: _weatherCondition == null
          ? const Placeholder()
          : _weatherCondition.svgImage,
    );
  }
}

extension WeatherSvgImage on WeatherCondition {
  SvgPicture get svgImage => switch (this) {
        WeatherCondition.sunny =>
          Assets.images.sunny.svg(semanticsLabel: 'sunny image'),
        WeatherCondition.cloudy =>
          Assets.images.cloudy.svg(semanticsLabel: 'cloudy image'),
        WeatherCondition.rainy =>
          Assets.images.rainy.svg(semanticsLabel: 'rainy image'),
      };
}
