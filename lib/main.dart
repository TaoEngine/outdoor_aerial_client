import 'package:audio_service/audio_service.dart';
import 'package:flutter/material.dart';
import 'package:outline_aerial_client/widgets/main_navigation_widget.dart';
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
    return MainNavigation(
      tunerPage: Container(),
      playlistPage: Container(),
      favoritePage: Container(),
      settingsPage: Container(),
    );
  }
}
