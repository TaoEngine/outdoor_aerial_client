// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'provider_database.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// 数据库连接的 Provider

@ProviderFor(isarDatabase)
const isarDatabaseProvider = IsarDatabaseProvider._();

/// 数据库连接的 Provider

final class IsarDatabaseProvider
    extends $FunctionalProvider<AsyncValue<Isar>, Isar, FutureOr<Isar>>
    with $FutureModifier<Isar>, $FutureProvider<Isar> {
  /// 数据库连接的 Provider
  const IsarDatabaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'isarDatabaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$isarDatabaseHash();

  @$internal
  @override
  $FutureProviderElement<Isar> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<Isar> create(Ref ref) {
    return isarDatabase(ref);
  }
}

String _$isarDatabaseHash() => r'a1c3223cf424ce8d7c7b9ddc4dc8797146a9df27';
