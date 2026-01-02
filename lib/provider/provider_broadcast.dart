import 'package:outdoor_aerial_client/service/service_broadcast.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'provider_broadcast.g.dart';

@riverpod
class Broadcast extends _$Broadcast {
  late final BroadcastService _service;

  @override
  void build() async {
    _service = BroadcastService(address: '127.0.0.1');

    // 销毁服务绑定
    ref.onDispose(_service.dispose);

    await _service.broadcast();
  }

  // 操作静音
  void toggleMute() => _service.toggleMute();

  // 是否静音
  bool get isMuted => _service.isMuted;
}
