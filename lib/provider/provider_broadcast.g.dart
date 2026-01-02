// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'provider_broadcast.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(Broadcast)
const broadcastProvider = BroadcastProvider._();

final class BroadcastProvider extends $NotifierProvider<Broadcast, bool> {
  const BroadcastProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'broadcastProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$broadcastHash();

  @$internal
  @override
  Broadcast create() => Broadcast();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$broadcastHash() => r'523009edf189f50c56e9c0d4b176144dbfbdbeca';

abstract class _$Broadcast extends $Notifier<bool> {
  bool build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<bool, bool>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<bool, bool>,
              bool,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
