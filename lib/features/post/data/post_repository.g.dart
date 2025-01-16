// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$postRepositoryHash() => r'42e3a9b7f15f323dec4acc1009882de06ec91550';

/// See also [postRepository].
@ProviderFor(postRepository)
final postRepositoryProvider = Provider<PostRepository>.internal(
  postRepository,
  name: r'postRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$postRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef PostRepositoryRef = ProviderRef<PostRepository>;
String _$fetchPostsHash() => r'9661e331832e7b5550dc5b38a53d07471d3f9f17';

/// See also [fetchPosts].
@ProviderFor(fetchPosts)
final fetchPostsProvider = AutoDisposeFutureProvider<List<Post>>.internal(
  fetchPosts,
  name: r'fetchPostsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$fetchPostsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef FetchPostsRef = AutoDisposeFutureProviderRef<List<Post>>;
String _$fetchPostHash() => r'4c82ec253cd7b1b8efded625396524058233d893';

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

/// See also [fetchPost].
@ProviderFor(fetchPost)
const fetchPostProvider = FetchPostFamily();

/// See also [fetchPost].
class FetchPostFamily extends Family<AsyncValue<Post>> {
  /// See also [fetchPost].
  const FetchPostFamily();

  /// See also [fetchPost].
  FetchPostProvider call(
    int postId,
  ) {
    return FetchPostProvider(
      postId,
    );
  }

  @override
  FetchPostProvider getProviderOverride(
    covariant FetchPostProvider provider,
  ) {
    return call(
      provider.postId,
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
  String? get name => r'fetchPostProvider';
}

/// See also [fetchPost].
class FetchPostProvider extends AutoDisposeFutureProvider<Post> {
  /// See also [fetchPost].
  FetchPostProvider(
    int postId,
  ) : this._internal(
          (ref) => fetchPost(
            ref as FetchPostRef,
            postId,
          ),
          from: fetchPostProvider,
          name: r'fetchPostProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchPostHash,
          dependencies: FetchPostFamily._dependencies,
          allTransitiveDependencies: FetchPostFamily._allTransitiveDependencies,
          postId: postId,
        );

  FetchPostProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.postId,
  }) : super.internal();

  final int postId;

  @override
  Override overrideWith(
    FutureOr<Post> Function(FetchPostRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchPostProvider._internal(
        (ref) => create(ref as FetchPostRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        postId: postId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Post> createElement() {
    return _FetchPostProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchPostProvider && other.postId == postId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, postId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin FetchPostRef on AutoDisposeFutureProviderRef<Post> {
  /// The parameter `postId` of this provider.
  int get postId;
}

class _FetchPostProviderElement extends AutoDisposeFutureProviderElement<Post>
    with FetchPostRef {
  _FetchPostProviderElement(super.provider);

  @override
  int get postId => (origin as FetchPostProvider).postId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
