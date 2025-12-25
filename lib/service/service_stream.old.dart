import 'package:flutter_soloud/flutter_soloud.dart';

/// 音频取流播放服务
///
/// 它会从 Outdoor Aerial 中拉取 WebSockets 音频流并播放
/// 如果拉取的是Opus流还会对其进行解码
/// 此外它还有负责音频通知展示的功能
class StreamService {
  /// 关于推流的一些设置
  AudioSource? streamSetting;

  /// 音频控制器
  SoundHandle? streamHandle;

  /// 音频取流播放服务
  ///
  /// 相关参数
  /// - [streamUriWebSocket] 取流地址，采用WebSocket协议
  /// - [streamFormat] 取样深度以及音频协议
  /// - [streamChannel] 取样音频的声道数
  /// - [streamSampleRate] 取样音频的采样率
  /// - [streamMaxBuffer] 为取样音频预留的最小空间
  StreamService({
    required Uri streamUriWebSocket,
    BufferType streamFormat = BufferType.s16le,
    Channels streamChannel = Channels.mono,
    int streamSampleRate = 44100,
    int streamMaxBuffer = 65536,
  }) {
    if (!SoLoud.instance.isInitialized) {
      SoLoud.instance.init();
    }
    streamSetting = SoLoud.instance.setBufferStream(
      bufferingType: BufferingType.released,
      bufferingTimeNeeds: 0,
      sampleRate: streamSampleRate,
      channels: streamChannel,
      format: streamFormat,
    );
  }
}

// void test123() async {
//   final socket = await WebSocket.connect(Uri.parse("ws://192.168.31.148:8765"));

//   final stream = SoLoud.instance.setBufferStream(
//     bufferingType: BufferingType.released,
//     channels: Channels.stereo,
//     format: BufferType.s16le,
//     bufferingTimeNeeds: 0.010,
//     sampleRate: 44100,
//     onBuffering: (isBuffering, handle, time) {
//       // 监控缓冲状态
//       if (isBuffering) {
//         print('Buffering... time: $time');
//       }
//     },
//   );

//   final SoundHandle handle = await SoLoud.instance.play(stream);

//   socket.events.listen((e) async {
//     switch (e) {
//       case TextDataReceived(text: final text):
//         print('Received Text: $text');

//       case BinaryDataReceived(data: final data):
//         SoLoud.instance.addAudioDataStream(stream, data);
//         if (SoLoud.instance.getBufferSize(stream) < 65536) {
//           SoLoud.instance.setPause(handle, true);
//         } else {
//           SoLoud.instance.setPause(handle, false);
//         }

//       case CloseReceived(code: final code, reason: final reason):
//         await SoLoud.instance.stop(handle);
//         print('Connection to server closed: $code [$reason]');
//     }
//   });
// }
