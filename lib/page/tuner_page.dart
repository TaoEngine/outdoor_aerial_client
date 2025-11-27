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
                      programBroadCastingLogo: AssetImage("assets/sample1.png"),
                      programName: "programName",
                      programTitle: "programTitle",
                      programImage: AssetImage("assets/sample1.png"),
                      programStartTime: DateTime.now(),
                      programTagged: false,
                      programFavorite: false,
                    ),
                    // 放置 _ProgramCard 卡片的地方
                  ],
                ),
              ),
              SliverCrossAxisExpanded(
                flex: 1,
                sliver: SliverList.list(
                  children: [
                    // 放置 _ProgramCard 卡片的地方
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
    return LimitedBox(
      maxHeight: 240,
      child: CarouselView.weighted(
        key: const PageStorageKey('program_carousel'),
        controller: _carouselController,
        flexWeights: [1, 6, 1],
        itemSnapping: true,
        children: [
          _ProgramCarouselViewUnit(
            programBroadCastingLogo: AssetImage("assets/ah929.png"),
            programName: '123',
            programTitle: '123',
            programImage: AssetImage("assets/sample1.png"),
            programStartTime: DateTime.now(),
          ),
          _ProgramCarouselViewUnit(
            programBroadCastingLogo: AssetImage("assets/ah929.png"),
            programName: '123',
            programTitle: '123',
            programImage: AssetImage("assets/sample1.png"),
            programStartTime: DateTime.now(),
          ),
          _ProgramCarouselViewUnit(
            programBroadCastingLogo: AssetImage("assets/ah929.png"),
            programName: '123',
            programTitle: '123',
            programImage: AssetImage("assets/sample1.png"),
            programStartTime: DateTime.now(),
          ),
          // 放置 _ProgramCarouselViewUnit 卡片的地方
        ],
        onTap: (value) {
          final maxScroll = _carouselController.position.maxScrollExtent;
          final itemExtent = maxScroll > 0 ? maxScroll / (3 - 1) : 1;
          final int currentIndex = (_carouselController.offset / itemExtent).round();
          if (currentIndex == value) {
            GoRouter.of(context).pushNamed("ProgramPage");
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

  const _ProgramCarouselViewUnit({
    required this.programBroadCastingLogo,
    required this.programName,
    required this.programTitle,
    required this.programImage,
    required this.programStartTime,
  });

  @override
  Widget build(BuildContext context) {
    final title = LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 8) return SizedBox(); // 避免 Padding 的 Overflow 错误
        return Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 8,
          children: [
            Flexible(
              child: Image(
                image: programBroadCastingLogo,
                height: Theme.of(context).textTheme.titleLarge?.fontSize,
                fit: BoxFit.fitHeight,
                alignment: Alignment.centerLeft,
              ),
            ),
            Flexible(
              child: Text(
                "正在直播",
                style: Theme.of(context).textTheme.titleMedium,
                overflow: TextOverflow.clip,
                softWrap: false,
                maxLines: 1,
              ),
            ),
          ],
        );
      },
    ); // 构建标题

    final image = Expanded(
      child: ConstrainedBox(
        constraints: BoxConstraints(minWidth: 20),
        child: ClipRRect(
          clipBehavior: Clip.antiAlias,
          borderRadius: BorderRadiusGeometry.circular(24),
          child: Image(image: programImage, fit: BoxFit.cover),
        ),
      ),
    ); // 构建图片

    final difference = DateTime.now().difference(programStartTime);
    final timelabel = switch (difference.inHours) {
      < 24 => "${difference.inHours}小时前",
      _ => "${difference.inDays}天前",
    }; // 构建标签

    return Container(
      color: Theme.of(context).colorScheme.surfaceContainerHighest,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          image,
          Expanded(
            child: Padding(
              padding: EdgeInsetsGeometry.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [title],
              ),
            ),
          ),
        ],
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
        Image(
          image: programBroadCastingLogo,
          height: Theme.of(context).textTheme.titleLarge?.fontSize,
        ),
        Text(programName, style: Theme.of(context).textTheme.titleMedium),
      ],
    );
    final head = Text(
      programTitle,
      style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
    );
    final body = Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 8,
        children: [title, head],
      ),
    ); // 构建主体

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
                children: [body, const SizedBox(width: 16), image],
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
