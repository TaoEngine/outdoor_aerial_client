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
    extends $NotifierProvider<BroadcastPrograms, List<TodayBroadcastProgram>> {
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
  Override overrideWithValue(List<TodayBroadcastProgram> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<TodayBroadcastProgram>>(value),
    );
  }
}

String _$broadcastProgramsHash() => r'c6c66c08ba57bd5964f6e38884e660c18ef68047';

abstract class _$BroadcastPrograms
    extends $Notifier<List<TodayBroadcastProgram>> {
  List<TodayBroadcastProgram> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref
            as $Ref<List<TodayBroadcastProgram>, List<TodayBroadcastProgram>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                List<TodayBroadcastProgram>,
                List<TodayBroadcastProgram>
              >,
              List<TodayBroadcastProgram>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
