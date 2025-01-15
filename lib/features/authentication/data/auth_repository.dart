import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_architecture_app/features/authentication/domain/user.dart';
import 'package:riverpod_architecture_app/utils/in_memory_store.dart';

import '../../../main.dart';
part 'auth_repository.g.dart';

//데이터 계층
//데이터 파싱 및 직렬화
class AuthRepository {
  final _authState = InMemoryStore<User?>(null);

  Stream<User?> userStream() => _authState.stream;
  User? get currentUser => _authState.value;

  Future<void> signInAnonymously() async {
    await Future.delayed(const Duration(seconds: 3));
    _authState.value = User(
      uid: '123', // TODO: make it unique
    );
  }

  Future<void> signOut() async {
    _authState.value = null;
  }

  void dispose() => _authState.close();
}

@riverpod
AuthRepository authRepository(Ref ref) {
  final authRepository = AuthRepository();
  ref.onDispose(
    () => authRepository.dispose(),
  );
  return authRepository;
}

@riverpod
Stream<User?> userStream(Ref ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return authRepository.userStream();
}

@Riverpod(keepAlive: true)
String hello(Ref ref) {
  ref.onDispose(() {
    logger.d('helloProvider onDispose');
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
  logger.d('helloProvider initialized');
  return 'hello keesoon not autoDispose keepAlive';
}

@riverpod
String hi(Ref ref) {
  ref.onDispose(() {
    logger.d('hiProvider onDispose');
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
  logger.d('hiProvider initialized');
  return 'hi keesoon autoDispose';
}

@Riverpod(keepAlive: true)
class Nation extends _$Nation {
  @override
  String build() {
    ref.onDispose(() {
      logger.d('nationProvider onDispose');
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
    logger.d('nationProvider initialized');
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
      logger.d('nameProvider onDispose');
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
    logger.d('nameProvider initialized');
    return 'keesoon';
  }

  void change(String name) {
    state = name;
  }
}
