// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, duplicate_ignore

part of 'weather_forecast_view_state.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$weatherForecastViewStateHash() =>
    r'c3f23bb1fc4c47f8db34b95484dfed55d3e3c54e';

/// See also [WeatherForecastViewState].
@ProviderFor(WeatherForecastViewState)
final weatherForecastViewStateProvider =
    NotifierProvider<WeatherForecastViewState, WeatherData?>.internal(
  WeatherForecastViewState.new,
  name: r'weatherForecastViewStateProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$weatherForecastViewStateHash,
  dependencies: <ProviderOrFamily>[weatherServiceProvider],
  allTransitiveDependencies: <ProviderOrFamily>{
    weatherServiceProvider,
    ...?weatherServiceProvider.allTransitiveDependencies
  },
);

typedef _$WeatherForecastViewState = Notifier<WeatherData?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
