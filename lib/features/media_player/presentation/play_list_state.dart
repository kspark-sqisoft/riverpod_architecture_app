import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_architecture_app/features/media_player/domain/media_item.dart';

part 'play_list_state.g.dart';
part 'play_list_state.freezed.dart';

enum MediaRepeatMode {
  /// The current media item or queue will not repeat.
  none,

  /// The current media item will repeat.
  one,

  /// Playback will continue looping through all media items in the current list.
  all,
}

enum MediaSuffleMode {
  none,
  all,
}

@freezed
class PlayListState with _$PlayListState {
  factory PlayListState({
    @Default(false) bool playing,
    required List<MediaItem> queue,
    @Default(0) int queIndex,
    @Default(MediaRepeatMode.none) MediaRepeatMode repeatMode,
    @Default(MediaSuffleMode.none) MediaSuffleMode suffleMode,
  }) = _PlayListState;

  factory PlayListState.fromJson(Map<String, dynamic> json) =>
      _$PlayListStateFromJson(json);

  const PlayListState._();
  // 현재 재생 중인 MediaItem 반환 메소드
  MediaItem? get currentMedia {
    if (queue.isNotEmpty && queIndex < queue.length && queIndex > -1) {
      return queue[queIndex];
    }
    return null;
  }
}
