import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

class MobileMain extends StatefulWidget {
  const MobileMain({super.key});

  @override
  State<MobileMain> createState() => _MobileMainState();
}

class _MobileMainState extends State<MobileMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        destinations: const [
          NavigationDestination(icon: Icon(TablerIcons.antenna), label: "调谐器"),
          NavigationDestination(icon: Icon(TablerIcons.heart), label: "我喜欢"),
          NavigationDestination(icon: Icon(TablerIcons.timeline_event_text), label: "节目单"),
          NavigationDestination(icon: Icon(TablerIcons.settings), label: "改设置"),
        ],
      ),
    );
  }
}
