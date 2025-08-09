import 'package:audio_service/audio_service.dart';
import 'package:flutter/material.dart';
import 'package:outline_aerial_client/pages/home_page.dart';
import 'package:outline_aerial_client/widgets/play_widget.dart';
import 'package:outline_aerial_client/services/stream_service.dart';

void main() async {
  var audio = await AudioService.init(
    builder: () => StreamService(
      streamUriWebSocket: Uri.parse("ws://192.168.31.148:8765"),
    ),
  );
  await audio.play();
  var item = MediaItem(id: "测试123", title: "测试123");
  await audio.playMediaItem(item);

  runApp(const MainApp());
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
