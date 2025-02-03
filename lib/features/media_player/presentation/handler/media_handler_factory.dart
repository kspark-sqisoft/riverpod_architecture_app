import '../../domain/media_item.dart';
import 'image_handler.dart';
import 'media_handler.dart';
import 'text_handler.dart';
import 'video_handler.dart';

class MediaHandlerFactory {
  static MediaHandler getHandler(MediaType type) {
    switch (type) {
      case MediaType.video:
        return VideoHandler();
      case MediaType.image:
        return ImageHandler();
      case MediaType.text:
        return TextHandler();
    }
  }
}
