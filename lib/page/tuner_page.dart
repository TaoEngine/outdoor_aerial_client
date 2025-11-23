import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:go_router/go_router.dart';

class TunerPage extends StatefulWidget {
  const TunerPage({super.key});

  @override
  State<TunerPage> createState() => _TunerPageState();
}

class _TunerPageState extends State<TunerPage> {
  // AppBar
  Widget appBar() => SliverAppBar(
    expandedHeight: 120,
    pinned: true,
    flexibleSpace: FlexibleSpaceBar(
      titlePadding: EdgeInsets.only(left: 16, bottom: 6),
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
              Text("安装在安徽省马鞍山市", style: Theme.of(context).textTheme.labelSmall),
            ],
          ),
        ],
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        appBar(),
        SliverPadding(
          padding: EdgeInsetsGeometry.only(left: 16, right: 16, top: 16),
          sliver: SliverToBoxAdapter(child: _ProgramCarouselView()),
        ),
        SliverPadding(
          padding: EdgeInsetsGeometry.all(8),
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

class _ProgramCarouselView extends StatefulWidget {
  const _ProgramCarouselView();

  @override
  State<_ProgramCarouselView> createState() => _ProgramCarouselViewState();
}

class _ProgramCarouselViewState extends State<_ProgramCarouselView> {
  late final CarouselController _carouselController;

  @override
  void initState() {
    super.initState();
    _carouselController = CarouselController();
  }

  @override
  void dispose() {
    _carouselController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: 240),
      child: CarouselView.weighted(
        key: const PageStorageKey('program_carousel'),
        controller: _carouselController,
        flexWeights: [1, 6, 1],
        itemSnapping: true,
        children: List.generate(5, (index) {
          return _ProgramView(
            programBroadCastingLogo: AssetImage("asset/ah908.png"),
            programName: "测试",
            programTitle: "测试文字测试文字测试文字测试文字测试文字测试文字测试文字测试文字测试文字测试文字",
            programImage: AssetImage("asset/sample1.png"),
            programStartTime: DateTime.now(),
          );
        }),
        onTap: (value) {
          final maxScroll = _carouselController.position.maxScrollExtent;
          final itemExtent = maxScroll > 0 ? maxScroll / (5 - 1) : 1;
          final int currentIndex = (_carouselController.offset / itemExtent)
              .round();
          if (currentIndex == value) {
            GoRouter.of(context).goNamed("ProgramPage");
          } else {
            _carouselController.animateToItem(
              value,
              duration: Duration(milliseconds: 500),
              curve: Curves.easeInOut,
            );
          }
        },
      ),
    );
  }
}

class _ProgramView extends StatelessWidget {
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

  const _ProgramView({
    required this.programBroadCastingLogo,
    required this.programName,
    required this.programTitle,
    required this.programImage,
    required this.programStartTime,
  });

  @override
  Widget build(BuildContext context) {
    final timeDifference = DateTime.now().difference(programStartTime);
    final timeLabel = switch (timeDifference.inHours) {
      < 24 => "${timeDifference.inHours}小时前",
      _ => "${timeDifference.inDays}天前",
    };

    return Container(
      color: Theme.of(context).colorScheme.surfaceContainerHighest,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final width = constraints.maxWidth;
          // 计算展开进度 t
          // 当宽度 < 200 时，t = 0 (侧边状态)
          // 当宽度 > 350 时，t = 1 (中间状态)
          final t = ((width - 200) / (350 - 200)).clamp(0.0, 1.0);

          // 使用曲线让变化更平滑
          final curveT = Curves.easeOut.transform(t);

          // 图片宽度比例：从 1.0 (侧边) 过渡到 0.4 (中间)
          final imageRatio = 1.0 - (0.6 * curveT);
          final imageWidth = width * imageRatio;

          return Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                width: imageWidth,
                child: Image(image: programImage, fit: BoxFit.cover),
              ),
              if (width - imageWidth > 1) // 只有当有剩余空间时才渲染文字区域
                Expanded(
                  child: ClipRect(
                    child: OverflowBox(
                      minWidth: 0,
                      maxWidth: double.infinity,
                      alignment: Alignment.centerLeft,
                      child: SizedBox(
                        // 锁定文字区域的宽度，防止挤压换行
                        // 这里假设完全展开时文字区域占 60%
                        width: width * 0.6,
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Image(
                                    image: programBroadCastingLogo,
                                    height: 16,
                                  ),
                                  const SizedBox(width: 8),
                                  Expanded(
                                    child: Text(
                                      programName,
                                      style: Theme.of(
                                        context,
                                      ).textTheme.titleSmall,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 12),
                              Text(
                                programTitle,
                                style: Theme.of(context).textTheme.titleLarge
                                    ?.copyWith(fontWeight: FontWeight.bold),
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const Spacer(),
                              Text(
                                "正在播出 · $timeLabel",
                                style: Theme.of(context).textTheme.labelSmall
                                    ?.copyWith(
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.onSurfaceVariant,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          );
        },
      ),
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
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Card.filled(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(25),
        ),
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
      ),
    );
  }
}
