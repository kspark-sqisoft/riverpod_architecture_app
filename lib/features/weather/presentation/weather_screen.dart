import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../constants/app_colors.dart';
import '../../../main.dart';
import '../../authentication/data/auth_repository.dart';
import 'city_search_box.dart';
import 'current_weather.dart';
import 'hourly_weather.dart';

class WeatherScreen extends ConsumerStatefulWidget {
  const WeatherScreen({super.key});

  @override
  ConsumerState<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends ConsumerState<WeatherScreen> {
  @override
  void initState() {
    logger.d('######################################');
    logger.d('WeatherScreen initState');
    super.initState();
  }

  @override
  void dispose() {
    logger.d('WeatherScreen dispose');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    logger.d('-------------------------------------');
    logger.d('WeatherScreen ref.watch(helloProvider)');
    final hello = ref.watch(helloProvider);
    logger.d('WeatherScreen ref.watch(hiProvider)');
    final hi = ref.watch(hiProvider);
    logger.d('WeatherScreen ref.watch(nationProvider)');
    final nation = ref.watch(nationProvider);
    logger.d('WeatherScreen ref.watch(nameProvider)');
    final name = ref.watch(nameProvider);
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: AppColors.rainGradient,
          ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(hello),
              Text(hi),
              Column(
                children: [
                  Text(nation),
                  ElevatedButton(
                    onPressed: () {
                      logger.d(
                          'WeatherScreen ref.read(nationProvider.notifier).change(nationName)');
                      if (nation == 'korea') {
                        ref.read(nationProvider.notifier).change('japan');
                      } else {
                        ref.read(nationProvider.notifier).change('korea');
                      }
                    },
                    child: Text('change nation '),
                  ),
                ],
              ),
              Column(
                children: [
                  Text(name),
                  ElevatedButton(
                    onPressed: () {
                      logger.d(
                          'WeatherScreen ref.read(nameProvider.notifier).change(name)');
                      if (name == 'keesoon') {
                        ref.read(nameProvider.notifier).change('younga');
                      } else {
                        ref.read(nameProvider.notifier).change('keesoon');
                      }
                    },
                    child: Text('change name'),
                  ),
                ],
              ),
              Spacer(),
              CitySearchBox(),
              Spacer(),
              CurrentWeather(),
              Spacer(),
              HourlyWeather(),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
