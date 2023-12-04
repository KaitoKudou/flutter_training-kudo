import 'package:flutter/material.dart';

class CommonTemperatureText extends StatelessWidget {
  const CommonTemperatureText({
    required String minTemperatureText,
    required String maxTemperatureText,
    super.key,
  })  : _minTemperatureText = minTemperatureText,
        _maxTemperatureText = maxTemperatureText;

  final String _minTemperatureText;
  final String _maxTemperatureText;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Row(
      children: [
        Expanded(
          child: Text(
            _minTemperatureText,
            style: textTheme.labelLarge!.copyWith(
              color: Colors.blue,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        Expanded(
          child: Text(
            _maxTemperatureText,
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
