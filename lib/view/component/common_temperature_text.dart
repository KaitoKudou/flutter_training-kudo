import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_training/notifier/weather_forecast_view_state.dart';

class CommonTemperatureText extends ConsumerWidget {
  const CommonTemperatureText({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    final minTemperature = ref.watch(
      weatherForecastViewStateProvider
          .select((weatherData) => weatherData?.minTemperature),
    );
    final maxTemperature = ref.watch(
      weatherForecastViewStateProvider
          .select((weatherData) => weatherData?.maxTemperature),
    );

    return Row(
      children: [
        Expanded(
          child: Text(
            minTemperature == null ? '**℃' : '$minTemperature℃',
            style: textTheme.labelLarge!.copyWith(
              color: Colors.blue,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        Expanded(
          child: Text(
            maxTemperature == null ? '**℃' : '$maxTemperature℃',
            style: textTheme.labelLarge!.copyWith(
              color: Colors.red,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
