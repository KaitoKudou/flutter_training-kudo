import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_training/model/weather_request.dart';
import 'package:flutter_training/provider/weather_forecast_view_state_notifier.dart';
import 'package:flutter_training/view/component/common_temperature_text.dart';
import 'package:flutter_training/view/component/common_text_button.dart';
import 'package:flutter_training/view/component/weather_image.dart';

class WeatherForecastView extends ConsumerWidget {
  const WeatherForecastView({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Future<void> showErrorDialog(String exceptionMessage) async {
      return showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            content: Text(exceptionMessage),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }

    Future<void> showLoadingDialog() async {
      return showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      );
    }

    ref.listen(weatherForecastViewStateNotifierProvider, (previous, next) {
      unawaited(
        next.maybeWhen(
          loading: showLoadingDialog,
          failure: (exceptionMessage) {
            Navigator.pop(context);
            showErrorDialog(exceptionMessage);
            return null;
          },
          orElse: () {
            Navigator.pop(context);
            return null;
          },
        ),
      );
    });

    return Scaffold(
      body: Center(
        child: FractionallySizedBox(
          widthFactor: 0.5,
          child: Column(
            children: [
              const Spacer(),
              const WeatherImage(),
              const SizedBox(height: 16),
              const CommonTemperatureText(),
              const SizedBox(height: 16),
              Flexible(
                child: Column(
                  children: [
                    const SizedBox(height: 80),
                    CommonTextButton(
                      onClosePressed: () {
                        Navigator.pop(context);
                      },
                      onReloadPressed: () {
                        unawaited(
                          ref
                              .read(
                                weatherForecastViewStateNotifierProvider
                                    .notifier,
                              )
                              .fetchWeather(
                                WeatherRequest(
                                  area: 'tokyo',
                                  date: DateTime.now(),
                                ),
                              ),
                        );
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
