import 'package:flutter/material.dart';

class TunerPage extends StatefulWidget {
  const TunerPage({super.key});

  @override
  State<TunerPage> createState() => _TunerPageState();
}

class _TunerPageState extends State<TunerPage> with TickerProviderStateMixin {
  late final TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(initialIndex: 0, length: 1, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        TabBar(
          controller: _tabController,
          indicatorSize: TabBarIndicatorSize.tab,
          tabAlignment: TabAlignment.center,
          isScrollable: true,
          dividerHeight: 0,
          tabs: [
            Tab(
              icon: SizedBox(
                width: 36,
                height: 36,
                child: Image.network(
                  "https://ytmedia.radio.cn/CCYT%2F202407%2F23%2F21%2FqrAYKFsw1eT1zBqivRaAw7wqDTub9JBBRe2024072321762.PNG",
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsetsGeometry.only(top: 10, bottom: 10),
          child: SizedBox(
            height: 100,
            child: ListView(
              padding: EdgeInsets.only(left: 10, right: 10),
              scrollDirection: Axis.horizontal,
              children: [SizedBox(width: 300, child: Card.filled())],
            ),
          ),
        ),
      ],
    );
  }
}
