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

  /// 放在左下角以供操作的FAB
  final FloatingActionButton? actionButton;

  const MainNavigation({
    super.key,
    required this.tunerPage,
    required this.playlistPage,
    required this.favoritePage,
    required this.settingsPage,
    required this.actionButton,
  });

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  /// 屏幕大小在多少的时候实施切换
  static const double _screenCustomWidth = 640;

  /// APP包含这些主页面
  static const Map<String, IconData> _mainNavigationUnit = {
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

    final NavigationBar? mainNavigationBar = switch (screenWidth) {
      > _screenCustomWidth => null,
      _ => NavigationBar(
        destinations: _mainNavigationUnit.entries
            .map((entry) => NavigationDestination(icon: Icon(entry.value), label: entry.key))
            .toList(),
        selectedIndex: selectedIndex,
        onDestinationSelected: (value) => setState(() {
          selectedIndex = value;
        }),
      ),
    };

    final NavigationRail? mainNavigationRail = switch (screenWidth) {
      <= _screenCustomWidth => null,
      _ => NavigationRail(
        destinations: _mainNavigationUnit.entries
            .map(
              (entry) => NavigationRailDestination(icon: Icon(entry.value), label: Text(entry.key)),
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

    final Widget mainNavigationChild = switch (selectedIndex) {
      0 => widget.tunerPage,
      1 => widget.playlistPage,
      2 => widget.favoritePage,
      3 => widget.settingsPage,
      _ => Center(child: Text("出错了")), // TODO: 其实这里应该有个全局报错页面的
    };

    return Scaffold(
      bottomNavigationBar: mainNavigationBar,
      body: Row(
        children: <Widget>[
          ?mainNavigationRail as Widget?,
          Expanded(child: mainNavigationChild),
        ],
      ),
    );
  }
}
