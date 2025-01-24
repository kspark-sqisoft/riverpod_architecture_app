import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_architecture_app/features/media_player/presentation/play_list_state.dart';

import '../domain/media_item.dart';

part 'media_player_provider.g.dart';

@riverpod
class MediaPlayer extends _$MediaPlayer {
  @override
  PlayListState build() {
    return PlayListState(queue: []);
  }

  void playPause() {
    if (state.playing) {
    } else {}
  }

  void seek(Duration? duration) {}

  Future<void> startPlayList(List<MediaItem> queue, int index) async {}

  void skipToNext() {}
  void skipToPrevious() {}
  void skipToQueueItem(int index) {}
  void removeQueueItemAt(int index) {}
}
