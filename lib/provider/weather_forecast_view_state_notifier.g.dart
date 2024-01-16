// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, duplicate_ignore

part of 'weather_forecast_view_state_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$weatherForecastViewStateNotifierHash() =>
    r'a7230a5ab15b8fbd4121239e32316e9fdaf155d2';

/// See also [WeatherForecastViewStateNotifier].
@ProviderFor(WeatherForecastViewStateNotifier)
final weatherForecastViewStateNotifierProvider = AutoDisposeNotifierProvider<
    WeatherForecastViewStateNotifier, WeatherForecastViewState>.internal(
  WeatherForecastViewStateNotifier.new,
  name: r'weatherForecastViewStateNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$weatherForecastViewStateNotifierHash,
  dependencies: <ProviderOrFamily>[weatherServiceProvider],
  allTransitiveDependencies: <ProviderOrFamily>{
    weatherServiceProvider,
    ...?weatherServiceProvider.allTransitiveDependencies
  },
);

typedef _$WeatherForecastViewStateNotifier
    = AutoDisposeNotifier<WeatherForecastViewState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
