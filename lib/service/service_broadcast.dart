import 'dart:async';
import 'dart:typed_data';

import 'package:flutter_soloud/flutter_soloud.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class BroadcastService {
  /// Outdoor Aerial 的服务器地址
  final String address;

  /// 是否启用 Wss 安全访问
  final bool isWss;

  /// 广播音频播放服务
  BroadcastService({required this.address, this.isWss = false});

  /// 指定的地址去执行取流任务
  static const path = 'broadcast';

  /// SoLoud 相关接口
  AudioSource? _stream;

  /// SoLoud 音频控制器
  SoundHandle? _handle;

  /// WebSocket 相关接口
  WebSocketChannel? _channel;

  /// 推流相关服务订阅
  StreamSubscription? _subscription;

  /// 从 Outdoor Aerial 服务器中取流
  Future<void> broadcast() async {
    if (!SoLoud.instance.isInitialized) {
      await SoLoud.instance.init();
    }

    // 计算 bufferingTimeNeeds based on streamMaxBuffer
    // bytes per second = sampleRate * channels * bytesPerSample
    // s16le = 2 bytes
    int bytesPerSample = 2;
    int channels = 2;
    double bytesPerSecond = (44100 * channels * bytesPerSample)
        .toDouble();
    double bufferingTime = 65536 / bytesPerSecond;

    // 确保 bufferingTime 至少有一些值，避免为 0 导致问题，虽然 0 也是允许的
    if (bufferingTime < 0.1) bufferingTime = 0.1;
    try {
      _stream = SoLoud.instance.setBufferStream(
        bufferingType: .released,
        channels: Channels.stereo,
        format: BufferType.s16le,
        bufferingTimeNeeds: bufferingTime,
        sampleRate: 44100,
      );
    } catch (e) {
      rethrow;
    }

    try {
      _channel = WebSocketChannel.connect(switch (isWss) {
        false => Uri(scheme: 'ws', host: address, port: 8908, path: path),
        true => Uri(scheme: 'ws', host: address, port: 8908, path: path),
      });
      await _channel?.ready;
    } catch (e) {
      rethrow;
    }

    _handle = await SoLoud.instance.play(_stream!);

    _subscription = _channel?.stream.listen((message) {
      if (message is List<int>) {
        final data = Uint8List.fromList(message);
        if (_stream != null) {
          SoLoud.instance.addAudioDataStream(_stream!, data);
        }
      }
    });
  }

  /// 终止取流操作并销毁当前服务
  Future<void> dispose() async {
    await _subscription?.cancel();
    _subscription = null;

    await _channel?.sink.close();
    _channel = null;

    if (_handle != null) {
      await SoLoud.instance.stop(_handle!);
      _handle = null;
    }

    if (_stream != null) {
      await SoLoud.instance.disposeSource(_stream!);
      _stream = null;
    }
  }

  /// 对广播音频进行静音（不影响推流播放）
  void setMute(bool mute) {
    if (_handle != null) {
      if (mute) {
        SoLoud.instance.setVolume(_handle!, 0);
      } else {
        SoLoud.instance.setVolume(_handle!, 1);
      }
    }
  }
}
