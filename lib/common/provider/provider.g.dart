// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$helloHash() => r'366f109f6f9f91a8017ba66ef3609bef8dcc1857';

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
String _$hiHash() => r'55b2bb77318b196bf76a2ada555bab370b8e8de9';

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
String _$nationHash() => r'46917d3eeb1da185e678e5d03db705dedc8ff8ec';

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
String _$nameHash() => r'b3e235b23dc123ed7515ee70fe5510210a96349f';

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
String _$counterHash() => r'ee9d4957b2d38fbd15f43085e9a53cb57fe9c7ee';

/// See also [Counter].
@ProviderFor(Counter)
final counterProvider = AutoDisposeNotifierProvider<Counter, int>.internal(
  Counter.new,
  name: r'counterProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$counterHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Counter = AutoDisposeNotifier<int>;
String _$timeHash() => r'615e5bf7f311ec4231aa4bb20f6bbece35f43bc6';

/// See also [Time].
@ProviderFor(Time)
final timeProvider = AutoDisposeNotifierProvider<Time, String>.internal(
  Time.new,
  name: r'timeProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$timeHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Time = AutoDisposeNotifier<String>;
String _$cityHash() => r'0fa803df406ae1758cb69e3c3c2a393b731fa2d5';

/// See also [City].
@ProviderFor(City)
final cityProvider = AutoDisposeNotifierProvider<City, String>.internal(
  City.new,
  name: r'cityProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$cityHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$City = AutoDisposeNotifier<String>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
