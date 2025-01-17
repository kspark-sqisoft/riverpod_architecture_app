import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart';
import 'package:riverpod_architecture_app/features/cretabook/application/cretabook_service.dart';
import 'package:riverpod_architecture_app/utils/string_color_extension.dart';

import '../main.dart';
import '../router/app_router.dart';

class ScaffoldWithNavbarShell extends ConsumerStatefulWidget {
  const ScaffoldWithNavbarShell({super.key, required this.child});
  final Widget child;

  @override
  ConsumerState<ScaffoldWithNavbarShell> createState() =>
      _ScaffoldWithNavbarShellState();
}

class _ScaffoldWithNavbarShellState
    extends ConsumerState<ScaffoldWithNavbarShell> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.man), label: 'Auth'),
          BottomNavigationBarItem(icon: Icon(Icons.sunny), label: 'Weather'),
          BottomNavigationBarItem(icon: Icon(Icons.post_add), label: 'Post'),
          BottomNavigationBarItem(icon: Icon(Icons.hearing), label: 'Riverpod'),
          BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.dog), label: 'Todo'),
          BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.video), label: 'MediaKit'),
          BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.book), label: 'CretaBook'),
        ],
        selectedItemColor: Colors.lightGreen,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        currentIndex: currentIndex,
        onTap: (int index) {
          _onTap(index);
        },
      ),
    );
  }

  void _onTap(int index) async {
    logger.d('ScaffoldWithNavbarShell _onTap($index)'.toGreen);
    setState(() {
      currentIndex = index;
    });
    switch (index) {
      case 0:
        ref.read(appRouterProvider).goNamed(AppRoute.auth.name);
      case 1:
        ref.read(appRouterProvider).goNamed(AppRoute.weather.name);
      case 2:
        ref.read(appRouterProvider).goNamed(AppRoute.posts.name);
      case 3:
        ref.read(appRouterProvider).goNamed(AppRoute.riverpodtest.name);
      case 4:
        ref.read(appRouterProvider).goNamed(AppRoute.todo.name);
      case 5:
        ref.read(appRouterProvider).goNamed(AppRoute.mediakit.name);
      case 6:
        List<Future<VideoController>> futures = [];

        for (int i = 0; i < 4; i++) {
          futures.add(initVideoController(i));
        }
        final controllers = await Future.wait(futures);
        ref
            .read(appRouterProvider)
            .goNamed(AppRoute.cretabook.name, extra: controllers);
    }
  }

  Future<VideoController> initVideoController(int id) async {
    final player = Player();
    //player.setAudioTrack(AudioTrack.no());
    player.setPlaylistMode(PlaylistMode.loop);
    final controller = VideoController(player);
    await controller.player
        .open(Media('file:///D:/Pictures/video/video$id.mp4'), play: false);
    await controller.waitUntilFirstFrameRendered;
    return controller;
  }
}
