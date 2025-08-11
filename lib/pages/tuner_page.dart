import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

/// “调谐器” 的主界面
///
/// 它是一个界面选择器，通过调谐器返回的节目信息来决定要为用户展现什么界面
/// 当然如果调谐器内没有存放节目的话会展示引导用户搜索界面的界面
class TunerMainPage extends StatelessWidget {
  /// “调谐器” 的主界面
  /// 不需要向其导入什么东西
  const TunerMainPage({super.key});

  @override
  Widget build(BuildContext context) {
    // floatingActionButton: FloatingActionButton.extended(
    //   onPressed: () {},
    //   icon: Icon(TablerIcons.chart_arcs),
    //   label: const Text("搜索节目"),
    // ),
    return switch (false) {
      false => const NoProgramPage(),
      _ => TunerPage(),
    };
  }
}

/// “调谐器” 的界面
///
/// 这个界面将用于展示调谐器内存放的节目，并轮播电台节目供用户挑选
/// 它还会像音乐软件首页的方式展示当前播出的节目，最喜欢的节目，录制过的节目，简要节目单等个性化页面
class TunerPage extends StatelessWidget {
  /// “调谐器” 的界面
  /// 不需要向其导入什么东西
  const TunerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

/// “无节目” 的界面
///
/// 当调谐器报告它没有存放任何节目的时候展现出一个大标题表示现在没有节目
/// 然后右下角提供一个按钮表示可以让调谐器搜索并储存节目
class NoProgramPage extends StatelessWidget {
  /// “无节目” 的界面
  /// 不需要向其导入什么东西
  const NoProgramPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        spacing: 10,
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // TODO: 弄个类似于电视雪花屏一样的背景，表示无节目
          const Icon(TablerIcons.antenna_off, size: 100),
          Text("没有节目哦！试着搜索一些...", style: Theme.of(context).textTheme.titleLarge),
        ],
      ),
    );
  }
}
