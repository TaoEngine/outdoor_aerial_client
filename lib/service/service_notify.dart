import 'package:audio_service/audio_service.dart';

class BroadcastNotifyService extends BaseAudioHandler {
  Function? toggleMute;

  BroadcastNotifyService() {
    playbackState.add(
      playbackState.value.copyWith(
        controls: const [.skipToPrevious, .skipToNext],
        systemActions: const {.playPause},
        processingState: .loading,
        playing: true,
      ),
    );
  }

  void updateBroadcastData({required String title}) {
    mediaItem.add(MediaItem(id: 'broadcasting', title: title));
  }

  void updateState({required bool isPlaying, bool isBuffering = false}) {
    playbackState.add(
      playbackState.value.copyWith(
        controls: [
          isPlaying ? MediaControl.pause : MediaControl.play,
          MediaControl.stop,
        ],
        // 这里的索引对应 controls 列表
        androidCompactActionIndices: const [0, 1],
        playing: isPlaying,
        processingState: isBuffering
            ? AudioProcessingState.buffering
            : AudioProcessingState.ready,
      ),
    );
  }

  @override
  Future<void> pause() {
    toggleMute;
    return super.pause();
  }

  @override
  Future<void> skipToNext() {
    print('点右边了');
    mediaItem.add(MediaItem(id: 'broadcasting', title: '点了右边'));
    // TODO: implement skipToNext
    return super.skipToNext();
  }

  @override
  Future<void> skipToPrevious() {
    print('点左边了');
    mediaItem.add(
      MediaItem(
        id: 'broadcasting',
        title: '林海雪原',
        album: '',
        artist: '安徽交通广播 | 聆听经典',
        genre: '',
        displayDescription: '123',
        isLive: true,
      ),
    );
    playbackState.add(
      playbackState.value.copyWith(
        controls: const [.skipToPrevious, .skipToNext],
        systemActions: const {.pause},
        processingState: .buffering,
        playing: true,
      ),
    );
    // TODO: implement skipToPrevious
    return super.skipToPrevious();
  }
}
