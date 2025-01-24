// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'play_list_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PlayListState _$PlayListStateFromJson(Map<String, dynamic> json) {
  return _PlayListState.fromJson(json);
}

/// @nodoc
mixin _$PlayListState {
  bool get playing => throw _privateConstructorUsedError;
  List<MediaItem> get queue => throw _privateConstructorUsedError;
  int? get queIndex => throw _privateConstructorUsedError;

  /// Serializes this PlayListState to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PlayListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PlayListStateCopyWith<PlayListState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlayListStateCopyWith<$Res> {
  factory $PlayListStateCopyWith(
          PlayListState value, $Res Function(PlayListState) then) =
      _$PlayListStateCopyWithImpl<$Res, PlayListState>;
  @useResult
  $Res call({bool playing, List<MediaItem> queue, int? queIndex});
}

/// @nodoc
class _$PlayListStateCopyWithImpl<$Res, $Val extends PlayListState>
    implements $PlayListStateCopyWith<$Res> {
  _$PlayListStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PlayListState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? playing = null,
    Object? queue = null,
    Object? queIndex = freezed,
  }) {
    return _then(_value.copyWith(
      playing: null == playing
          ? _value.playing
          : playing // ignore: cast_nullable_to_non_nullable
              as bool,
      queue: null == queue
          ? _value.queue
          : queue // ignore: cast_nullable_to_non_nullable
              as List<MediaItem>,
      queIndex: freezed == queIndex
          ? _value.queIndex
          : queIndex // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PlayListStateImplCopyWith<$Res>
    implements $PlayListStateCopyWith<$Res> {
  factory _$$PlayListStateImplCopyWith(
          _$PlayListStateImpl value, $Res Function(_$PlayListStateImpl) then) =
      __$$PlayListStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool playing, List<MediaItem> queue, int? queIndex});
}

/// @nodoc
class __$$PlayListStateImplCopyWithImpl<$Res>
    extends _$PlayListStateCopyWithImpl<$Res, _$PlayListStateImpl>
    implements _$$PlayListStateImplCopyWith<$Res> {
  __$$PlayListStateImplCopyWithImpl(
      _$PlayListStateImpl _value, $Res Function(_$PlayListStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of PlayListState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? playing = null,
    Object? queue = null,
    Object? queIndex = freezed,
  }) {
    return _then(_$PlayListStateImpl(
      playing: null == playing
          ? _value.playing
          : playing // ignore: cast_nullable_to_non_nullable
              as bool,
      queue: null == queue
          ? _value._queue
          : queue // ignore: cast_nullable_to_non_nullable
              as List<MediaItem>,
      queIndex: freezed == queIndex
          ? _value.queIndex
          : queIndex // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PlayListStateImpl extends _PlayListState {
  _$PlayListStateImpl(
      {this.playing = false,
      required final List<MediaItem> queue,
      this.queIndex = 0})
      : _queue = queue,
        super._();

  factory _$PlayListStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$PlayListStateImplFromJson(json);

  @override
  @JsonKey()
  final bool playing;
  final List<MediaItem> _queue;
  @override
  List<MediaItem> get queue {
    if (_queue is EqualUnmodifiableListView) return _queue;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_queue);
  }

  @override
  @JsonKey()
  final int? queIndex;

  @override
  String toString() {
    return 'PlayListState(playing: $playing, queue: $queue, queIndex: $queIndex)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlayListStateImpl &&
            (identical(other.playing, playing) || other.playing == playing) &&
            const DeepCollectionEquality().equals(other._queue, _queue) &&
            (identical(other.queIndex, queIndex) ||
                other.queIndex == queIndex));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, playing,
      const DeepCollectionEquality().hash(_queue), queIndex);

  /// Create a copy of PlayListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PlayListStateImplCopyWith<_$PlayListStateImpl> get copyWith =>
      __$$PlayListStateImplCopyWithImpl<_$PlayListStateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PlayListStateImplToJson(
      this,
    );
  }
}

abstract class _PlayListState extends PlayListState {
  factory _PlayListState(
      {final bool playing,
      required final List<MediaItem> queue,
      final int? queIndex}) = _$PlayListStateImpl;
  _PlayListState._() : super._();

  factory _PlayListState.fromJson(Map<String, dynamic> json) =
      _$PlayListStateImpl.fromJson;

  @override
  bool get playing;
  @override
  List<MediaItem> get queue;
  @override
  int? get queIndex;

  /// Create a copy of PlayListState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PlayListStateImplCopyWith<_$PlayListStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
