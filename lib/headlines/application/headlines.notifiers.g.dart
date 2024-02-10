// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'headlines.notifiers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$categoryTopHeadlinesHash() =>
    r'dacf0f75ea03871f8f31e55c0cecba36cd30f098';

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

/// See also [categoryTopHeadlines].
@ProviderFor(categoryTopHeadlines)
const categoryTopHeadlinesProvider = CategoryTopHeadlinesFamily();

/// See also [categoryTopHeadlines].
class CategoryTopHeadlinesFamily extends Family<AsyncValue<List<Article>>> {
  /// See also [categoryTopHeadlines].
  const CategoryTopHeadlinesFamily();

  /// See also [categoryTopHeadlines].
  CategoryTopHeadlinesProvider call({
    required String category,
  }) {
    return CategoryTopHeadlinesProvider(
      category: category,
    );
  }

  @override
  CategoryTopHeadlinesProvider getProviderOverride(
    covariant CategoryTopHeadlinesProvider provider,
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
  String? get name => r'categoryTopHeadlinesProvider';
}

/// See also [categoryTopHeadlines].
class CategoryTopHeadlinesProvider extends FutureProvider<List<Article>> {
  /// See also [categoryTopHeadlines].
  CategoryTopHeadlinesProvider({
    required String category,
  }) : this._internal(
          (ref) => categoryTopHeadlines(
            ref as CategoryTopHeadlinesRef,
            category: category,
          ),
          from: categoryTopHeadlinesProvider,
          name: r'categoryTopHeadlinesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$categoryTopHeadlinesHash,
          dependencies: CategoryTopHeadlinesFamily._dependencies,
          allTransitiveDependencies:
              CategoryTopHeadlinesFamily._allTransitiveDependencies,
          category: category,
        );

  CategoryTopHeadlinesProvider._internal(
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
    FutureOr<List<Article>> Function(CategoryTopHeadlinesRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CategoryTopHeadlinesProvider._internal(
        (ref) => create(ref as CategoryTopHeadlinesRef),
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
  FutureProviderElement<List<Article>> createElement() {
    return _CategoryTopHeadlinesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CategoryTopHeadlinesProvider && other.category == category;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, category.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin CategoryTopHeadlinesRef on FutureProviderRef<List<Article>> {
  /// The parameter `category` of this provider.
  String get category;
}

class _CategoryTopHeadlinesProviderElement
    extends FutureProviderElement<List<Article>> with CategoryTopHeadlinesRef {
  _CategoryTopHeadlinesProviderElement(super.provider);

  @override
  String get category => (origin as CategoryTopHeadlinesProvider).category;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
