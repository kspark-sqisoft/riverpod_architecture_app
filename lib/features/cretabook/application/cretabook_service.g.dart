// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cretabook_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$videoControllerHash() => r'62a771d279e5713f86483b067bc95492bec73a16';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [videoController].
@ProviderFor(videoController)
const videoControllerProvider = VideoControllerFamily();

/// See also [videoController].
class VideoControllerFamily extends Family<VideoController> {
  /// See also [videoController].
  const VideoControllerFamily();

  /// See also [videoController].
  VideoControllerProvider call({
    required int id,
  }) {
    return VideoControllerProvider(
      id: id,
    );
  }

  @override
  VideoControllerProvider getProviderOverride(
    covariant VideoControllerProvider provider,
  ) {
    return call(
      id: provider.id,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'videoControllerProvider';
}

/// See also [videoController].
class VideoControllerProvider extends AutoDisposeProvider<VideoController> {
  /// See also [videoController].
  VideoControllerProvider({
    required int id,
  }) : this._internal(
          (ref) => videoController(
            ref as VideoControllerRef,
            id: id,
          ),
          from: videoControllerProvider,
          name: r'videoControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$videoControllerHash,
          dependencies: VideoControllerFamily._dependencies,
          allTransitiveDependencies:
              VideoControllerFamily._allTransitiveDependencies,
          id: id,
        );

  VideoControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final int id;

  @override
  Override overrideWith(
    VideoController Function(VideoControllerRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: VideoControllerProvider._internal(
        (ref) => create(ref as VideoControllerRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<VideoController> createElement() {
    return _VideoControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is VideoControllerProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin VideoControllerRef on AutoDisposeProviderRef<VideoController> {
  /// The parameter `id` of this provider.
  int get id;
}

class _VideoControllerProviderElement
    extends AutoDisposeProviderElement<VideoController>
    with VideoControllerRef {
  _VideoControllerProviderElement(super.provider);

  @override
  int get id => (origin as VideoControllerProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
