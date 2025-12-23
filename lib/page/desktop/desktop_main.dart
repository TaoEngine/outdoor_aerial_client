import 'package:flutter/material.dart';

import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:go_router/go_router.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final mainNavigationBarDestinations = <Widget>[
      Padding(
        padding: .all(4),
        child: ListTile(
          leading: CircleAvatar(child: Icon(TablerIcons.antenna)),
          title: Text("室外天线", style: Theme.of(context).textTheme.headlineSmall),
          subtitle: Text("位于安徽省马鞍山市", style: Theme.of(context).textTheme.bodySmall),
        ),
      ),
      NavigationDrawerDestination(
        icon: Icon(TablerIcons.antenna),
        label: Text("调谐器", style: Theme.of(context).textTheme.labelLarge),
      ),
      NavigationDrawerDestination(
        icon: Icon(TablerIcons.timeline_event_text),
        label: Text("节目单", style: Theme.of(context).textTheme.labelLarge),
      ),
      NavigationDrawerDestination(
        icon: Icon(TablerIcons.heart),
        label: Text("我喜欢", style: Theme.of(context).textTheme.labelLarge),
      ),
      NavigationDrawerDestination(
        icon: Icon(TablerIcons.settings),
        label: Text("改设置", style: Theme.of(context).textTheme.labelLarge),
      ),
    ];

    return Scaffold(
      body: Row(
        children: [
          NavigationDrawer(
            onDestinationSelected: (value) {
              setState(() {
                _currentPageIndex = value;
              });
            },
            selectedIndex: _currentPageIndex,
            children: mainNavigationBarDestinations,
          ),
          Expanded(
            child: switch (_currentPageIndex) {
              0 => Placeholder(),
              1 => Placeholder(),
              2 => Placeholder(),
              3 => Placeholder(),
              _ => Placeholder(),
            },
          ),
        ],
      ),
    );
  }
}

class BottomPlayWidget extends StatelessWidget {
  /// 节目的主标题，包括 Slogan 或者歌曲的名称
  final String programTitle;

  /// 节目名称
  final String programName;

  /// 电台名称
  final String programBroadcasting;

  /// 节目播出进度
  final double programProgress;

  /// 可选描述节目的图片
  final Widget programImage;

  /// 按下停止键需要做的事情
  final VoidCallback onStopButtomTap;

  /// 底部播放器组件
  const BottomPlayWidget({
    super.key,
    required this.programTitle,
    required this.programName,
    required this.programBroadcasting,
    required this.programProgress,
    required this.onStopButtomTap,
    required this.programImage,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: .bottomCenter,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: 100,
          maxWidth: switch (MediaQuery.sizeOf(context).width) {
            >= 500 => 500,
            final width => width,
          },
        ),
        child: Padding(
          padding: .all(10),
          child: Card.filled(
            clipBehavior: .antiAlias,
            child: InkWell(
              onTap: () => GoRouter.of(context).goNamed("PlayPage"),
              child: Stack(
                children: [
                  FractionallySizedBox(
                    alignment: .centerLeft,
                    widthFactor: programProgress,
                    child: Ink(color: Theme.of(context).colorScheme.tertiaryContainer),
                  ),
                  Row(
                    mainAxisAlignment: .start,
                    mainAxisSize: .max,
                    crossAxisAlignment: .center,
                    children: [
                      Padding(
                        padding: .all(5),
                        child: ClipRRect(
                          clipBehavior: .antiAlias,
                          borderRadius: .circular(10),
                          child: AspectRatio(aspectRatio: 1, child: programImage),
                        ),
                      ),
                      Padding(
                        padding: .only(left: 15, right: 15),
                        child: Column(
                          spacing: 5,
                          mainAxisAlignment: .center,
                          crossAxisAlignment: .start,
                          children: [
                            Text(programTitle, style: Theme.of(context).textTheme.bodyLarge),
                            Text(
                              "$programName | $programBroadcasting",
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Align(
                    alignment: .centerRight,
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: Center(
                        child: IconButton.outlined(
                          onPressed: () => onStopButtomTap.call(),
                          icon: Icon(TablerIcons.player_stop),
                          tooltip: "停止播放",
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
