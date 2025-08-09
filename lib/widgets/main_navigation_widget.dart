import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

class MainNavigation extends StatefulWidget {
  /// “调谐器”界面
  final Widget tunerPage;

  /// “节目单”界面
  final Widget playlistPage;

  /// “我喜欢”界面
  final Widget favoritePage;

  /// “调设置”界面
  final Widget settingsPage;

  const MainNavigation({
    super.key,
    required this.tunerPage,
    required this.playlistPage,
    required this.favoritePage,
    required this.settingsPage,
  });

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  /// 屏幕大小在多少的时候实施切换
  static const double screenCustomWidth = 640;

  /// APP包含这些主页面
  static const Map<String, IconData> _homeNavigationUnit = {
    "调谐器": TablerIcons.antenna,
    "节目单": TablerIcons.timeline_event_text,
    "我喜欢": TablerIcons.heart,
    "改设置": TablerIcons.settings,
  };

  /// 当前选择的界面
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    final NavigationBar? homeNavigationBar = switch (screenWidth) {
      > screenCustomWidth => null,
      _ => NavigationBar(
        destinations: _homeNavigationUnit.entries
            .map(
              (entry) => NavigationDestination(
                icon: Icon(entry.value),
                label: entry.key,
              ),
            )
            .toList(),
        selectedIndex: selectedIndex,
        onDestinationSelected: (value) => setState(() {
          selectedIndex = value;
        }),
      ),
    };

    final NavigationRail? homeNavigationRail = switch (screenWidth) {
      <= screenCustomWidth => null,
      _ => NavigationRail(
        destinations: _homeNavigationUnit.entries
            .map(
              (entry) => NavigationRailDestination(
                icon: Icon(entry.value),
                label: Text(entry.key),
              ),
            )
            .toList(),
        selectedIndex: selectedIndex,
        onDestinationSelected: (value) => setState(() {
          selectedIndex = value;
        }),
        labelType: NavigationRailLabelType.all,
        backgroundColor: Theme.of(context).colorScheme.surfaceContainer,
      ),
    };

    return Scaffold(
      bottomNavigationBar: homeNavigationBar,
      body: Row(
        children: <Widget>[
          ?homeNavigationRail as Widget?,
          Expanded(child: widget.tunerPage),
        ],
      ),
    );
  }
}
