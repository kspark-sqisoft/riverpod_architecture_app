// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MediaItemImpl _$$MediaItemImplFromJson(Map<String, dynamic> json) =>
    _$MediaItemImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      duration: Duration(microseconds: (json['duration'] as num).toInt()),
      mediaType: $enumDecode(_$MediaTypeEnumMap, json['mediaType']),
    );

Map<String, dynamic> _$$MediaItemImplToJson(_$MediaItemImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'duration': instance.duration.inMicroseconds,
      'mediaType': _$MediaTypeEnumMap[instance.mediaType]!,
    };

const _$MediaTypeEnumMap = {
  MediaType.video: 'video',
  MediaType.image: 'image',
  MediaType.text: 'text',
};
