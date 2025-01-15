import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_architecture_app/features/authentication/data/auth_repository.dart';

part 'account_screen_controller.g.dart';

@riverpod
class AccountScreenController extends _$AccountScreenController {
  @override
  FutureOr<void> build() {}

  Future<void> signOut() async {
    final authRepository = ref.read(authRepositoryProvider);
    state = AsyncValue.loading();
    state = await AsyncValue.guard(authRepository.signOut);
  }
}
