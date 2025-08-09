import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

class TunerPage extends StatelessWidget {
  const TunerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        icon: Icon(TablerIcons.chart_arcs),
        label: const Text("搜索节目"),
      ),
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      body: const NoProgramPage(),
    );
  }
}

class NoProgramPage extends StatelessWidget {
  /// 无节目时候的画面
  const NoProgramPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        spacing: 10,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // TODO: 弄个类似于电视雪花屏一样的背景，表示无节目
          const Icon(TablerIcons.antenna_off, size: 100),
          Text(
            "没有节目哦！试着搜索一些...",
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ],
      ),
    );
  }
}
