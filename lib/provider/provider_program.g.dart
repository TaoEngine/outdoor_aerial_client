// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'provider_program.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// 节目列表流

@ProviderFor(Programs)
const programsProvider = ProgramsFamily._();

/// 节目列表流
final class ProgramsProvider
    extends $StreamNotifierProvider<Programs, List<Program>> {
  /// 节目列表流
  const ProgramsProvider._({
    required ProgramsFamily super.from,
    required ({
      ProgramLocalService localService,
      ProgramRemoteService remoteService,
    })
    super.argument,
  }) : super(
         retry: null,
         name: r'programsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$programsHash();

  @override
  String toString() {
    return r'programsProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  Programs create() => Programs();

  @override
  bool operator ==(Object other) {
    return other is ProgramsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$programsHash() => r'd34ebe5bad9c2fa968fff748f696d319917309f5';

/// 节目列表流

final class ProgramsFamily extends $Family
    with
        $ClassFamilyOverride<
          Programs,
          AsyncValue<List<Program>>,
          List<Program>,
          Stream<List<Program>>,
          ({
            ProgramLocalService localService,
            ProgramRemoteService remoteService,
          })
        > {
  const ProgramsFamily._()
    : super(
        retry: null,
        name: r'programsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// 节目列表流

  ProgramsProvider call({
    required ProgramLocalService localService,
    required ProgramRemoteService remoteService,
  }) => ProgramsProvider._(
    argument: (localService: localService, remoteService: remoteService),
    from: this,
  );

  @override
  String toString() => r'programsProvider';
}

/// 节目列表流

abstract class _$Programs extends $StreamNotifier<List<Program>> {
  late final _$args =
      ref.$arg
          as ({
            ProgramLocalService localService,
            ProgramRemoteService remoteService,
          });
  ProgramLocalService get localService => _$args.localService;
  ProgramRemoteService get remoteService => _$args.remoteService;

  Stream<List<Program>> build({
    required ProgramLocalService localService,
    required ProgramRemoteService remoteService,
  });
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(
      localService: _$args.localService,
      remoteService: _$args.remoteService,
    );
    final ref = this.ref as $Ref<AsyncValue<List<Program>>, List<Program>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<Program>>, List<Program>>,
              AsyncValue<List<Program>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
