// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$helloHash() => r'53eafd2962c11fc4761e1a23ed9dc2de5d7959f4';

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
String _$hiHash() => r'5163a1eac3e7731246aed20bdc007381ddc78971';

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
String _$nationHash() => r'592dc1db591386842114cd88091ef99e13aae313';

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
String _$nameHash() => r'5c2b006c605713b49bf0a4d61d15d05d3c02b3fd';

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
String _$counterHash() => r'bd298b28048ea3fbd9395bb2f31eeb58cf0c9e1a';

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
String _$asyncCounterHash() => r'd9e356e8bc8467516247289fc475697b9649e9a2';

/// See also [AsyncCounter].
@ProviderFor(AsyncCounter)
final asyncCounterProvider =
    AutoDisposeAsyncNotifierProvider<AsyncCounter, int>.internal(
  AsyncCounter.new,
  name: r'asyncCounterProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$asyncCounterHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AsyncCounter = AutoDisposeAsyncNotifier<int>;
String _$timeHash() => r'3c6bb5e3702710041b6ce0613ad9962da442c327';

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
String _$cityHash() => r'a04ebdca2167bd6a2b4e6c5b38f35f03952078cf';

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
String _$riverpodTestScreenControllerHash() =>
    r'f636c30516f677976b47d740a2c00437db9719b6';

/// See also [RiverpodTestScreenController].
@ProviderFor(RiverpodTestScreenController)
final riverpodTestScreenControllerProvider = AutoDisposeAsyncNotifierProvider<
    RiverpodTestScreenController, void>.internal(
  RiverpodTestScreenController.new,
  name: r'riverpodTestScreenControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$riverpodTestScreenControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$RiverpodTestScreenController = AutoDisposeAsyncNotifier<void>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
