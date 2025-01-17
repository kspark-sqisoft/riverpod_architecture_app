import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_architecture_app/features/todo/data/todo_repository.dart';
import 'package:riverpod_architecture_app/utils/string_color_extension.dart';

import '../../main.dart';

part 'provider.g.dart';

@Riverpod(keepAlive: true)
String hello(Ref ref) {
  ref.onDispose(() {
    logger.d('helloProvider onDispose'.toRed);
  });
  ref.onCancel(() {
    logger.d('helloProvider onCancel');
  });
  ref.onResume(() {
    logger.d('helloProvider onResume');
  });
  ref.onAddListener(() {
    logger.d('helloProvider onAddListener');
  });
  ref.onRemoveListener(() {
    logger.d('helloProvider onRemoveListener');
  });
  logger.d('helloProvider initialized(build)'.toGreen);
  return 'hello keesoon not autoDispose keepAlive';
}

@riverpod
String hi(Ref ref) {
  ref.onDispose(() {
    logger.d('hiProvider onDispose'.toRed);
  });
  ref.onCancel(() {
    logger.d('hiProvider onCancel');
  });
  ref.onResume(() {
    logger.d('hiProvider onResume');
  });
  ref.onAddListener(() {
    logger.d('hiProvider onAddListener');
  });
  ref.onRemoveListener(() {
    logger.d('hiProvider onRemoveListener');
  });
  logger.d('hiProvider initialized(build)'.toGreen);
  return 'hi keesoon autoDispose';
}

@Riverpod(keepAlive: true)
class Nation extends _$Nation {
  @override
  String build() {
    ref.onDispose(() {
      logger.d('nationProvider onDispose'.toRed);
    });
    ref.onCancel(() {
      logger.d('nationProvider onCancel');
    });
    ref.onResume(() {
      logger.d('nationProvider onResume');
    });
    ref.onAddListener(() {
      logger.d('nationProvider onAddListener');
    });
    ref.onRemoveListener(() {
      logger.d('nationProvider onRemoveListener');
    });
    logger.d('nationProvider initialized(build)'.toGreen);
    return 'korea';
  }

  void change(nationName) {
    state = nationName;
  }
}

@riverpod
class Name extends _$Name {
  @override
  String build() {
    ref.onDispose(() {
      logger.d('nameProvider onDispose'.toRed);
    });
    ref.onCancel(() {
      logger.d('nameProvider onCancel');
    });
    ref.onResume(() {
      logger.d('nameProvider onResume');
    });
    ref.onAddListener(() {
      logger.d('nameProvider onAddListener');
    });
    ref.onRemoveListener(() {
      logger.d('nameProvider onRemoveListener');
    });
    logger.d('nameProvider initialized(build)'.toGreen);
    return 'keesoon';
  }

  void change(String name) {
    state = name;
  }
}

@riverpod
class Counter extends _$Counter {
  @override
  int build() {
    ref.onDispose(() {
      logger.d('counterProvider onDispose'.toRed);
    });
    ref.onCancel(() {
      logger.d('counterProvider onCancel');
    });
    ref.onResume(() {
      logger.d('counterProvider onResume');
    });
    ref.onAddListener(() {
      logger.d('counterProvider onAddListener');
    });
    ref.onRemoveListener(() {
      logger.d('counterProvider onRemoveListener');
    });
    logger.d('counterProvider initialized(build)'.toGreen);
    return 0;
  }

  void increment() {
    logger.d('counterProvider increment');
    state++;
  }

  void decrement() {
    logger.d('counterProvider decrement');
    state--;
  }
}

