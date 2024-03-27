// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pods.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$homeViewModelHash() => r'0aff753bbe01310ee49dca7272b3e6ce6bf136df';

/// See also [homeViewModel].
@ProviderFor(homeViewModel)
final homeViewModelProvider = AutoDisposeProvider<HomeViewModel>.internal(
  homeViewModel,
  name: r'homeViewModelProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$homeViewModelHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef HomeViewModelRef = AutoDisposeProviderRef<HomeViewModel>;
String _$chargingSessionRequestViewModelHash() =>
    r'4a4b3bdf26736c90824c76e2040ff1fcdeb19d51';

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

/// See also [chargingSessionRequestViewModel].
@ProviderFor(chargingSessionRequestViewModel)
const chargingSessionRequestViewModelProvider =
    ChargingSessionRequestViewModelFamily();

/// See also [chargingSessionRequestViewModel].
class ChargingSessionRequestViewModelFamily
    extends Family<ChargingSessionRequestViewModel> {
  /// See also [chargingSessionRequestViewModel].
  const ChargingSessionRequestViewModelFamily();

  /// See also [chargingSessionRequestViewModel].
  ChargingSessionRequestViewModelProvider call({
    required double initialRange,
    required double maxRange,
  }) {
    return ChargingSessionRequestViewModelProvider(
      initialRange: initialRange,
      maxRange: maxRange,
    );
  }

  @override
  ChargingSessionRequestViewModelProvider getProviderOverride(
    covariant ChargingSessionRequestViewModelProvider provider,
  ) {
    return call(
      initialRange: provider.initialRange,
      maxRange: provider.maxRange,
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
  String? get name => r'chargingSessionRequestViewModelProvider';
}

/// See also [chargingSessionRequestViewModel].
class ChargingSessionRequestViewModelProvider
    extends AutoDisposeProvider<ChargingSessionRequestViewModel> {
  /// See also [chargingSessionRequestViewModel].
  ChargingSessionRequestViewModelProvider({
    required double initialRange,
    required double maxRange,
  }) : this._internal(
          (ref) => chargingSessionRequestViewModel(
            ref as ChargingSessionRequestViewModelRef,
            initialRange: initialRange,
            maxRange: maxRange,
          ),
          from: chargingSessionRequestViewModelProvider,
          name: r'chargingSessionRequestViewModelProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$chargingSessionRequestViewModelHash,
          dependencies: ChargingSessionRequestViewModelFamily._dependencies,
          allTransitiveDependencies:
              ChargingSessionRequestViewModelFamily._allTransitiveDependencies,
          initialRange: initialRange,
          maxRange: maxRange,
        );

  ChargingSessionRequestViewModelProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.initialRange,
    required this.maxRange,
  }) : super.internal();

  final double initialRange;
  final double maxRange;

  @override
  Override overrideWith(
    ChargingSessionRequestViewModel Function(
            ChargingSessionRequestViewModelRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ChargingSessionRequestViewModelProvider._internal(
        (ref) => create(ref as ChargingSessionRequestViewModelRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        initialRange: initialRange,
        maxRange: maxRange,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<ChargingSessionRequestViewModel> createElement() {
    return _ChargingSessionRequestViewModelProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ChargingSessionRequestViewModelProvider &&
        other.initialRange == initialRange &&
        other.maxRange == maxRange;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, initialRange.hashCode);
    hash = _SystemHash.combine(hash, maxRange.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ChargingSessionRequestViewModelRef
    on AutoDisposeProviderRef<ChargingSessionRequestViewModel> {
  /// The parameter `initialRange` of this provider.
  double get initialRange;

  /// The parameter `maxRange` of this provider.
  double get maxRange;
}

class _ChargingSessionRequestViewModelProviderElement
    extends AutoDisposeProviderElement<ChargingSessionRequestViewModel>
    with ChargingSessionRequestViewModelRef {
  _ChargingSessionRequestViewModelProviderElement(super.provider);

  @override
  double get initialRange =>
      (origin as ChargingSessionRequestViewModelProvider).initialRange;
  @override
  double get maxRange =>
      (origin as ChargingSessionRequestViewModelProvider).maxRange;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
