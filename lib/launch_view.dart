import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_training/screen.dart';

class LaunchView extends StatefulWidget {
  const LaunchView({super.key});

  @override
  State<LaunchView> createState() => _LaunchViewState();
}

class _LaunchViewState extends State<LaunchView> {
  Future<void> transition() async {
    await SchedulerBinding.instance.endOfFrame;

    await Future<void>.delayed(const Duration(milliseconds: 500));

    if (!context.mounted) {
      return;
    }

    await Navigator.pushNamed(context, Screen.weatherForecast.route);

    unawaited(transition());
  }

  @override
  void initState() {
    super.initState();
    unawaited(transition());
  }

  @override
  Widget build(BuildContext context) {
    return const ColoredBox(color: Colors.green);
  }
}
