import 'package:freezed_annotation/freezed_annotation.dart';

part 'media_item.g.dart';
part 'media_item.freezed.dart';

enum MediaType { video, image, text }

@freezed
class MediaItem with _$MediaItem {
  factory MediaItem({
    required String id,
    required String title,
    required Duration duration,
    required MediaType mediaType,
  }) = _MediaItem;

  factory MediaItem.fromJson(Map<String, dynamic> json) =>
      _$MediaItemFromJson(json);
}
