// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'provider_station.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// 广播电台列表流

@ProviderFor(Stations)
const stationsProvider = StationsFamily._();

/// 广播电台列表流
final class StationsProvider
    extends $StreamNotifierProvider<Stations, List<RadioStation>> {
  /// 广播电台列表流
  const StationsProvider._({
    required StationsFamily super.from,
    required ({
      RadioStationLocalService localService,
      RadioStationRemoteService remoteService,
    })
    super.argument,
  }) : super(
         retry: null,
         name: r'stationsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$stationsHash();

  @override
  String toString() {
    return r'stationsProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  Stations create() => Stations();

  @override
  bool operator ==(Object other) {
    return other is StationsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$stationsHash() => r'56447b1a129e66f6eb7c3c92283bf2afd13173d9';

/// 广播电台列表流

final class StationsFamily extends $Family
    with
        $ClassFamilyOverride<
          Stations,
          AsyncValue<List<RadioStation>>,
          List<RadioStation>,
          Stream<List<RadioStation>>,
          ({
            RadioStationLocalService localService,
            RadioStationRemoteService remoteService,
          })
        > {
  const StationsFamily._()
    : super(
        retry: null,
        name: r'stationsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// 广播电台列表流

  StationsProvider call({
    required RadioStationLocalService localService,
    required RadioStationRemoteService remoteService,
  }) => StationsProvider._(
    argument: (localService: localService, remoteService: remoteService),
    from: this,
  );

  @override
  String toString() => r'stationsProvider';
}

/// 广播电台列表流

abstract class _$Stations extends $StreamNotifier<List<RadioStation>> {
  late final _$args =
      ref.$arg
          as ({
            RadioStationLocalService localService,
            RadioStationRemoteService remoteService,
          });
  RadioStationLocalService get localService => _$args.localService;
  RadioStationRemoteService get remoteService => _$args.remoteService;

  Stream<List<RadioStation>> build({
    required RadioStationLocalService localService,
    required RadioStationRemoteService remoteService,
  });
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(
      localService: _$args.localService,
      remoteService: _$args.remoteService,
    );
    final ref =
        this.ref as $Ref<AsyncValue<List<RadioStation>>, List<RadioStation>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<RadioStation>>, List<RadioStation>>,
              AsyncValue<List<RadioStation>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
