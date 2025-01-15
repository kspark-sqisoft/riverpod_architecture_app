// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$authRepositoryHash() => r'679e1bec8673a7c6784c161761142760a8c7cdf0';

/// See also [authRepository].
@ProviderFor(authRepository)
final authRepositoryProvider = AutoDisposeProvider<AuthRepository>.internal(
  authRepository,
  name: r'authRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$authRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef AuthRepositoryRef = AutoDisposeProviderRef<AuthRepository>;
String _$userStreamHash() => r'8dac7d824a55d982e2a674b056bef9a58a090290';

/// See also [userStream].
@ProviderFor(userStream)
final userStreamProvider = AutoDisposeStreamProvider<User?>.internal(
  userStream,
  name: r'userStreamProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$userStreamHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef UserStreamRef = AutoDisposeStreamProviderRef<User?>;
String _$helloHash() => r'c6bd280b23897b8cde6ca84312cb7e230bf9af25';

/// See also [hello].
@ProviderFor(hello)
final helloProvider = Provider<String>.internal(
  hello,
  name: r'helloProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$helloHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef HelloRef = ProviderRef<String>;
String _$hiHash() => r'5299f36c6f1d6eca59994e18317a9ffb4dec0f3e';

/// See also [hi].
@ProviderFor(hi)
final hiProvider = AutoDisposeProvider<String>.internal(
  hi,
  name: r'hiProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$hiHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef HiRef = AutoDisposeProviderRef<String>;
String _$nationHash() => r'33f03d2bba41b3709511f223ef6e50a8a0bf30b7';

/// See also [Nation].
@ProviderFor(Nation)
final nationProvider = NotifierProvider<Nation, String>.internal(
  Nation.new,
  name: r'nationProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$nationHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Nation = Notifier<String>;
String _$nameHash() => r'24e3f666ac803502de8f26ecc47a61f48b3e9be7';

/// See also [Name].
@ProviderFor(Name)
final nameProvider = AutoDisposeNotifierProvider<Name, String>.internal(
  Name.new,
  name: r'nameProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$nameHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Name = AutoDisposeNotifier<String>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
