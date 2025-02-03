import 'package:flutter/material.dart';
import 'package:riverpod_architecture_app/features/media_player/domain/media_item.dart';

import '../../../../main.dart';

class ImagePlayer extends StatefulWidget {
  const ImagePlayer({super.key, required this.mediaItem});
  final MediaItem mediaItem;

  @override
  State<ImagePlayer> createState() => _ImagePlayerState();
}

class _ImagePlayerState extends State<ImagePlayer> {
  @override
  void initState() {
    logger.d('ImagePlayer initState');
    super.initState();
  }

  @override
  void dispose() {
    logger.d('ImagePlayer dispose');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Image Player'),
    );
  }
}
