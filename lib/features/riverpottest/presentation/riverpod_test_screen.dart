import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_architecture_app/common/provider/provider.dart';
import 'package:riverpod_architecture_app/utils/async_value_extension.dart';
import 'package:riverpod_architecture_app/utils/string_color_extension.dart';

import '../../../main.dart';

class RiverpodTestScreen extends ConsumerStatefulWidget {
  const RiverpodTestScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _RiverpodTestScreenState();
}

class _RiverpodTestScreenState extends ConsumerState<RiverpodTestScreen> {
  @override
  void initState() {
    logger.d('######################################');
    logger.d('RiverpodTestScreen initState');
    super.initState();
  }

  @override
  void dispose() {
    logger.d('RiverpodTestScreen dispose');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    logger.d('RiverpodTestScreen build');
    //counterProvider의 addListener는 호출 되지만 처음 빌드시에 아래 본문이 호울 되지 않는다.
    ref.listen<int>(counterProvider, (previous, next) {
      logger
          .d('RiverpodTestScreen ref.listen<int>(counterProvider) next:$next');
      if (next % 3 == 0) {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text('count:$next'),
            );
          },
        );
      }
    });

    logger.d('-------------------------------------');
    logger.d(
        'RiverpodTestScreen ref.watch(riverpodTestScreenControllerProvider)'
            .toMagenta);
    final asyncRiverpodTestScreenController =
        ref.watch(riverpodTestScreenControllerProvider);
    logger.d('>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>');
    logger.d(
        'asyncRiverpodTestScreenController:${asyncRiverpodTestScreenController.toStr}'
            .toYellow);
    logger.d(
        'asyncRiverpodTestScreenController.isLoading:${asyncRiverpodTestScreenController.isLoading}');
    logger.d(
        'asyncRiverpodTestScreenController.isRefreshing:${asyncRiverpodTestScreenController.isRefreshing}');
    logger.d(
        'asyncRiverpodTestScreenController.isReloading:${asyncRiverpodTestScreenController.isReloading}');
    logger.d(
        'asyncRiverpodTestScreenController.hasValue:${asyncRiverpodTestScreenController.hasValue}');
    logger.d(
        'asyncRiverpodTestScreenController.hasError:${asyncRiverpodTestScreenController.hasError}');
    logger.d('>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>');

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Riverpod Test',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              width: 5,
            ),
            ElevatedButton(
                onPressed: () {
                  ref
                      .read(riverpodTestScreenControllerProvider.notifier)
                      .getTodos();
                },
                child: Text('Get Todos')),
            SizedBox(
              width: 15,
            ),
            Consumer(
              builder: (context, ref, child) {
                final count = ref.watch(counterProvider);
                logger.d(
                    'RiverpodTestScreen Consumer ref.watch(counterProvider)'
                        .toMagenta);
                return Text('count:$count');
              },
            ),
            SizedBox(
              width: 5,
            ),
            Consumer(
              builder: (context, ref, child) {
                logger.d(
                    'RiverpodTestScreen Consumer ref.watch(asyncCounterProvider)'
                        .toMagenta);
                final asyncCounter = ref.watch(asyncCounterProvider);
                logger.d('>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>');
                logger.d('asyncCounter:${asyncCounter.toStr}'.toYellow);
                logger.d('asyncCounter.isLoading:${asyncCounter.isLoading}');
                logger.d(
                    'asyncCounter.isRefreshing:${asyncCounter.isRefreshing}');
                logger
                    .d('asyncCounter.isReloading:${asyncCounter.isReloading}');
                logger.d('asyncCounter.hasValue:${asyncCounter.hasValue}');
                logger.d('asyncCounter.hasError:${asyncCounter.hasError}');
                logger.d('>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>');
                return asyncCounter.when(
                  data: (data) => Text('async count:$data'),
                  error: (error, stackTrace) => Text(error.toString()),
                  loading: () => CircularProgressIndicator(),
                );
              },
            ),
            SizedBox(
              width: 15,
            ),
            Consumer(
              builder: (context, ref, child) {
                final time = ref.watch(timeProvider);
                logger.d('RiverpodTestScreen Consumer ref.watch(timeProvider)'
                    .toMagenta);
                final city = ref.watch(cityProvider);
                logger.d('RiverpodTestScreen Consumer ref.watch(cityProvider)'
                    .toMagenta);
                return Column(
                  children: [
                    Text('Time:$time'),
                    ElevatedButton(
                        onPressed: () {
                          String resultCity = '';
                          if (city == 'seoul') {
                            resultCity = 'LA';
                          } else {
                            resultCity = 'seoul';
                          }
                          logger.d('------------------------');
                          logger.d(
                              'ref.read(cityProvider.notifier).change($resultCity)'
                                  .toMagenta);
                          ref.read(cityProvider.notifier).change(resultCity);
                        },
                        child: Text('Change City'))
                  ],
                );
              },
            )
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          // counter
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: FloatingActionButton(
                  heroTag: 'f0',
                  onPressed: () {
                    ref.read(counterProvider.notifier).increment();
                  },
                  child: Icon(
                    Icons.add,
                  ),
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: FloatingActionButton(
                  heroTag: 'f1',
                  onPressed: () {
                    ref.read(counterProvider.notifier).decrement();
                  },
                  child: Icon(
                    Icons.remove,
                  ),
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: FloatingActionButton(
                  heroTag: 'f2',
                  onPressed: () {
                    //return 값이 있다.
                    final newState = ref.refresh(counterProvider);
                    logger.d(
                        'RiverpodTestScreen ref.refresh(counterProvider) newState:$newState'
                            .toMagenta);
                  },
                  child: Text('counterProvider refresh'),
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: FloatingActionButton(
                  heroTag: 'f3',
                  onPressed: () {
                    // provider를 수동으로 강제 삭제
                    //1. provider가 청취되고 있으면 새 상태 생성
                    //2. provider가 청휘되고 있지 않으면 provider 소멸
                    logger.d('ref.invalidate(counterProvider)'.toMagenta);
                    ref.invalidate(counterProvider);
                  },
                  child: Text('counterProvider invalidate'),
                ),
              )
            ],
          ),
          //async counter
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: FloatingActionButton(
                  heroTag: 'f00',
                  onPressed: () {
                    ref.read(asyncCounterProvider.notifier).increment();
                  },
                  child: Icon(
                    Icons.add,
                  ),
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: FloatingActionButton(
                  heroTag: 'f11',
                  onPressed: () {
                    ref.read(asyncCounterProvider.notifier).decrement();
                  },
                  child: Icon(
                    Icons.remove,
                  ),
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: FloatingActionButton(
                  heroTag: 'f22',
                  onPressed: () {
                    //return 값이 있다.
                    final newState = ref.refresh(asyncCounterProvider);
                    logger.d(
                        'RiverpodTestScreen ref.refresh(asyncCounterProvider) newState:$newState'
                            .toMagenta);
                  },
                  child: Text('asyncCounterProvider refresh'),
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: FloatingActionButton(
                  heroTag: 'f33',
                  onPressed: () {
                    // provider를 수동으로 강제 삭제
                    //1. provider가 청취되고 있으면 새 상태 생성
                    //2. provider가 청휘되고 있지 않으면 provider 소멸
                    logger.d('ref.invalidate(asyncCounterProvider)'.toMagenta);
                    ref.invalidate(asyncCounterProvider);
                  },
                  child: Text('asyncCounterProvider invalidate'),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
