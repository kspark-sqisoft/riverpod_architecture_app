import 'package:flutter/material.dart';
import 'package:riverpod_architecture_app/features/media_player/domain/media_item.dart';
import 'package:riverpod_architecture_app/main.dart';

class VideoPlayer extends StatefulWidget {
  const VideoPlayer({super.key, required this.mediaItem});
  final MediaItem mediaItem;

  @override
  State<VideoPlayer> createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> {
  @override
  void initState() {
    logger.d('VideoPlayer initState');
    super.initState();
  }

  @override
  void dispose() {
    logger.d('VideoPlayer dispose');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Video Player'),
    );
  }
}
