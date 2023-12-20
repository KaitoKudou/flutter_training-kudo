// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, duplicate_ignore

part of 'weather_service_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$weatherServiceHash() => r'478732f81e7a6bbac515adc1c62bd075bcb15a0f';

/// See also [weatherService].
@ProviderFor(weatherService)
final weatherServiceProvider = Provider<WeatherService>.internal(
  weatherService,
  name: r'weatherServiceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$weatherServiceHash,
  dependencies: <ProviderOrFamily>[yumemiWeatherProvider],
  allTransitiveDependencies: <ProviderOrFamily>{
    yumemiWeatherProvider,
    ...?yumemiWeatherProvider.allTransitiveDependencies
  },
);

typedef WeatherServiceRef = ProviderRef<WeatherService>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
