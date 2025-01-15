import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_architecture_app/features/weather/data/weather_repository.dart';
import 'package:riverpod_architecture_app/features/weather/domain/forecast/forecast_data.dart';

import '../domain/weather/weather_data.dart';

part 'weather_service.g.dart';

class WeatherService {}

@riverpod
class city extends _$city {
  @override
  String build() {
    return 'Seoul';
  }
}

@riverpod
FutureOr<WeatherData> currentWeather(Ref ref) async {
  final city = ref.watch(cityProvider);
  final weather =
      await ref.watch(weatherRepositoryProvider).getWeather(city: city);
  return WeatherData.from(weather);
}

@riverpod
FutureOr<ForecastData> hourlyWeather(Ref ref) async {
  final city = ref.watch(cityProvider);
  final forecast =
      await ref.watch(weatherRepositoryProvider).getForecast(city: city);
  return ForecastData.from(forecast);
}