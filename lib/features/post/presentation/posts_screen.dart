import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_architecture_app/common/provider/provider.dart';
import 'package:riverpod_architecture_app/features/post/presentation/post_screen.dart';
import 'package:riverpod_architecture_app/router/app_router.dart';
import 'package:riverpod_architecture_app/utils/async_value_extension.dart';
import 'package:riverpod_architecture_app/utils/string_color_extension.dart';

import '../../../main.dart';
import '../data/post_repository.dart';

class PostsScreen extends ConsumerStatefulWidget {
  const PostsScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PostsScreenState();
}

class _PostsScreenState extends ConsumerState<PostsScreen> {
  @override
  void initState() {
    logger.d('######################################');
    logger.d('PostsScreen initState');
    super.initState();
  }

  @override
  void dispose() {
    logger.d('PostsScreen dispose');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PostList(),
    );
  }
}

class PostList extends ConsumerStatefulWidget {
  const PostList({super.key});

  @override
  ConsumerState<PostList> createState() => _PostListState();
}

class _PostListState extends ConsumerState<PostList> {
  @override
  Widget build(BuildContext context) {
    logger.d('-------------------------------------');
    logger.d('PostsScreen PostList ref.watch(fetchPostsProvider)');
    final postsAsync = ref.watch(fetchPostsProvider);
    logger.d('>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>');
    logger.d('postsAsync:${postsAsync.toStr}'.toYellow);
    logger.d('postsAsync.isLoading:${postsAsync.isLoading}');
    logger.d('postsAsync.isRefreshing:${postsAsync.isRefreshing}');
    logger.d('postsAsync.isReloading:${postsAsync.isReloading}');
    logger.d('postsAsync.hasValue:${postsAsync.hasValue}');
    logger.d('postsAsync.hasError:${postsAsync.hasError}');
    logger.d('>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>');
    return Scaffold(
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'f0',
            onPressed: () async {
              logger.d('ref.refresh(fetchPostsProvider) ------------------');
              final newState = await ref.refresh(fetchPostsProvider.future);
            },
            child: Text('refresh'),
          ),
          SizedBox(
            width: 5,
          ),
          FloatingActionButton(
            heroTag: 'f1',
            onPressed: () {
              logger.d('ref.invalidate(fetchPostsProvider) ------------------');
              ref.invalidate(fetchPostsProvider);
            },
            child: Text('invalidate'),
          ),
          SizedBox(
            width: 5,
          ),
          FloatingActionButton(
            heroTag: 'f2',
            onPressed: () {
              //다른 화면의 프로바이더 refresh
              final newState = ref.refresh(counterProvider);
              logger.d(
                  'PostsScreen ref.refresh(counterProvider) newState:$newState');
            },
            child: Text('counter refresh'),
          ),
          SizedBox(
            width: 5,
          ),
          FloatingActionButton(
            heroTag: 'f3',
            onPressed: () {
              //다른 화면의 프로바이더 invalidate
              //아무것도 일어나지 않는다. listener가 없고 provider가 initilized 안된 상태면
              logger.d('ref.invalidate(counterProvider)'.toMagenta);
              ref.invalidate(counterProvider);
            },
            child: Text('counter invalidate'),
          ),
        ],
      ),
      body: postsAsync.when(
        skipLoadingOnRefresh: false,
        data: (posts) => ListView.separated(
          itemCount: posts.length,
          itemBuilder: (context, index) {
            final post = posts[index];
            return ListTile(
                leading: DecoratedBox(
                  decoration: const BoxDecoration(
                    color: Colors.indigo,
                    //border:StadiumBorder(),
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(post.id.toString(),
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(color: Colors.white)),
                  ),
                ),
                title: Text(post.title,
                    style: Theme.of(context).textTheme.titleMedium),
                onTap: () {
                  context.goNamed(AppRoute.post.name,
                      pathParameters: {'postId': '${post.id}'});
                });
          },
          separatorBuilder: (context, index) => const Divider(),
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, st) => Center(child: Text(e.toString())),
      ),
    );
  }
}
