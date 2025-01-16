import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_architecture_app/utils/string_color_extension.dart';

import '../../../main.dart';
import '../data/post_repository.dart';
import '../domain/post.dart';

part 'post_edit_controller.g.dart';

@riverpod
class PostEditController extends _$PostEditController {
  bool mounted = true;
  @override
  FutureOr<void> build() {
    ref.onDispose(() => mounted = false);
  }

  Future<void> updatePost({
    required Post previousPost,
    required String title,
    required String body,
    required void Function() onSuccess,
  }) async {
    // * if nothing has changed, return early
    if (previousPost.title == title && previousPost.body == body) {
      onSuccess();
      return;
    }
    state = const AsyncLoading();
    final updated = previousPost.copyWith(title: title, body: body);
    final postsRepository = ref.read(postRepositoryProvider);
    final newState =
        await AsyncValue.guard(() => postsRepository.updatePost(updated));
    // on success, invalidate the FutureProvider that fetches the post data
    if (newState is AsyncData) {
      logger.d('ref.invalidate(fetchPostProvider(${updated.id}))'.toMagenta);
      ref.invalidate(fetchPostProvider(updated.id));
    }
    if (mounted) {
      // * only set the state if the controller hasn't been disposed
      state = newState;
      if (state.hasError == false) {
        onSuccess();
      }
    }
  }
}
