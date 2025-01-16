import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_architecture_app/utils/string_color_extension.dart';

import '../../../common/api/api_error.dart';
import '../../../common/api/dio_provider.dart';
import '../../../main.dart';
import '../domain/post.dart';

part 'post_repository.g.dart';

class PostRepository {
  PostRepository({required this.dio});
  final Dio dio;

  Future<List<Post>> fetchPosts({CancelToken? cancelToken}) => _run<List<Post>>(
        request: () => dio.get(
          'https://jsonplaceholder.typicode.com/posts',
          cancelToken: cancelToken,
        ),
        parse: (data) {
          // get the list of results
          final posts = data as List<dynamic>;
          // map them to a List<Album>
          return posts.map((post) => Post.fromJson(post)).toList();
        },
      );

  Future<Post> fetchPost(int postId, {CancelToken? cancelToken}) => _run<Post>(
        request: () => dio.get(
          'https://jsonplaceholder.typicode.com/posts/$postId',
          cancelToken: cancelToken,
        ),
        parse: (data) => Post.fromJson(data),
      );

  // Note: this method submits the data, but the backend won't actually update it
  Future<void> updatePost(Post post, {CancelToken? cancelToken}) => _run<void>(
        request: () => dio.put(
          'https://jsonplaceholder.typicode.com/posts/${post.id}',
          data: post.toJson(),
          cancelToken: cancelToken,
        ),
        parse: (data) {},
      );

  // Generic method to make a request and parse the response data
  Future<T> _run<T>({
    required Future<Response> Function() request,
    required T Function(dynamic) parse,
  }) async {
    try {
      // add artificial delay to test loading UI
      //await Future.delayed(const Duration(seconds: 1));
      final response = await request();
      switch (response.statusCode) {
        case 200:
          return parse(response.data);
        case 404:
          throw const APIError.notFound();
        default:
          throw const APIError.unknown();
      }
    } on SocketException catch (_) {
      throw const APIError.noInternetConnection();
    }
  }
}

@Riverpod(keepAlive: true)
PostRepository postRepository(Ref ref) {
  ref.onDispose(() {
    logger.d('postRepositoryProvider onDispose'.toRed);
  });
  ref.onCancel(() {
    logger.d('postRepositoryProvider onCancel');
  });
  ref.onResume(() {
    logger.d('postRepositoryProvider onResume');
  });
  ref.onAddListener(() {
    logger.d('postRepositoryProvider onAddListener');
  });
  ref.onRemoveListener(() {
    logger.d('postRepositoryProvider onRemoveListener');
  });
  logger.d('postRepositoryProvider initialized(build)'.toGreen);
  logger.d('postRepositoryProvider ref.watch(dioProvider)');
  return PostRepository(dio: ref.watch(dioProvider));
}

@riverpod
Future<List<Post>> fetchPosts(Ref ref) {
  // An object from package:dio that allows cancelling http requests
  final cancelToken = CancelToken();
  // When the provider is destroyed, cancel the http request
  ref.onDispose(() {
    cancelToken.cancel();
    logger.d('fetchPostsProvider onDispose'.toRed);
  });
  ref.onCancel(() {
    logger.d('fetchPostsProvider onCancel');
  });
  ref.onResume(() {
    logger.d('fetchPostsProvider onResume');
  });
  ref.onAddListener(() {
    logger.d('fetchPostsProvider onAddListener');
  });
  ref.onRemoveListener(() {
    logger.d('fetchPostsProvider onRemoveListener');
  });
  logger.d('fetchPostsProvider initialized'.toGreen);

  return ref.watch(postRepositoryProvider).fetchPosts(cancelToken: cancelToken);
}

@riverpod
Future<Post> fetchPost(Ref ref, int postId) {
  logger.d('fetchPostProvider(postId:$postId) initialized(build)'.toGreen);
  // get the [KeepAliveLink]
  final link = ref.keepAlive();
  logger.d('fetchPostProvider(postId:$postId) keepAlive link open');
  // a timer to be used by the callbacks below
  Timer? timer;
  // An object from package:dio that allows cancelling http requests
  final cancelToken = CancelToken();
  // When the provider is destroyed, cancel the http request
  ref.onDispose(() {
    timer?.cancel();
    cancelToken.cancel();
    logger.d(
        'fetchPostProvider(postId:$postId) onDispose timer cancel, cancelToke cancel'
            .toRed);
  });
  // When the last listener is removed, start a timer to dispose the cached data
  ref.onCancel(() {
    // start a 30 second timer
    logger
        .d('fetchPostProvider(postId:$postId) onCancel timer start 5 seconds');
    timer = Timer(const Duration(seconds: 5), () {
      // dispose on timeout
      link.close();
      logger.d(
          'fetchPostProvider(postId:$postId) onCancel timer end keepAlive link close');
    });
  });
  // If the provider is listened again after it was paused, cancel the timer
  ref.onResume(() {
    timer?.cancel();
    logger.d('fetchPostProvider(postId:$postId) onResume timer.cancel');
  });
  ref.onAddListener(() {
    logger.d('fetchPostProvider(postId:$postId) onAddListener');
  });
  ref.onRemoveListener(() {
    logger.d('fetchPostProvider(postId:$postId) onRemoveListener');
  });

  // Fetch our data and pass our `cancelToken` for cancellation to work
  logger.d(
      'fetchPostProvider(postId:$postId) ref.watch(postRepositoryProvider).fetchPost(postId, cancelToken: cancelToken)');
  return ref
      .watch(postRepositoryProvider)
      .fetchPost(postId, cancelToken: cancelToken);
}
