import 'dart:async';
import 'dart:typed_data';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_soloud/flutter_soloud.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class StreamNotifier extends AsyncNotifier<bool> {
  AudioSource? _audioSource;
  SoundHandle? _soundHandle;
  WebSocketChannel? _channel;
  StreamSubscription? _subscription;

  @override
  FutureOr<bool> build() {
    ref.onDispose(() {
      stopStream();
    });
    return false;
  }

  Future<void> startStream(Uri uri) async {
    if (state.value == true) return;

    state = const AsyncValue.loading();

    try {
      if (!SoLoud.instance.isInitialized) {
        await SoLoud.instance.init();
      }

      _audioSource = SoLoud.instance.setBufferStream(
        bufferingType: BufferingType.released,
        bufferingTimeNeeds: 0.1, // 稍微增加一点缓冲时间以减少卡顿
        sampleRate: 44100,
        channels: Channels.mono,
        format: BufferType.s16le,
      );

      _soundHandle = await SoLoud.instance.play(_audioSource!);

      _channel = WebSocketChannel.connect(uri);
      
      _subscription = _channel!.stream.listen(
        (data) {
          if (data is List<int>) {
            final uint8List = data is Uint8List ? data : Uint8List.fromList(data);
            SoLoud.instance.addAudioDataStream(_audioSource!, uint8List);
            
            // 简单的缓冲管理逻辑
            final bufferSize = SoLoud.instance.getBufferSize(_audioSource!);
            if (bufferSize < 65536) {
              SoLoud.instance.setPause(_soundHandle!, true);
            } else {
              SoLoud.instance.setPause(_soundHandle!, false);
            }
          }
        },
        onError: (error) {
          state = AsyncValue.error(error, StackTrace.current);
          stopStream();
        },
        onDone: () {
          stopStream();
        },
      );

      state = const AsyncValue.data(true);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
      stopStream();
    }
  }

  Future<void> stopStream() async {
    _subscription?.cancel();
    _subscription = null;
    
    _channel?.sink.close();
    _channel = null;

    if (_soundHandle != null) {
      await SoLoud.instance.stop(_soundHandle!);
      _soundHandle = null;
    }

    if (_audioSource != null) {
      // SoLoud 目前没有显式的 dispose AudioSource 的方法，
      // 但停止 handle 后通常就够了。
      _audioSource = null;
    }

    state = const AsyncValue.data(false);
  }

  Future<void> toggleStream(Uri uri) async {
    if (state.value == true) {
      await stopStream();
    } else {
      await startStream(uri);
    }
  }
}

final streamProvider = AsyncNotifierProvider<StreamNotifier, bool>(() {
  return StreamNotifier();
});
