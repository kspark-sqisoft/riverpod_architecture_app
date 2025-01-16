import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_architecture_app/utils/string_color_extension.dart';
import 'package:uuid/uuid.dart';

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
  logger.d('helloProvider initialized'.toGreen);
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
  logger.d('hiProvider initialized'.toGreen);
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
    logger.d('nationProvider initialized'.toGreen);
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
    logger.d('nameProvider initialized'.toGreen);
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
    logger.d('counterProvider initialized'.toGreen);
    return 0;
  }

  void increment() {
    state++;
  }

  void decrement() {
    state--;
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
    logger.d('timeProvider initialized'.toGreen);
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
    logger.d('cityProvider initialized'.toGreen);
    return 'seoul';
  }

  void change(String city) {
    state = city;
  }
}
