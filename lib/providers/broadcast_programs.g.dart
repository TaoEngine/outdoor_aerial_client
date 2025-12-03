// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'broadcast_programs.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(BroadcastPrograms)
const broadcastProgramsProvider = BroadcastProgramsProvider._();

final class BroadcastProgramsProvider
    extends $NotifierProvider<BroadcastPrograms, List<BroadcastProgram>> {
  const BroadcastProgramsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'broadcastProgramsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$broadcastProgramsHash();

  @$internal
  @override
  BroadcastPrograms create() => BroadcastPrograms();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<BroadcastProgram> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<BroadcastProgram>>(value),
    );
  }
}

String _$broadcastProgramsHash() => r'10f364da12c9a52fc386d32589b4818e9e46d019';

abstract class _$BroadcastPrograms extends $Notifier<List<BroadcastProgram>> {
  List<BroadcastProgram> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref as $Ref<List<BroadcastProgram>, List<BroadcastProgram>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<List<BroadcastProgram>, List<BroadcastProgram>>,
              List<BroadcastProgram>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
