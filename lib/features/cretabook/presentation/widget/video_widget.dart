import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:media_kit_video/media_kit_video.dart';

class VideoWidget extends ConsumerStatefulWidget {
  const VideoWidget({super.key, required this.controller});
  final VideoController controller;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _VideoWidgetState();
}

class _VideoWidgetState extends ConsumerState<VideoWidget> {
  @override
  void initState() {
    widget.controller.player.play();
    super.initState();
  }

  @override
  void dispose() {
    widget.controller.player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Video(
      controller: widget.controller,
    );
  }
}
