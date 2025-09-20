import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:go_router/go_router.dart';
import 'package:outdoor_aerial_client/pages/tuner/tuner_page.dart';

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
      appBar: AppBar(
        centerTitle: true,
        title: Icon(TablerIcons.antenna),
        leading: IconButton(onPressed: () {}, icon: Icon(TablerIcons.search), tooltip: "查找"),
        actions: [
          Padding(
            padding: EdgeInsetsGeometry.all(8),
            child: IconButton(onPressed: () {}, icon: Icon(TablerIcons.radar), tooltip: "搜台"),
          ),
        ],
      ),
      body: Stack(
        children: [
          TabBarView(
            controller: _tabController,
            physics: const NeverScrollableScrollPhysics(),
            children: <Widget>[TunerPage(), Placeholder(), Placeholder(), Placeholder()],
          ),
          BottomPlayWidget(
            programTitle: '某节目Slogan',
            programName: '某节目',
            broadcastName: '某频道',
            programImage: null,
            onStopButtomTap: () {},
          ),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        destinations: const <Widget>[
          NavigationDestination(icon: Icon(TablerIcons.antenna), label: "调谐器", tooltip: "调谐器"),
          NavigationDestination(icon: Icon(TablerIcons.timeline_event_text), label: "节目单", tooltip: "节目单"),
          NavigationDestination(icon: Icon(TablerIcons.heart), label: "我喜欢", tooltip: "我喜欢"),
          NavigationDestination(icon: Icon(TablerIcons.settings), label: "改设置", tooltip: "改设置"),
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

class BottomPlayWidget extends StatelessWidget {
  /// 节目的主标题，包括 Slogan 或者歌曲的名称
  final String programTitle;

  /// 节目名称
  final String programName;

  /// 电台名称
  final String broadcastName;

  /// 可选描述节目的图片
  final Image? programImage;

  /// 按下停止键需要做的事情
  final VoidCallback onStopButtomTap;

  /// 底部播放器组件
  const BottomPlayWidget({
    super.key,
    required this.programTitle,
    required this.programName,
    required this.broadcastName,
    required this.onStopButtomTap,
    this.programImage,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: SizedBox(
        height: 120,
        width: switch (MediaQuery.sizeOf(context).width) {
          >= 500 => 500,
          final width => width,
        },
        child: Padding(
          padding: EdgeInsetsGeometry.all(10),
          child: Card.filled(
            clipBehavior: Clip.antiAlias,
            child: InkWell(
              onTap: () => GoRouter.of(context).goNamed("PlayPage"),
              child: Stack(
                children: [
                  Flex(
                    direction: Axis.horizontal,
                    children: [
                      Expanded(flex: 8, child: Ink(color: Theme.of(context).colorScheme.tertiaryContainer)),
                      Expanded(flex: 2, child: Ink()),
                    ],
                  ),
                  Flex(
                    direction: Axis.horizontal,
                    children: [
                      ClipRRect(
                        clipBehavior: Clip.antiAlias,
                        borderRadius: BorderRadiusGeometry.circular(10),
                        child: AspectRatio(
                          aspectRatio: 1,
                          child: programImage ?? Center(child: Icon(TablerIcons.music_question)),
                        ),
                      ),
                      Expanded(
                        flex: 7,
                        child: Padding(
                          padding: EdgeInsetsGeometry.only(left: 15, right: 15),
                          child: Column(
                            spacing: 5,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(programTitle, style: Theme.of(context).textTheme.bodyLarge),
                              Text("$programName|$broadcastName", style: Theme.of(context).textTheme.bodySmall),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Center(
                          child: IconButton.outlined(
                            onPressed: () => onStopButtomTap.call(),
                            icon: Icon(TablerIcons.player_stop),
                            tooltip: "停止播放",
                          ),
                        ),
                      ),
                    ],
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
