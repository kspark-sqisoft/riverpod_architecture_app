import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_architecture_app/features/media_player/presentation/play_list_state.dart';

import '../domain/media_item.dart';
import 'handler/media_handler.dart';
import 'handler/media_handler_factory.dart';

part 'media_player_provider.g.dart';

@riverpod
class MediaPlayer extends _$MediaPlayer {
  @override
  PlayListState build() {
    return PlayListState(queue: []);
  }

  void playPause() {
    if (state.playing) {
      _currentHandler()?.pause();
      state = state.copyWith(playing: false);
    } else {
      _currentHandler()?.play();
      state = state.copyWith(playing: true);
    }
  }

  void seek(Duration? duration) {
    if (duration != null && state.currentMedia != null) {
      _currentHandler()?.seek(duration);
    }
  }

  Future<void> startPlayList(List<MediaItem> queue, int index) async {
    state = state.copyWith(queue: queue, queIndex: index, playing: true);
    _currentHandler()?.play();
  }

  void skipToNext() {
    if (state.queIndex < state.queue.length - 1) {
      state = state.copyWith(queIndex: state.queIndex + 1, playing: true);
    } else if (state.repeatMode == MediaRepeatMode.all) {
      state = state.copyWith(queIndex: 0, playing: true);
    }
    _currentHandler()?.play();
  }

  void skipToPrevious() {
    if (state.queIndex > 0) {
      state = state.copyWith(queIndex: state.queIndex - 1, playing: true);
    } else if (state.repeatMode == MediaRepeatMode.all) {
      state = state.copyWith(queIndex: state.queue.length - 1, playing: true);
    }
    _currentHandler()?.play();
  }

  void skipToQueueItem(int index) {
    if (index >= 0 && index < state.queue.length) {
      state = state.copyWith(queIndex: index, playing: true);
      _currentHandler()?.play();
    }
  }

  void removeQueueItemAt(int index) {
    if (index >= 0 && index < state.queue.length) {
      List<MediaItem> updatedQueue = List.from(state.queue)..removeAt(index);

      int newIndex = state.queIndex;
      if (index == state.queIndex) {
        // 현재 재생 중인 항목이 삭제되면 다음 항목으로 이동
        newIndex = (state.queIndex < updatedQueue.length)
            ? state.queIndex
            : updatedQueue.length - 1;
      } else if (index < state.queIndex) {
        // 삭제된 항목이 현재 재생 중인 항목 앞에 있으면 index 조정
        newIndex -= 1;
      }

      state = state.copyWith(
          queue: updatedQueue, queIndex: newIndex, playing: true);
      if (state.queue.isNotEmpty) {
        _currentHandler()?.play();
      }
    }
  }

  void changeRepeatMode(MediaRepeatMode repeatMode) {
    state = state.copyWith(repeatMode: repeatMode);
    switch (state.repeatMode) {
      case MediaRepeatMode.none:
        _currentHandler()?.setRepeatMode(MediaRepeatMode.none);
      case MediaRepeatMode.one:
        _currentHandler()?.setRepeatMode(MediaRepeatMode.one);
      case MediaRepeatMode.all:
        _currentHandler()?.setRepeatMode(MediaRepeatMode.all);
    }
  }

  MediaHandler? _currentHandler() {
    if (state.currentMedia == null) return null;
    return MediaHandlerFactory.getHandler(state.currentMedia!.mediaType);
  }
}
