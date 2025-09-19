import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with TickerProviderStateMixin {
  late final TabController _tabController;
  int _index = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(initialIndex: 0, length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        controller: _tabController,
        physics: const NeverScrollableScrollPhysics(),
        children: <Widget>[
          Placeholder(),
          Placeholder(),
          Placeholder(),
          Placeholder(),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        destinations: const <Widget>[
          NavigationDestination(
            icon: Icon(TablerIcons.antenna),
            label: "调谐器",
            tooltip: "调谐器",
          ),
          NavigationDestination(
            icon: Icon(TablerIcons.timeline_event_text),
            label: "节目单",
            tooltip: "节目单",
          ),
          NavigationDestination(
            icon: Icon(TablerIcons.heart),
            label: "我喜欢",
            tooltip: "我喜欢",
          ),
          NavigationDestination(
            icon: Icon(TablerIcons.settings),
            label: "改设置",
            tooltip: "改设置",
          ),
        ],
        onDestinationSelected: (value) {
          _index = value;
          setState(() {
            _tabController.index = _index;
          });
        },
        selectedIndex: _index,
      ),
    );
  }
}
