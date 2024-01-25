import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_training/gen/assets.gen.dart';
import 'package:flutter_training/model/weather_condition.dart';
import 'package:flutter_training/provider/weather_data_state_notifier.dart';

class WeatherImage extends ConsumerWidget {
  const WeatherImage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weatherData = ref.watch(weatherDataStateNotifierProvider);

    return AspectRatio(
      aspectRatio: 1,
      child: weatherData == null
          ? const Placeholder()
          : weatherData.weatherCondition.svgImage,
    );
  }
}

extension WeatherSvgImage on WeatherCondition {
  SvgPicture get svgImage => switch (this) {
        WeatherCondition.sunny =>
          Assets.images.sunny.svg(semanticsLabel: WeatherCondition.sunny.name),
        WeatherCondition.cloudy => Assets.images.cloudy
            .svg(semanticsLabel: WeatherCondition.cloudy.name),
        WeatherCondition.rainy =>
          Assets.images.rainy.svg(semanticsLabel: WeatherCondition.rainy.name),
      };
}
