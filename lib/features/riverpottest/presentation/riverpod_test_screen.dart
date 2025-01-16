import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_architecture_app/common/provider/provider.dart';
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

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Riverpod Test'),
            Consumer(
              builder: (context, ref, child) {
                final count = ref.watch(counterProvider);
                return Text('count:$count');
              },
            ),
            Consumer(
              builder: (context, ref, child) {
                final time = ref.watch(timeProvider);
                final city = ref.watch(cityProvider);
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
                          logger.d('ref.read(cityProvider.notifier).change($resultCity)'
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
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'f0',
            onPressed: () {
              ref.read(counterProvider.notifier).increment();
            },
            child: Icon(
              Icons.add,
            ),
          ),
          SizedBox(
            width: 5,
          ),
          FloatingActionButton(
            heroTag: 'f1',
            onPressed: () {
              ref.read(counterProvider.notifier).decrement();
            },
            child: Icon(
              Icons.remove,
            ),
          ),
          SizedBox(
            width: 5,
          ),
          FloatingActionButton(
            heroTag: 'f2',
            onPressed: () {
              //return 값이 있다.
              final newState = ref.refresh(counterProvider);
              logger.d(
                  'RiverpodTestScreen ref.refresh(counterProvider) newState:$newState'.toMagenta);
            },
            child: Text('refresh'),
          ),
          SizedBox(
            width: 5,
          ),
          FloatingActionButton(
            heroTag: 'f2',
            onPressed: () {
              // provider를 수동으로 강제 삭제
              //1. provider가 청취되고 있으면 새 상태 생성
              //2. provider가 청휘되고 있지 않으면 provider 소멸
              logger.d('ref.invalidate(counterProvider)'.toMagenta);
              ref.invalidate(counterProvider);
            },
            child: Text('invalidate'),
          )
        ],
      ),
    );
  }
}
