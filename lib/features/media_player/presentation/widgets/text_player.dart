import 'package:flutter/material.dart';
import 'package:riverpod_architecture_app/features/media_player/domain/media_item.dart';

import '../../../../main.dart';

class TextPlayer extends StatefulWidget {
  const TextPlayer({super.key, required this.mediaItem});
  final MediaItem mediaItem;

  @override
  State<TextPlayer> createState() => _TextPlayerState();
}

class _TextPlayerState extends State<TextPlayer> {
  @override
  void initState() {
    logger.d('TextPlayer initState');
    super.initState();
  }

  @override
  void dispose() {
    logger.d('TextPlayer dispose');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Text Player'),
    );
  }
}
