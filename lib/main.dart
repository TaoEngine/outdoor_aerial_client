import 'package:flutter/material.dart';
import 'package:flutter_soloud/flutter_soloud.dart';
import 'package:outline_aerial_client/pages/home.dart';
import 'package:outline_aerial_client/pages/play.dart';
import 'package:web_socket/web_socket.dart';

void main() async {
  // if (!SoLoud.instance.isInitialized) {
  //   SoLoud.instance.init();
  // }
  // test123();
  runApp(const MainApp());
}

void test123() async {
  final socket = await WebSocket.connect(Uri.parse("ws://192.168.31.148:8765"));

  final stream = SoLoud.instance.setBufferStream(
    bufferingType: BufferingType.released,
    channels: Channels.stereo,
    format: BufferType.s16le,
    bufferingTimeNeeds: 0.010,
    sampleRate: 44100,
    onBuffering: (isBuffering, handle, time) {
      // 监控缓冲状态
      if (isBuffering) {
        print('Buffering... time: $time');
      }
    },
  );

  final SoundHandle handle = await SoLoud.instance.play(stream);

  socket.events.listen((e) async {
    switch (e) {
      case TextDataReceived(text: final text):
        print('Received Text: $text');

      case BinaryDataReceived(data: final data):
        SoLoud.instance.addAudioDataStream(stream, data);
        if (SoLoud.instance.getBufferSize(stream) < 65536) {
          SoLoud.instance.setPause(handle, true);
        } else {
          SoLoud.instance.setPause(handle, false);
        }

      case CloseReceived(code: final code, reason: final reason):
        await SoLoud.instance.stop(handle);
        print('Connection to server closed: $code [$reason]');
    }
  });
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: "室外天线", home: MainPage());
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return HomeNavigation(
      child: PlayStreamMobile(
        programName: '节目名称',
        programTitle: '节目口号',
        programHost: '节目主持人',
        programBroadcasting: '节目所属广播电台',
        programDate: [],
        programTime: DateTimeRange(
          start: DateTime.now().copyWith(
            month: 8,
            day: 8,
            hour: 12,
            minute: 00,
            second: 00,
          ),
          end: DateTime.now().copyWith(
            month: 8,
            day: 8,
            hour: 14,
            minute: 00,
            second: 00,
          ),
        ),
        onTimeReached: () => print("时间到了"),
      ),
    );
  }
}
