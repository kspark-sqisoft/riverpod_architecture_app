import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_architecture_app/features/media_player/presentation/media_player_provider.dart';
import 'package:riverpod_architecture_app/features/media_player/presentation/widgets/image_player.dart';
import 'package:riverpod_architecture_app/features/media_player/presentation/widgets/text_player.dart';
import 'package:riverpod_architecture_app/features/media_player/presentation/widgets/video_player.dart';

import '../domain/media_item.dart';
import 'play_list_state.dart';

class MediaPlayerScreen extends ConsumerStatefulWidget {
  const MediaPlayerScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _MediaPlayerScreenState();
}

class _MediaPlayerScreenState extends ConsumerState<MediaPlayerScreen> {
  final mediaQueue = [
    MediaItem(
        id: 'media0',
        title: 'media0',
        duration: Duration(seconds: 10),
        mediaType: MediaType.text),
    MediaItem(
        id: 'media1',
        title: 'media1',
        duration: Duration(seconds: 10),
        mediaType: MediaType.image),
    MediaItem(
        id: 'media2',
        title: 'media2',
        duration: Duration(seconds: 10),
        mediaType: MediaType.video),
  ];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final mediaPlayer = ref.watch(mediaPlayerProvider);
    final currentMedia = mediaPlayer.currentMedia;
    return Scaffold(
      body: currentMedia == null
          ? Center(child: Text('No Media Selected'))
          : _buildCurrentMedia(currentMedia),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'playlist_play',
            onPressed: () {
              ref
                  .read(mediaPlayerProvider.notifier)
                  .startPlayList(mediaQueue, 0);
            },
            child: Icon(Icons.playlist_play),
          ),
          FloatingActionButton(
            heroTag: 'play_pause',
            onPressed: () {
              ref.watch(mediaPlayerProvider.notifier).playPause();
            },
            child: Icon(
                ref.watch(mediaPlayerProvider.select((value) => value.playing))
                    ? Icons.pause
                    : Icons.play_arrow),
          ),
          FloatingActionButton(
            heroTag: 'repeat_mode',
            onPressed: () {
              ref
                  .read(mediaPlayerProvider.notifier)
                  .changeRepeatMode(MediaRepeatMode.all);
            },
            child: Consumer(builder: (_, ref, __) {
              final repeatMode =
                  ref.watch(mediaPlayerProvider.select((s) => s.repeatMode));
              IconData icon;
              switch (repeatMode) {
                case MediaRepeatMode.none:
                  icon = Icons.repeat; // 일반 repeat 아이콘
                  break;
                case MediaRepeatMode.one:
                  icon = Icons.repeat_one; // 한 곡 반복 아이콘
                  break;
                case MediaRepeatMode.all:
                  icon = Icons.repeat; // 전체 반복 아이콘 (색상 변경으로 차이 줄 수도 있음)
                  break;
              }
              return Icon(icon);
            }),
          ),
          FloatingActionButton(
            heroTag: 'skip_to_previous',
            onPressed: () {
              ref.watch(mediaPlayerProvider.notifier).skipToPrevious();
            },
            child: Icon(Icons.skip_previous),
          ),
          FloatingActionButton(
            heroTag: 'skip_to_next',
            onPressed: () {
              ref.watch(mediaPlayerProvider.notifier).skipToNext();
            },
            child: Icon(Icons.skip_next),
          ),
        ],
      ),
    );
  }

  Widget _buildCurrentMedia(MediaItem mediaItem) {
    return switch (mediaItem.mediaType) {
      MediaType.image => ImagePlayer(
          mediaItem: mediaItem,
        ),
      MediaType.text => TextPlayer(
          mediaItem: mediaItem,
        ),
      MediaType.video => VideoPlayer(
          mediaItem: mediaItem,
        )
    };
  }
}
