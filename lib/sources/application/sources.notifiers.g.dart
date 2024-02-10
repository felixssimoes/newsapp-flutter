// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sources.notifiers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$allSourcesHash() => r'423aa0f3311f6cff0c909d4bc45e0f0bbce7ea16';

/// See also [allSources].
@ProviderFor(allSources)
final allSourcesProvider = FutureProvider<List<Source>>.internal(
  allSources,
  name: r'allSourcesProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$allSourcesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AllSourcesRef = FutureProviderRef<List<Source>>;
String _$categorySourcesHash() => r'7e754b59b54397a557c9bc778c2fd44a1fac0bc2';

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

/// See also [categorySources].
@ProviderFor(categorySources)
const categorySourcesProvider = CategorySourcesFamily();

/// See also [categorySources].
class CategorySourcesFamily extends Family<AsyncValue<List<Source>>> {
  /// See also [categorySources].
  const CategorySourcesFamily();

  /// See also [categorySources].
  CategorySourcesProvider call({
    required String category,
  }) {
    return CategorySourcesProvider(
      category: category,
    );
  }

  @override
  CategorySourcesProvider getProviderOverride(
    covariant CategorySourcesProvider provider,
  ) {
    return call(
      category: provider.category,
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
  String? get name => r'categorySourcesProvider';
}

/// See also [categorySources].
class CategorySourcesProvider extends FutureProvider<List<Source>> {
  /// See also [categorySources].
  CategorySourcesProvider({
    required String category,
  }) : this._internal(
          (ref) => categorySources(
            ref as CategorySourcesRef,
            category: category,
          ),
          from: categorySourcesProvider,
          name: r'categorySourcesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$categorySourcesHash,
          dependencies: CategorySourcesFamily._dependencies,
          allTransitiveDependencies:
              CategorySourcesFamily._allTransitiveDependencies,
          category: category,
        );

  CategorySourcesProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.category,
  }) : super.internal();

  final String category;

  @override
  Override overrideWith(
    FutureOr<List<Source>> Function(CategorySourcesRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CategorySourcesProvider._internal(
        (ref) => create(ref as CategorySourcesRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        category: category,
      ),
    );
  }

  @override
  FutureProviderElement<List<Source>> createElement() {
    return _CategorySourcesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CategorySourcesProvider && other.category == category;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, category.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin CategorySourcesRef on FutureProviderRef<List<Source>> {
  /// The parameter `category` of this provider.
  String get category;
}

class _CategorySourcesProviderElement
    extends FutureProviderElement<List<Source>> with CategorySourcesRef {
  _CategorySourcesProviderElement(super.provider);

  @override
  String get category => (origin as CategorySourcesProvider).category;
}

String _$followedSourcesHash() => r'3640779bc3a07288127c3476835a1a4bb7891aca';

/// See also [followedSources].
@ProviderFor(followedSources)
final followedSourcesProvider = FutureProvider<List<String>>.internal(
  followedSources,
  name: r'followedSourcesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$followedSourcesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FollowedSourcesRef = FutureProviderRef<List<String>>;
String _$isFollowingSourceHash() => r'd515d17604a981b601d323cb8b8f85bb4fae0bfe';

/// See also [isFollowingSource].
@ProviderFor(isFollowingSource)
const isFollowingSourceProvider = IsFollowingSourceFamily();

/// See also [isFollowingSource].
class IsFollowingSourceFamily extends Family<AsyncValue<bool>> {
  /// See also [isFollowingSource].
  const IsFollowingSourceFamily();

  /// See also [isFollowingSource].
  IsFollowingSourceProvider call({
    required String sourceId,
  }) {
    return IsFollowingSourceProvider(
      sourceId: sourceId,
    );
  }

  @override
  IsFollowingSourceProvider getProviderOverride(
    covariant IsFollowingSourceProvider provider,
  ) {
    return call(
      sourceId: provider.sourceId,
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
  String? get name => r'isFollowingSourceProvider';
}

/// See also [isFollowingSource].
class IsFollowingSourceProvider extends FutureProvider<bool> {
  /// See also [isFollowingSource].
  IsFollowingSourceProvider({
    required String sourceId,
  }) : this._internal(
          (ref) => isFollowingSource(
            ref as IsFollowingSourceRef,
            sourceId: sourceId,
          ),
          from: isFollowingSourceProvider,
          name: r'isFollowingSourceProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$isFollowingSourceHash,
          dependencies: IsFollowingSourceFamily._dependencies,
          allTransitiveDependencies:
              IsFollowingSourceFamily._allTransitiveDependencies,
          sourceId: sourceId,
        );

  IsFollowingSourceProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.sourceId,
  }) : super.internal();

  final String sourceId;

  @override
  Override overrideWith(
    FutureOr<bool> Function(IsFollowingSourceRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: IsFollowingSourceProvider._internal(
        (ref) => create(ref as IsFollowingSourceRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        sourceId: sourceId,
      ),
    );
  }

  @override
  FutureProviderElement<bool> createElement() {
    return _IsFollowingSourceProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is IsFollowingSourceProvider && other.sourceId == sourceId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, sourceId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin IsFollowingSourceRef on FutureProviderRef<bool> {
  /// The parameter `sourceId` of this provider.
  String get sourceId;
}

class _IsFollowingSourceProviderElement extends FutureProviderElement<bool>
    with IsFollowingSourceRef {
  _IsFollowingSourceProviderElement(super.provider);

  @override
  String get sourceId => (origin as IsFollowingSourceProvider).sourceId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
