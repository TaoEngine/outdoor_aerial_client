import 'package:audio_service/audio_service.dart';

/// 音频取流播放服务
///
/// 它会从 Outdoor Aerial 中拉取 WebSockets 音频流并播放
/// 如果拉取的是Opus流还会对其进行解码
/// 此外它还有负责音频通知展示的功能
class StreamService extends BaseAudioHandler {}
