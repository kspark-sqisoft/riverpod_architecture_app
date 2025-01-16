import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_architecture_app/features/post/presentation/post_edit_screen.dart';
import 'package:riverpod_architecture_app/router/app_router.dart';
import 'package:riverpod_architecture_app/utils/async_value_extension.dart';
import 'package:riverpod_architecture_app/utils/string_color_extension.dart';

import '../../../main.dart';
import '../data/post_repository.dart';

class PostScreen extends ConsumerStatefulWidget {
  const PostScreen({super.key, required this.postId});
  final int postId;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PostScreenState();
}

class _PostScreenState extends ConsumerState<PostScreen> {
  @override
  Widget build(BuildContext context) {
    final postId = widget.postId;
    logger.d('-------------------------------------');
    logger.d('PostScreen ref.watch(fetchPostProvider($postId))');
    final postAsync = ref.watch(fetchPostProvider(postId));
    logger.d('>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>');
    logger.d('postAsync:${postAsync.toStr}'.toYellow);
    logger.d('postAsync.isLoading:${postAsync.isLoading}');
    logger.d('postAsync.isRefreshing:${postAsync.isRefreshing}');
    logger.d('postAsync.isReloading:${postAsync.isReloading}');
    logger.d('postAsync.hasValue:${postAsync.hasValue}');
    logger.d('postAsync.hasError:${postAsync.hasError}');
    logger.d('>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>');
    return Scaffold(
      appBar: AppBar(title: Text('Post $postId')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: postAsync.when(
          data: (post) => Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(post.title, style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 32),
              Text(post.body),
              const Spacer(),
              ElevatedButton(
                child: const Text('Edit'),
                onPressed: () {
                  context.goNamed(AppRoute.postedit.name,
                      pathParameters: {'postId': '$postId'});
                },
              ),
            ],
          ),
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (e, st) => Center(child: Text(e.toString())),
        ),
      ),
    );
  }
}
