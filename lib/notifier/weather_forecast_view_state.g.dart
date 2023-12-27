// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, duplicate_ignore

part of 'weather_forecast_view_state.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$weatherForecastViewStateHash() =>
    r'553d42d80e4ef218f88cfe621233cb643c86da20';

/// See also [WeatherForecastViewState].
@ProviderFor(WeatherForecastViewState)
final weatherForecastViewStateProvider = AutoDisposeNotifierProvider<
    WeatherForecastViewState, WeatherData?>.internal(
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

typedef _$WeatherForecastViewState = AutoDisposeNotifier<WeatherData?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
