import 'package:audio_service/audio_service.dart';
import 'package:outdoor_aerial_client/service/service_broadcast.dart';
import 'package:outdoor_aerial_client/service/service_notify.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'provider_broadcast.g.dart';

@riverpod
class Broadcast extends _$Broadcast {
  late final BroadcastService _broadcast;

  late final BroadcastNotifyService _notify;

  @override
  bool build() {
    _broadcast = BroadcastService(address: '192.168.137.1')..broadcast();

    // 音乐通知服务
    _notify = BroadcastNotifyService()
      ..toggleMute = () {
        toggleMute();
      }
      ..updateBroadcastData(title: '无信号')
      ..updateState(isPlaying: true, isBuffering: true);

    // 销毁服务绑定
    ref.onDispose(() {
      _broadcast.dispose();
      _notify.playbackState.add(
        _notify.playbackState.value.copyWith(
          playing: false,
          processingState: AudioProcessingState.idle,
        ),
      );
    });

    return false;
  }

  // 操作静音
  void toggleMute() {
    state = !state;
    _broadcast.setMute(state);
    _notify.updateState(isPlaying: !state);
  }
}
