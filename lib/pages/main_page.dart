import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

class MainNavigation extends StatelessWidget {
  const MainNavigation({super.key});

  static const Map<String, IconData> _mainNavigationUnit = {
    "调谐器": TablerIcons.antenna,
    "节目单": TablerIcons.timeline_event_text,
    "我喜欢": TablerIcons.heart,
    "改设置": TablerIcons.settings,
  };

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      destinations: _mainNavigationUnit.entries
          .map(
            (entry) => NavigationDestination(
              icon: Icon(entry.value),
              label: entry.key,
            ),
          )
          .toList(),
    );
  }
}

