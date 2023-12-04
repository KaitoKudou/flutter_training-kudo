import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WeatherImage extends StatelessWidget {
  const WeatherImage({
    required String? path,
    super.key,
  }) : _path = path;

  final String? _path;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: _path == null ? const Placeholder() : SvgPicture.asset(_path),
    );
  }
}
