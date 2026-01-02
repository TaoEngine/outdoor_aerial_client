import 'package:outdoor_aerial_client/service/service_broadcast.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'provider_broadcast.g.dart';

@riverpod
class Broadcast extends _$Broadcast {
  late final BroadcastService _service;

  @override
  bool build() {
    _service = BroadcastService(address: '127.0.0.1');

    // 销毁服务绑定
    ref.onDispose(_service.dispose);

    _service.broadcast();
    return false;
  }

  // 操作静音
  void toggleMute() {
    state = !state;
    _service.setMute(state);
  }
}
