import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter_soloud/flutter_soloud.dart';

/// 音频取流播放服务
///
/// 它会从 Outdoor Aerial Server 中拉取 WebSockets 音频流并播放
class BroadcastStreamOldService {
  /// 关于推流的一些设置
  AudioSource? streamSetting;

  /// 音频控制器
  SoundHandle? streamHandle;

  /// WebSocket 连接
  WebSocket? _socket;

  /// WebSocket 订阅
  StreamSubscription? _socketSubscription;

  /// 取流地址
  final Uri streamUriWebSocket;

  /// 取样深度以及音频协议
  final BufferType streamFormat;

  /// 取样音频的声道数
  final Channels streamChannel;

  /// 取样音频的采样率
  final int streamSampleRate;

  /// 为取样音频预留的最小空间 (bytes)
  final int streamMaxBuffer;

  /// 是否静音
  bool _isMuted = false;

  /// 获取当前静音状态
  bool get isMuted => _isMuted;

  /// 音频取流播放服务
  ///
  /// 相关参数
  /// - [streamUriWebSocket] 取流地址，采用WebSocket协议
  /// - [streamFormat] 取样深度以及音频协议
  /// - [streamChannel] 取样音频的声道数
  /// - [streamSampleRate] 取样音频的采样率
  /// - [streamMaxBuffer] 为取样音频预留的最小空间
  BroadcastStreamOldService({
    required this.streamUriWebSocket,
    this.streamFormat = BufferType.s16le,
    this.streamChannel = Channels.stereo,
    this.streamSampleRate = 44100,
    this.streamMaxBuffer = 65536,
  });

  /// 初始化并开始播放
  Future<void> start() async {
    // 1. 初始化 SoLoud
    if (!SoLoud.instance.isInitialized) {
      await SoLoud.instance.init();
    }

    // 2. 设置音频流
    // 计算 bufferingTimeNeeds based on streamMaxBuffer
    // bytes per second = sampleRate * channels * bytesPerSample
    // s16le = 2 bytes
    int bytesPerSample = 2; 
    int channels = streamChannel == Channels.stereo ? 2 : 1;
    double bytesPerSecond = (streamSampleRate * channels * bytesPerSample).toDouble();
    double bufferingTime = streamMaxBuffer / bytesPerSecond;

    // 确保 bufferingTime 至少有一些值，避免为 0 导致问题，虽然 0 也是允许的
    if (bufferingTime < 0.1) bufferingTime = 0.1;

    try {
      streamSetting = SoLoud.instance.setBufferStream(
        bufferingType: BufferingType.released,
        bufferingTimeNeeds: bufferingTime, 
        sampleRate: streamSampleRate,
        channels: streamChannel,
        format: streamFormat,
      );

      // 3. 连接 WebSocket
      print('Connecting to WebSocket: $streamUriWebSocket');
      _socket = await WebSocket.connect(streamUriWebSocket.toString());
      print('Connected to WebSocket');

      // 4. 开始播放 (SoLoud 会等待缓冲)
      streamHandle = await SoLoud.instance.play(streamSetting!);

      // 如果当前是静音状态，设置音量为 0
      if (_isMuted) {
        SoLoud.instance.setVolume(streamHandle!, 0);
      }

      // 5. 监听数据
      _socketSubscription = _socket!.listen(
        (message) {
          if (message is List<int>) {
            final data = Uint8List.fromList(message);
            if (streamSetting != null) {
              SoLoud.instance.addAudioDataStream(streamSetting!, data);
            }
          }
        },
        onDone: () {
          print('WebSocket connection closed');
          stop();
        },
        onError: (error) {
          print('WebSocket error: $error');
          stop();
        },
      );
    } catch (e) {
      print('Error starting stream service: $e');
      await stop();
    }
  }

  /// 停止播放并释放资源
  Future<void> stop() async {
    await _socketSubscription?.cancel();
    _socketSubscription = null;
    
    await _socket?.close();
    _socket = null;

    if (streamHandle != null) {
      await SoLoud.instance.stop(streamHandle!);
      streamHandle = null;
    }

    if (streamSetting != null) {
      try {
        await SoLoud.instance.disposeSource(streamSetting!);
      } catch (e) {
        print('Error disposing source: $e');
      }
      streamSetting = null;
    }
  }

  /// 设置静音状态
  void setMute(bool mute) {
    _isMuted = mute;
    if (streamHandle != null) {
      SoLoud.instance.setVolume(streamHandle!, mute ? 0 : 1);
    }
  }
}
