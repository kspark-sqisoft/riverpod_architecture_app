import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_architecture_app/features/media_player/presentation/play_list_state.dart';

import '../../../main.dart';

class MediaPlayerScreen extends ConsumerStatefulWidget {
  const MediaPlayerScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _MediaPlayerScreenState();
}

class _MediaPlayerScreenState extends ConsumerState<MediaPlayerScreen> {
  @override
  void initState() {
    final PlayListState playListState = PlayListState(queue: []);
    logger.d('playListState:$playListState');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
