import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

class TunerPage extends StatefulWidget {
  const TunerPage({super.key});

  @override
  State<TunerPage> createState() => _TunerPageState();
}

class _TunerPageState extends State<TunerPage> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          expandedHeight: 120,
          pinned: true,
          flexibleSpace: FlexibleSpaceBar(
            title: Row(
              mainAxisSize: MainAxisSize.min,
              spacing: 16,
              children: [
                Icon(TablerIcons.antenna),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("室外天线", style: Theme.of(context).textTheme.headlineSmall),
                    Text("安徽省马鞍山市 | 共28个节目", style: Theme.of(context).textTheme.labelSmall),
                  ],
                ),
              ],
            ),
            titlePadding: EdgeInsets.only(left: 16, bottom: 6),
          ),
        ),
        SliverCrossAxisGroup(
          slivers: [
            SliverCrossAxisExpanded(
              flex: 1,
              sliver: SliverList.list(
                children: [
                  _ProgramCard(programBroadCasting: "安徽交通广播", programName: "快乐出发", programTitle: "异性同事能不能处成恋爱关系？"),
                  _ProgramCard(programBroadCasting: "安徽交通广播", programName: "正午乐逍遥", programTitle: "回县城买房发展是不是一条可取的退路？"),
                ],
              ),
            ),
            SliverCrossAxisExpanded(
              flex: 1,
              sliver: SliverList.list(
                children: [
                  _ProgramCard(
                    programBroadCasting: "安徽城市之声",
                    programName: "懂车帝·汽车315",
                    programTitle: "小米汽车 SU7 Pro 的排水口被苍蝇堵住的维权后续",
                  ),
                  _ProgramCard(programBroadCasting: "安徽城市之声", programName: "国元证券时间", programTitle: "A股可能做出调整，今日市场持续低迷"),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _ProgramCard extends StatelessWidget {
  /// 节目所属电台
  final String programBroadCasting;

  /// 节目名称
  final String programName;

  /// 节目标题
  final String programTitle;

  /// 节目标签
  final String? programTag;

  const _ProgramCard({
    required this.programBroadCasting,
    required this.programName,
    required this.programTitle,
    this.programTag,
  });

  @override
  Widget build(BuildContext context) {
    return Card.filled(
      clipBehavior: Clip.antiAlias,
      child: Padding(
        padding: EdgeInsetsGeometry.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 8,
                    children: [
                      Text("$programBroadCasting | $programName"),
                      Text(
                        programTitle,
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(16),
                    image: const DecorationImage(
                      // 这里使用网络图片作为占位，实际使用可换成 AssetImage
                      image: NetworkImage('https://picsum.photos/200'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  spacing: 4,
                  children: [
                    Chip(avatar: Icon(TablerIcons.heart_filled), label: Text("我喜欢")),
                    Chip(avatar: Icon(TablerIcons.clock), label: Text("2小时前")),
                  ],
                ),
                const Spacer(),
                IconButton.filled(onPressed: () {}, icon: Icon(TablerIcons.player_play)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
