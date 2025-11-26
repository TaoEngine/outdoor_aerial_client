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
                      programBroadCastingLogo: AssetImage("assets/ah908.png"),
                      programName: "快乐出发",
                      programTitle: "工作中的异性同事能不能处成恋爱关系",
                      programImage: AssetImage("assets/sample1.png"),
                      programStartTime: DateTime(2025, 11, 22, 8, 30),
                      programTagged: true,
                      programFavorite: true,
                    ),
                    _ProgramCard(
                      programBroadCastingLogo: AssetImage("assets/ah908.png"),
                      programName: "正午乐逍遥",
                      programTitle: "回县城买房发展是不是一条可取的退路",
                      programImage: AssetImage("assets/sample2.png"),
                      programStartTime: DateTime(2025, 11, 22, 12, 00),
                      programTagged: false,
                      programFavorite: true,
                    ),
                    _ProgramCard(
                      programBroadCastingLogo: AssetImage("assets/nj887.png"),
                      programName: "Top 20 Countdown",
                      programTitle: "欧美榜单第一毫无悬念是泰勒斯威夫特",
                      programImage: AssetImage("assets/sample5.png"),
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
                      programBroadCastingLogo: AssetImage("assets/ah929.png"),
                      programName: "汽车315",
                      programTitle: "小米汽车 SU7 Pro 的空调排水口被苍蝇堵住被索要 5 万元维修费的维权后续",
                      programImage: AssetImage("assets/sample3.png"),
                      programStartTime: DateTime(2025, 11, 22, 11, 00),
                      programTagged: true,
                      programFavorite: true,
                    ),
                    _ProgramCard(
                      programBroadCastingLogo: AssetImage("assets/ah929.png"),
                      programName: "国元证券时间",
                      programTitle: "A股市场做出调整，今日市场持续低迷",
                      programImage: AssetImage("assets/sample4.png"),
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
          return _ProgramCarouselViewUnit(
            programBroadCastingLogo: AssetImage("assets/ah908.png"),
            programName: "测试",
            programTitle: "测试文字测试文字测试文字测试文字测试文字测试文字测试文字测试文字测试文字测试文字",
            programImage: AssetImage("assets/sample1.png"),
            programStartTime: DateTime.now(),
            viewState: false,
          );
        }),
        onTap: (value) {
          final maxScroll = _carouselController.position.maxScrollExtent;
          final itemExtent = maxScroll > 0 ? maxScroll / (5 - 1) : 1;
          final int currentIndex = (_carouselController.offset / itemExtent).round();
          if (currentIndex == value) {
            GoRouter.of(context).goNamed("ProgramPage");
          } else {
            _carouselController.animateToItem(value);
          }
        },
      ),
    );
  }
}

class _ProgramCarouselViewUnit extends StatelessWidget {
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

  /// 节目卡片根据所处位置展现的状态
  ///
  /// - false 表示卡片位于侧面所以仅显示图片
  /// - true  表示卡片位于中间所以显示全部
  final bool viewState;

  const _ProgramCarouselViewUnit({
    required this.programBroadCastingLogo,
    required this.programName,
    required this.programTitle,
    required this.programImage,
    required this.programStartTime,
    required this.viewState,
  });

  @override
  Widget build(BuildContext context) {
    final difference = DateTime.now().difference(programStartTime);
    final timelabel = switch (difference.inHours) {
      < 24 => "${difference.inHours}小时前",
      _ => "${difference.inDays}天前",
    }; // 构建标签

    return Container(
      color: Theme.of(context).colorScheme.surfaceContainerHighest,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // 切换显示正文
              if (viewState) Text("data"),
            ],
          );
        },
      ),
    );

    return Container(
      color: Theme.of(context).colorScheme.surfaceContainerHighest,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final width = constraints.maxWidth;
          // 计算展开进度 t
          // 当宽度 < 200 时，t = 0 (侧边状态)
          // 当宽度 > 350 时，t = 1 (中间状态)

          // 根据卡片目前的宽度决定
          final double t = ((width - 200) / (350 - 200)).clamp(0, 1);

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
                                  Image(image: programBroadCastingLogo, height: 16),
                                  const SizedBox(width: 8),
                                  Expanded(
                                    child: Text(
                                      programName,
                                      style: Theme.of(context).textTheme.titleSmall,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 12),
                              Text(
                                programTitle,
                                style: Theme.of(
                                  context,
                                ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const Spacer(),
                              Text(
                                "正在播出 · $timelabel",
                                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                                  color: Theme.of(context).colorScheme.onSurfaceVariant,
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

  @override
  Widget build(BuildContext context) {
    final title = Row(
      mainAxisSize: MainAxisSize.min,
      spacing: 8,
      children: [
        Image(image: programBroadCastingLogo, height: 16),
        Text(programName, style: Theme.of(context).textTheme.titleMedium),
      ],
    );
    final body = Text(
      programTitle,
      style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
    );
    final head = Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 8,
        children: [title, body],
      ),
    ); // 构建头部

    final image = ClipRRect(
      clipBehavior: Clip.antiAlias,
      borderRadius: BorderRadiusGeometry.circular(16),
      child: Image(image: programImage, width: 100, height: 100),
    ); // 构建图片

    final difference = DateTime.now().difference(programStartTime);
    final timelabel = switch (difference.inHours) {
      < 24 => "${difference.inHours}小时前",
      _ => "${difference.inDays}天前",
    };
    final tags = Row(
      mainAxisSize: MainAxisSize.min,
      spacing: 4,
      children: [
        if (programFavorite) Chip(avatar: Icon(TablerIcons.heart_filled), label: Text("我喜欢")),
        if (programTagged) Chip(avatar: const Icon(TablerIcons.tag_filled), label: Text("已收藏")),
        Chip(avatar: const Icon(TablerIcons.clock), label: Text(timelabel)),
      ],
    ); // 构建标签

    final action = IconButton.filled(
      onPressed: () => GoRouter.of(context).goNamed("PlayPage"),
      icon: Icon(TablerIcons.player_play),
      tooltip: "播放此节目",
    ); // 构建操作按钮

    return Padding(
      padding: const EdgeInsets.all(8),
      child: Card.filled(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(25)),
        child: Padding(
          padding: EdgeInsetsGeometry.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [head, const SizedBox(width: 16), image],
              ),
              const SizedBox(height: 16),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [tags, const Spacer(), action],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
