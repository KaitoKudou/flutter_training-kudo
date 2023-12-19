import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_training/gen/assets.gen.dart';
import 'package:flutter_training/model/weather_condition.dart';
import 'package:flutter_training/notifier/weather_forecast_view_state.dart';

class WeatherImage extends ConsumerWidget {
  const WeatherImage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weatherCondition = ref.watch(
      weatherForecastViewStateProvider
          .select((weatherData) => weatherData?.weatherCondition),
    );

    return AspectRatio(
      aspectRatio: 1,
      child: weatherCondition == null
          ? const Placeholder()
          : weatherCondition.svgImage,
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
