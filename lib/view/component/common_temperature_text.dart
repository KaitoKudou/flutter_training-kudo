import 'package:flutter/material.dart';

class CommonTemperatureText extends StatelessWidget {
  const CommonTemperatureText({
    required int? minTemperature,
    required int? maxTemperature,
    super.key,
  })  : _minTemperature = minTemperature,
        _maxTemperature = maxTemperature;

  final int? _minTemperature;
  final int? _maxTemperature;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Row(
      children: [
        Expanded(
          child: Text(
            _minTemperature == null ? '**℃' : '$_minTemperature℃',
            style: textTheme.labelLarge!.copyWith(
              color: Colors.blue,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        Expanded(
          child: Text(
            _maxTemperature == null ? '**℃' : '$_maxTemperature℃',
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
