// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$currentWeatherHash() => r'f45ceb78c3471f0d74acbfe234281ee7ae1cca9f';

/// See also [currentWeather].
@ProviderFor(currentWeather)
final currentWeatherProvider = AutoDisposeFutureProvider<WeatherData>.internal(
  currentWeather,
  name: r'currentWeatherProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$currentWeatherHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef CurrentWeatherRef = AutoDisposeFutureProviderRef<WeatherData>;
String _$hourlyWeatherHash() => r'0b09a09e31a1e05734bdd294f3dbab4d35ef80e1';

/// See also [hourlyWeather].
@ProviderFor(hourlyWeather)
final hourlyWeatherProvider = AutoDisposeFutureProvider<ForecastData>.internal(
  hourlyWeather,
  name: r'hourlyWeatherProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$hourlyWeatherHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef HourlyWeatherRef = AutoDisposeFutureProviderRef<ForecastData>;
String _$cityHash() => r'89a5dae8c2142b9df60a8c06f57d60262e5a02fe';

/// See also [city].
@ProviderFor(city)
final cityProvider = AutoDisposeNotifierProvider<city, String>.internal(
  city.new,
  name: r'cityProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$cityHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$city = AutoDisposeNotifier<String>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
