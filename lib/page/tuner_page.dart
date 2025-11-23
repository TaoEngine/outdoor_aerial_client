import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:go_router/go_router.dart';

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
                    Text(
                      "室外天线",
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    Text(
                      "节目源在安徽省马鞍山市",
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                  ],
                ),
              ],
            ),
            titlePadding: EdgeInsets.only(left: 16, bottom: 6),
          ),
        ),
        SliverPadding(
          padding: EdgeInsetsGeometry.all(16),
          sliver: SliverCrossAxisGroup(
            slivers: [
              SliverCrossAxisExpanded(
                flex: 1,
                sliver: SliverList.list(
                  children: [
                    _ProgramCard(
                      programBroadCastingLogo: AssetImage("asset/ah908.png"),
                      programName: "快乐出发",
                      programTitle: "工作中的异性同事能不能处成恋爱关系",
                      programImage: AssetImage("asset/sample1.png"),
                      programStartTime: DateTime(2025, 11, 22, 8, 30),
                      programTagged: true,
                      programFavorite: true,
                    ),
                    _ProgramCard(
                      programBroadCastingLogo: AssetImage("asset/ah908.png"),
                      programName: "正午乐逍遥",
                      programTitle: "回县城买房发展是不是一条可取的退路",
                      programImage: AssetImage("asset/sample2.png"),
                      programStartTime: DateTime(2025, 11, 22, 12, 00),
                      programTagged: false,
                      programFavorite: true,
                    ),
                    _ProgramCard(
                      programBroadCastingLogo: AssetImage("asset/nj887.png"),
                      programName: "Top 20 Countdown",
                      programTitle: "欧美榜单第一毫无悬念是泰勒斯威夫特",
                      programImage: AssetImage("asset/sample5.png"),
                      programStartTime: DateTime(2025, 11, 22, 18, 00),
                      programTagged: false,
                      programFavorite: false,
                    ),
                  ],
                ),
              ),
              SliverCrossAxisExpanded(
                flex: 1,
                sliver: SliverList.list(
                  children: [
                    _ProgramCard(
                      programBroadCastingLogo: AssetImage("asset/ah929.png"),
                      programName: "汽车315",
                      programTitle: "小米汽车 SU7 Pro 的空调排水口被苍蝇堵住被索要 5 万元维修费的维权后续",
                      programImage: AssetImage("asset/sample3.png"),
                      programStartTime: DateTime(2025, 11, 22, 11, 00),
                      programTagged: true,
                      programFavorite: true,
                    ),
                    _ProgramCard(
                      programBroadCastingLogo: AssetImage("asset/ah929.png"),
                      programName: "国元证券时间",
                      programTitle: "A股市场做出调整，今日市场持续低迷",
                      programImage: AssetImage("asset/sample4.png"),
                      programStartTime: DateTime(2025, 11, 22, 15, 00),
                      programTagged: false,
                      programFavorite: false,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _ProgramCard extends StatelessWidget {
  /// 节目所属电台Logo
  final ImageProvider programBroadCastingLogo;

  /// 节目名称
  final String programName;

  /// 节目内容
  final String programTitle;

  /// 节目内容图片
  final ImageProvider programImage;

  /// 节目播出时间
  final DateTime programStartTime;

  /// 是否收藏此节目
  final bool programTagged;

  /// 是否喜欢此节目
  final bool programFavorite;

  const _ProgramCard({
    required this.programBroadCastingLogo,
    required this.programName,
    required this.programTitle,
    required this.programImage,
    required this.programStartTime,
    required this.programTagged,
    required this.programFavorite,
  });

  // 卡片的标签构建器
  Widget cardChipsBuilder(context) {
    List<Widget> chips = [];

    // 标签“已收藏”
    if (programTagged) {
      chips.add(
        Chip(avatar: const Icon(TablerIcons.tag_filled), label: Text("已收藏")),
      );
    }

    // 标签“我喜欢”
    if (programFavorite) {
      chips.add(
        Chip(avatar: Icon(TablerIcons.heart_filled), label: Text("我喜欢")),
      );
    }
    final timeDifference = DateTime.now().difference(programStartTime);
    final timeLabel = switch (timeDifference.inHours) {
      < 24 => "${timeDifference.inHours}小时前",
      _ => "${timeDifference.inDays}天前",
    };

    // 标签“时间”
    chips.add(
      Chip(avatar: const Icon(TablerIcons.clock), label: Text(timeLabel)),
    );
    return Row(mainAxisSize: MainAxisSize.min, spacing: 4, children: chips);
  }

  // 卡片头部的节目称谓
  Widget cardTitle(context) => Row(
    mainAxisSize: MainAxisSize.min,
    spacing: 8,
    children: [
      Image(image: programBroadCastingLogo, height: 16),
      Text(programName, style: Theme.of(context).textTheme.titleMedium),
    ],
  );

  // 卡片的主体
  Widget cardBody(context) => Text(
    programTitle,
    style: Theme.of(
      context,
    ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
  );

  // 卡片右侧的图片
  Widget cardImage(context) => ClipRRect(
    clipBehavior: Clip.antiAlias,
    borderRadius: BorderRadiusGeometry.circular(16),
    child: Image(image: programImage, width: 100, height: 100),
  );

  // 卡片播放按钮
  Widget cardAction(context) => IconButton.filled(
    onPressed: () => GoRouter.of(context).goNamed("PlayPage"),
    icon: Icon(TablerIcons.player_play),
    tooltip: "播放此节目",
  );

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
                    children: [cardTitle(context), cardBody(context)],
                  ),
                ),
                const SizedBox(width: 16),
                cardImage(context),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                cardChipsBuilder(context),
                const Spacer(),
                cardAction(context),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
