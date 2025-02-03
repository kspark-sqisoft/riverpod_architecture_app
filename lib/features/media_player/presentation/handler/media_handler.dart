import 'package:riverpod_architecture_app/features/media_player/presentation/play_list_state.dart';

abstract class MediaHandler {
  Future<void> play();
  Future<void> pause();
  Future<void> stop();
  Future<void> skipToNext();
  Future<void> skipToPrevious();
  Future<void> seek(Duration duration);

  void setRepeatMode(MediaRepeatMode repeatMode);
}
