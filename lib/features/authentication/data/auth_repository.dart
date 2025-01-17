import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_architecture_app/features/authentication/domain/user.dart';
import 'package:riverpod_architecture_app/utils/in_memory_store.dart';

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
