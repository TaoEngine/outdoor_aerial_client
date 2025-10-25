import 'package:flutter/material.dart';

import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:go_router/go_router.dart';

import 'package:outdoor_aerial_client/pages/tuner/tuner_page.dart';
import 'package:outdoor_aerial_client/services/provider/program_provider.dart';
import 'package:provider/provider.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with TickerProviderStateMixin {
  static const mainNavigationBarDestinations = <Widget>[
    NavigationDestination(icon: Icon(TablerIcons.antenna), label: "调谐器", tooltip: "调谐器"),
    NavigationDestination(icon: Icon(TablerIcons.timeline_event_text), label: "节目单", tooltip: "节目单"),
    NavigationDestination(icon: Icon(TablerIcons.heart), label: "我喜欢", tooltip: "我喜欢"),
    NavigationDestination(icon: Icon(TablerIcons.settings), label: "改设置", tooltip: "改设置"),
  ];

  late final PageController __pageController;

  int __bottomNavigationBarIndex = 0;

  @override
  void initState() {
    super.initState();
    __pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    __pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MusicProgramProvider>(
      create: (context) => MusicProgramProvider(),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => GoRouter.of(context).goNamed("SearchPage"),
            icon: Icon(TablerIcons.search),
            tooltip: "查找节目",
          ),
          actions: [
            AspectRatio(
              aspectRatio: 1,
              child: Center(
                child: IconButton(
                  onPressed: () => GoRouter.of(context).goNamed("ScanPage"),
                  icon: Icon(TablerIcons.radar),
                  tooltip: "频率搜索",
                ),
              ),
            ),
          ],
        ),
        body: Stack(
          children: [
            PageView(
              controller: __pageController,
              physics: const NeverScrollableScrollPhysics(),
              children: <Widget>[TunerPage(), Placeholder(), Placeholder(), Placeholder()],
            ),
            Consumer<MusicProgramProvider>(
              builder: (context, program, _) => BottomPlayWidget(
                programTitle: program.programTitle,
                programName: program.programName,
                programBroadcasting: program.programBroadcasting,
                programImage: program.programImage,
                onStopButtomTap: () {},
                programProgress: 0.3,
              ),
            ),
          ],
        ),
        bottomNavigationBar: NavigationBar(
          destinations: mainNavigationBarDestinations,
          onDestinationSelected: (value) {
            __pageController.animateToPage(value, duration: Duration(milliseconds: 1000), curve: Curves.easeInOut);
            setState(() {
              __bottomNavigationBarIndex = value;
            });
          },
          selectedIndex: __bottomNavigationBarIndex,
        ),
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
      alignment: Alignment.bottomCenter,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: 100,
          maxWidth: switch (MediaQuery.sizeOf(context).width) {
            >= 500 => 500,
            final width => width,
          },
        ),
        child: Padding(
          padding: EdgeInsetsGeometry.all(10),
          child: Card.filled(
            clipBehavior: Clip.antiAlias,
            child: InkWell(
              onTap: () => GoRouter.of(context).goNamed("PlayPage"),
              child: Stack(
                children: [
                  FractionallySizedBox(
                    alignment: Alignment.centerLeft,
                    widthFactor: programProgress,
                    child: Ink(color: Theme.of(context).colorScheme.tertiaryContainer),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsetsGeometry.all(5),
                        child: ClipRRect(
                          clipBehavior: Clip.antiAlias,
                          borderRadius: BorderRadiusGeometry.circular(10),
                          child: AspectRatio(aspectRatio: 1, child: programImage),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsGeometry.only(left: 15, right: 15),
                        child: Column(
                          spacing: 5,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(programTitle, style: Theme.of(context).textTheme.bodyLarge),
                            Text("$programName | $programBroadcasting", style: Theme.of(context).textTheme.bodySmall),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.centerRight,
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
