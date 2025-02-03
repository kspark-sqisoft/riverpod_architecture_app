// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'play_list_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PlayListStateImpl _$$PlayListStateImplFromJson(Map<String, dynamic> json) =>
    _$PlayListStateImpl(
      playing: json['playing'] as bool? ?? false,
      queue: (json['queue'] as List<dynamic>)
          .map((e) => MediaItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      queIndex: (json['queIndex'] as num?)?.toInt() ?? 0,
      repeatMode:
          $enumDecodeNullable(_$MediaRepeatModeEnumMap, json['repeatMode']) ??
              MediaRepeatMode.none,
      suffleMode:
          $enumDecodeNullable(_$MediaSuffleModeEnumMap, json['suffleMode']) ??
              MediaSuffleMode.none,
    );

Map<String, dynamic> _$$PlayListStateImplToJson(_$PlayListStateImpl instance) =>
    <String, dynamic>{
      'playing': instance.playing,
      'queue': instance.queue.map((e) => e.toJson()).toList(),
      'queIndex': instance.queIndex,
      'repeatMode': _$MediaRepeatModeEnumMap[instance.repeatMode]!,
      'suffleMode': _$MediaSuffleModeEnumMap[instance.suffleMode]!,
    };

const _$MediaRepeatModeEnumMap = {
  MediaRepeatMode.none: 'none',
  MediaRepeatMode.one: 'one',
  MediaRepeatMode.all: 'all',
};

const _$MediaSuffleModeEnumMap = {
  MediaSuffleMode.none: 'none',
  MediaSuffleMode.all: 'all',
};
