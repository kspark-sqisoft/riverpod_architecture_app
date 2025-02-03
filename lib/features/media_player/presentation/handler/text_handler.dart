import 'package:riverpod_architecture_app/features/media_player/domain/media_item.dart';
import 'package:riverpod_architecture_app/features/media_player/presentation/handler/media_handler.dart';
import 'package:riverpod_architecture_app/features/media_player/presentation/play_list_state.dart';

class TextHandler implements MediaHandler {
  @override
  Future<void> play() async {}
  @override
  Future<void> pause() async {}
  @override
  Future<void> stop() async {}
  @override
  Future<void> skipToNext() async {}

  @override
  Future<void> skipToPrevious() async {}

  @override
  Future<void> seek(Duration duration) async {}

  @override
  void setRepeatMode(MediaRepeatMode repeatMode) {}
}
