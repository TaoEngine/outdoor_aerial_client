// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'provider_broadcast.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(Broadcast)
const broadcastProvider = BroadcastProvider._();

final class BroadcastProvider extends $NotifierProvider<Broadcast, void> {
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
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }
}

String _$broadcastHash() => r'd30113eca9c950c9b693a4a1e4493cda6c32d429';

abstract class _$Broadcast extends $Notifier<void> {
  void build();
  @$mustCallSuper
  @override
  void runBuild() {
    build();
    final ref = this.ref as $Ref<void, void>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<void, void>,
              void,
              Object?,
              Object?
            >;
    element.handleValue(ref, null);
  }
}
