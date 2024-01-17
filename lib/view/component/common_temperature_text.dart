import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_training/provider/weather_data_state_notifier.dart';

class CommonTemperatureText extends ConsumerWidget {
  const CommonTemperatureText({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    final weatherData = ref.watch(weatherDataStateNotifierProvider);

    return Row(
      children: [
        Expanded(
          child: Text(
            weatherData?.minTemperature == null
                ? '**℃'
                : '${weatherData!.minTemperature}℃',
            style: textTheme.labelLarge!.copyWith(
              color: Colors.blue,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        Expanded(
          child: Text(
            weatherData?.maxTemperature == null
                ? '**℃'
                : '${weatherData!.maxTemperature}℃',
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
