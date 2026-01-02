import 'package:flutter/material.dart';

import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:go_router/go_router.dart';
import 'package:outdoor_aerial_client/widget/widget_bottom_play.dart';

import '../desktop/desktop_tuner.dart';

class DesktopMain extends StatefulWidget {
  const DesktopMain({super.key});

  @override
  State<DesktopMain> createState() => _DesktopMainState();
}

class _DesktopMainState extends State<DesktopMain> {
  int _currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final mainNavigationBarDestinations = <Widget>[
      NavigationDrawerDestination(
        icon: Icon(TablerIcons.antenna),
        label: Text("调谐器", style: Theme.of(context).textTheme.labelLarge),
      ),
      NavigationDrawerDestination(
        icon: Icon(TablerIcons.heart),
        label: Text("我喜欢", style: Theme.of(context).textTheme.labelLarge),
      ),
      NavigationDrawerDestination(
        icon: Icon(TablerIcons.folder),
        label: Text("节目单", style: Theme.of(context).textTheme.labelLarge),
      ),
      NavigationDrawerDestination(
        icon: Icon(TablerIcons.settings),
        label: Text("改设置", style: Theme.of(context).textTheme.labelLarge),
      ),
    ];

    final header = Padding(
      padding: .all(4),
      child: ListTile(
        leading: Hero(
          tag: "logo",
          child: CircleAvatar(child: Icon(TablerIcons.antenna)),
        ),
        title: Text("室外天线", style: Theme.of(context).textTheme.titleLarge),
      ),
    );

    final player = Align(
      alignment: .bottomCenter,
      child: BottomPlayWidget(
        title: '没有信号',
        onTap: () {},
        onStopButtomTap: () {},
      ),
    );

    return Scaffold(
      body: Stack(
        children: [
          Row(
            children: [
              NavigationDrawer(
                onDestinationSelected: (value) {
                  setState(() {
                    _currentPageIndex = value;
                  });
                },
                selectedIndex: _currentPageIndex,
                header: header,
                children: mainNavigationBarDestinations,
              ),
              Expanded(
                child: switch (_currentPageIndex) {
                  0 => DesktopTuner(),
                  1 => Placeholder(),
                  2 => Placeholder(),
                  3 => Placeholder(),
                  _ => Placeholder(),
                },
              ),
            ],
          ),
          player,
        ],
      ),
    );
  }
}
