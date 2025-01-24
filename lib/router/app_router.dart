import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:media_kit_video/media_kit_video.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_architecture_app/components/scaffold_with_navbar_shell.dart';
import 'package:riverpod_architecture_app/features/authentication/presentation/auth_screen.dart';
import 'package:riverpod_architecture_app/features/cretabook/application/cretabook_service.dart';
import 'package:riverpod_architecture_app/features/cretabook/presentation/cretabook_screen.dart';
import 'package:riverpod_architecture_app/features/inmemory/presentation/in_memory_screen.dart';
import 'package:riverpod_architecture_app/features/media_player/presentation/media_player_screen.dart';
import 'package:riverpod_architecture_app/features/mediakit/presentation/mediakit_screen.dart';
import 'package:riverpod_architecture_app/features/post/presentation/post_edit_screen.dart';
import 'package:riverpod_architecture_app/features/post/presentation/post_screen.dart';
import 'package:riverpod_architecture_app/features/post/presentation/posts_screen.dart';
import 'package:riverpod_architecture_app/features/riverpottest/presentation/riverpod_test_screen.dart';
import 'package:riverpod_architecture_app/features/weather/presentation/weather_screen.dart';
import 'package:collection/collection.dart';
import '../features/todo/presentation/todo_screen.dart';
part 'app_router.g.dart';

enum AppRoute {
  auth,
  weather,
  posts,
  post,
  postedit,
  riverpodtest,
  todo,
  mediakit,
  cretabook,
  inmemory,
  mediaplayer
}

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>();
@Riverpod(keepAlive: true)
GoRouter appRouter(Ref ref) {
  return GoRouter(
    initialLocation: '/auth',
    navigatorKey: _rootNavigatorKey,
    routes: [
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (context, state, child) =>
            ScaffoldWithNavbarShell(child: child),
        routes: [
          GoRoute(
            path: '/auth',
            name: AppRoute.auth.name,
            pageBuilder: (context, state) =>
                NoTransitionPage(child: AuthScreen()),
          ),
          GoRoute(
            path: '/weather',
            name: AppRoute.weather.name,
            pageBuilder: (context, state) =>
                NoTransitionPage(child: WeatherScreen()),
          ),
          GoRoute(
            path: '/posts',
            name: AppRoute.posts.name,
            pageBuilder: (context, state) =>
                NoTransitionPage(child: PostsScreen()),
            routes: [
              GoRoute(
                path: 'post/:postId',
                name: AppRoute.post.name,
                pageBuilder: (context, state) {
                  final postId = state.pathParameters['postId'];
                  return NoTransitionPage(
                    child: PostScreen(
                      postId: int.parse(postId!),
                    ),
                  );
                },
              ),
              GoRoute(
                path: 'postedit/:postId',
                name: AppRoute.postedit.name,
                pageBuilder: (context, state) {
                  final postId = state.pathParameters['postId'];
                  return NoTransitionPage(
                    child: PostEditScreen(
                      postId: int.parse(postId!),
                    ),
                  );
                },
              ),
            ],
          ),
          GoRoute(
            path: '/riverpodtest',
            name: AppRoute.riverpodtest.name,
            pageBuilder: (context, state) =>
                NoTransitionPage(child: RiverpodTestScreen()),
          ),
          GoRoute(
            path: '/todo',
            name: AppRoute.todo.name,
            pageBuilder: (context, state) =>
                NoTransitionPage(child: TodoScreen()),
          ),
          GoRoute(
            path: '/mediakit',
            name: AppRoute.mediakit.name,
            pageBuilder: (context, state) =>
                NoTransitionPage(child: MediakitScreen()),
          ),
          GoRoute(
              path: '/cretabook',
              name: AppRoute.cretabook.name,
              pageBuilder: (context, state) {
                final controllers = state.extra as List<VideoController>;

                return NoTransitionPage(
                    child: ProviderScope(overrides: [
                  ...controllers.mapIndexed((i, controller) {
                    return videoControllerProvider(id: i)
                        .overrideWithValue(controllers[i]);
                  }),
                ], child: CretaBookScreen()));
              }),
          GoRoute(
            path: '/inmemory',
            name: AppRoute.inmemory.name,
            pageBuilder: (context, state) =>
                NoTransitionPage(child: InMemoryScreen()),
          ),
          GoRoute(
            path: '/mediaplayer',
            name: AppRoute.mediaplayer.name,
            pageBuilder: (context, state) =>
                NoTransitionPage(child: MediaPlayerScreen()),
          ),
        ],
      ),
    ],
  );
}
