import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart';
import 'package:riverpod_architecture_app/main.dart';

final configuration = ValueNotifier<VideoControllerConfiguration>(
  const VideoControllerConfiguration(enableHardwareAcceleration: true),
);

class MediakitScreen extends ConsumerStatefulWidget {
  const MediakitScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MediakitScreenState();
}

class _MediakitScreenState extends ConsumerState<MediakitScreen> {
  static const int count = 16;
  final List<String> mediaSources = [
    'file:///D:/Pictures/video/video0.mp4',
    'https://user-images.githubusercontent.com/28951144/229373695-22f88f13-d18f-4288-9bf1-c3e078d83722.mp4',
    'https://user-images.githubusercontent.com/28951144/229373709-603a7a89-2105-4e1b-a5a5-a6c3567c9a59.mp4',
    'https://user-images.githubusercontent.com/28951144/229373716-76da0a4e-225a-44e4-9ee7-3e9006dbc3e3.mp4',
    'https://user-images.githubusercontent.com/28951144/229373718-86ce5e1d-d195-45d5-baa6-ef94041d0b90.mp4',
    'https://user-images.githubusercontent.com/28951144/229373720-14d69157-1a56-4a78-a2f4-d7a134d7c3e9.mp4',
  ];
  final List<Player> players = [];
  final List<VideoController> controllers = [];

  @override
  void initState() {
    logger.d('######################################');
    logger.d('MediakitScreen initState');
    super.initState();
    for (int i = 0; i < count; i++) {
      final player = Player();
      final controller = VideoController(
        player,
        configuration: configuration.value,
      );
      players.add(player);
      controllers.add(controller);
    }
    for (int i = 0; i < count; i++) {
      players[i].setAudioTrack(AudioTrack.no());
      players[i].setPlaylistMode(PlaylistMode.loop);
      players[i].open(Media(mediaSources[i % mediaSources.length]));
      players[i].stream.error.listen((error) {
        logger.e('MediaKit error:$error');
      });
    }
  }

  @override
  void dispose() {
    logger.d('MediakitScreen dispose');
    for (final player in players) {
      player.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final children = controllers.map(
      (e) {
        final video = Video(controller: e);
        if (Theme.of(context).platform == TargetPlatform.android) {
          return video;
        }
        return Card(
          margin: EdgeInsets.zero,
          clipBehavior: Clip.antiAlias,
          child: video,
        );
      },
    ).toList();
    return Scaffold(
      appBar: AppBar(
        title: const Text('package:media_kit'),
      ),
      body: GridView.extent(
        maxCrossAxisExtent: 480.0,
        padding: const EdgeInsets.all(16.0),
        mainAxisSpacing: 16.0,
        crossAxisSpacing: 16.0,
        childAspectRatio: 16.0 / 9.0,
        children: children,
      ),
    );
  }
}