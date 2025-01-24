import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_architecture_app/features/media_player/domain/media_item.dart';

part 'play_list_state.g.dart';
part 'play_list_state.freezed.dart';

@freezed
class PlayListState with _$PlayListState {
  factory PlayListState({
    @Default(false) bool playing,
    required List<MediaItem> queue,
    @Default(0) int? queIndex,
  }) = _PlayListState;

  factory PlayListState.fromJson(Map<String, dynamic> json) =>
      _$PlayListStateFromJson(json);

  const PlayListState._();
  // 현재 재생 중인 MediaItem 반환 메소드
  MediaItem? get currentMedia {
    if (queIndex == null || queIndex! < 0 || queIndex! >= queue.length) {
      return null;
    }
    return queue[queIndex!];
  }
}
