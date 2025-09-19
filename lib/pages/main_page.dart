import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
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
        leading: IconButton(
          onPressed: () {},
          icon: Icon(TablerIcons.search),
          tooltip: "查找",
        ),
        actions: [
          Padding(
            padding: EdgeInsetsGeometry.all(8),
            child: IconButton(
              onPressed: () {},
              icon: Icon(TablerIcons.radar),
              tooltip: "搜台",
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          TabBarView(
            controller: _tabController,
            physics: const NeverScrollableScrollPhysics(),
            children: <Widget>[
              TunerPage(),
              Placeholder(),
              Placeholder(),
              Placeholder(),
            ],
          ),
          BottomPlayWidget(),
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

class BottomPlayWidget extends StatelessWidget {
  const BottomPlayWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: SizedBox(
        height: 120,
        width: switch (MediaQuery.sizeOf(context).width) {
          >= 600 => 600,
          final width => width,
        },
        child: Padding(
          padding: EdgeInsetsGeometry.all(10),
          child: Card.filled(
            clipBehavior: Clip.antiAlias,
            child: Stack(
              children: [
                Flex(
                  direction: Axis.horizontal,
                  children: [
                    Expanded(
                      flex: 8,
                      child: ClipRRect(
                        clipBehavior: Clip.antiAlias,
                        borderRadius: BorderRadiusGeometry.circular(10),
                        child: Container(
                          color: Theme.of(context).colorScheme.primaryContainer,
                        ),
                      ),
                    ),
                    Expanded(flex: 2, child: Container()),
                  ],
                ),
                Flex(
                  direction: Axis.horizontal,
                  children: [
                    ClipRRect(
                      clipBehavior: Clip.antiAlias,
                      borderRadius: BorderRadiusGeometry.circular(10),
                      child: Image.network(
                        "https://p2.music.126.net/cmoE8PsdK_Yn9VJ8ZVCGrw==/109951170507596121.jpg",
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsetsGeometry.only(left: 15, right: 15),
                        child: Column(
                          spacing: 5,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "跳楼机·LBI利比",
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            Text(
                              "音乐爱假日 | 安徽音乐广播",
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ],
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
    );
  }
}
