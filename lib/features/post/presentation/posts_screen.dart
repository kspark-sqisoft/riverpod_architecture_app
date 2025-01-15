import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_architecture_app/features/post/presentation/post_screen.dart';
import 'package:riverpod_architecture_app/router/app_router.dart';

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
    return postsAsync.when(
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
    );
  }
}
