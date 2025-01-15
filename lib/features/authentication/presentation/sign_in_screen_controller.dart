import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_architecture_app/features/authentication/data/auth_repository.dart';

part 'sign_in_screen_controller.g.dart';

//프리젠테이션 계층
//비니니스 로직 유지
//위젯 상태 관리
//데이터 계층의 저장소와 상호 작용
@riverpod
class SignInScreenController extends _$SignInScreenController {
  @override
  FutureOr<void> build() {}

  Future<void> signInAnonymously() async {
    final authRepository = ref.read(authRepositoryProvider);
    state = AsyncLoading();
    //state = await AsyncValue.guard(authRepository.signInAnonymously);

    //state = await AsyncValue.guard(() => authRepository.signInAnonymously());

    //state = await AsyncValue.guard(
    //    () async => await authRepository.signInAnonymously());

    state = await AsyncValue.guard(() async {
      authRepository.signInAnonymously();
    });
  }
}