@riverpod
class AsyncCounter extends _$AsyncCounter {
  @override
  FutureOr<int> build() async {
    ref.onDispose(() {
      logger.d('asyncCounterProvider onDispose'.toRed);
    });
    ref.onCancel(() {
      logger.d('asyncCounterProvider onCancel');
    });
    ref.onResume(() {
      logger.d('asyncCounterProvider onResume');
    });
    ref.onAddListener(() {
      logger.d('asyncCounterProvider onAddListener');
    });
    ref.onRemoveListener(() {
      logger.d('asyncCounterProvider onRemoveListener');
    });
    logger.d('asyncCounterProvider initialized(build)'.toGreen);
    await Future.delayed(Duration(seconds: 1));
    return 0;
  }

  Future<void> increment() async {
    logger.d('asyncCounterProvider increment');
    state = AsyncLoading<int>();
    try {
      final int? currentValue = state.value;
      if (currentValue == null) {
        throw Exception('value가 null 일수 없다.');
      }
      await Future.delayed(Duration(seconds: 1));
      state = AsyncValue<int>.data(currentValue + 1);
    } catch (error, stackTrace) {
      state = AsyncValue<int>.error(error, stackTrace);
    }
  }

  Future<void> decrement() async {
    logger.d('asyncCounterProvider decrement');
    state = AsyncLoading();
    state = await AsyncValue.guard(() async {
      final currentValue = state.value;
      if (currentValue == null) {
        throw Exception('value가 null 일수 없다.');
      }
      await Future.delayed(Duration(seconds: 1));
      return currentValue - 1;
    });
  }
}

@riverpod
class Time extends _$Time {
  @override
  String build() {
    ref.onDispose(() {
      logger.d('timeProvider onDispose'.toRed);
    });
    ref.onCancel(() {
      logger.d('timeProvider onCancel');
    });
    ref.onResume(() {
      logger.d('timeProvider onResume');
    });
    ref.onAddListener(() {
      logger.d('timeProvider onAddListener');
    });
    ref.onRemoveListener(() {
      logger.d('timeProvider onRemoveListener');
    });
    logger.d('timeProvider initialized(build)'.toGreen);
    //프로바이더 안에서 다른 프로바이더를 watch 하면 다른 프로바이더의 상태가 변하면 이 프로바이더가 dispose 되고 build(initialized) 된다.
    final city = ref.watch(cityProvider);
    if (city == 'seoul') {
      return '$city 07:00';
    } else {
      return '$city 12:00';
    }
  }
}

@riverpod
class City extends _$City {
  @override
  String build() {
    ref.onDispose(() {
      logger.d('cityProvider onDispose'.toRed);
    });
    ref.onCancel(() {
      logger.d('cityProvider onCancel');
    });
    ref.onResume(() {
      logger.d('cityProvider onResume');
    });
    ref.onAddListener(() {
      logger.d('cityProvider onAddListener');
    });
    ref.onRemoveListener(() {
      logger.d('cityProvider onRemoveListener');
    });
    logger.d('cityProvider initialized(build)'.toGreen);
    return 'seoul';
  }

  void change(String city) {
    logger.d('cityProvider change($city)'.toMagenta);
    state = city;
  }
}

@riverpod
class RiverpodTestScreenController extends _$RiverpodTestScreenController {
  @override
  FutureOr<void> build() {
    ref.onDispose(() {
      logger.d('riverpodTestScreenControllerProvider onDispose'.toRed);
    });
    ref.onCancel(() {
      logger.d('riverpodTestScreenControllerProvider onCancel');
    });
    ref.onResume(() {
      logger.d('riverpodTestScreenControllerProvider onResume');
    });
    ref.onAddListener(() {
      logger.d('riverpodTestScreenControllerProvider onAddListener');
    });
    ref.onRemoveListener(() {
      logger.d('riverpodTestScreenControllerProvider onRemoveListener');
    });
    logger.d('riverpodTestScreenControllerProvider initialized(build)'.toGreen);
  }

  Future<void> getTodos() async {
    state = AsyncLoading();
    final todoRepository = ref.read(todoRepositoryProvider);
    //state = await AsyncValue.guard(() => todoRepository.getTodos());
    //아래 같은 표현
    state = await AsyncValue.guard(todoRepository.getTodos);
  }
}
