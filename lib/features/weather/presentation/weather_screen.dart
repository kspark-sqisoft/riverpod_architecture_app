import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_architecture_app/utils/string_color_extension.dart';

import '../../../common/provider/provider.dart';
import '../../../constants/app_colors.dart';
import '../../../main.dart';
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
    logger.d('WeatherScreen ref.watch(helloProvider)'.toMagenta);
    final hello = ref.watch(helloProvider);
    logger.d('WeatherScreen ref.watch(hiProvider)'.toMagenta);
    final hi = ref.watch(hiProvider);
    logger.d('WeatherScreen ref.watch(nationProvider)'.toMagenta);
    final nation = ref.watch(nationProvider);
    logger.d('WeatherScreen ref.watch(nameProvider)'.toMagenta);
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
              Divider(),
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
                    child: Text('nationProvider - keepAlive '),
                  ),
                ],
              ),
              Divider(),
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
                    child: Text('nameProvider - autoDispose'),
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
