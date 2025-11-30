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
    return ListView(
      children: [
        _ProgramCarouselView(),
        _ProgramCard(
          programBroadCastingLogo: AssetImage("assets/sample1.png"),
          programName: "测试",
          programTitle: "用于测试的文本",
          programImage: AssetImage("assets/sample1.png"),
          programStartTime: DateTime(2025, 11, 11, 11, 11),
          programTagged: true,
          programFavorite: true,
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
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: LimitedBox(
        maxHeight: 240,
        child: CarouselView.weighted(
          key: const PageStorageKey('program_carousel'),
          controller: _carouselController,
          flexWeights: [1, 6, 1],
          itemSnapping: true,
          children: [
            _ProgramCarouselViewUnit(
              programBroadCastingLogo: AssetImage("assets/sample1.png"),
              programName: '123',
              programTitle: '123',
              programImage: AssetImage("assets/sample1.png"),
              programStartTime: DateTime.now(),
            ),
            _ProgramCarouselViewUnit(
              programBroadCastingLogo: AssetImage("assets/sample1.png"),
              programName: '123',
              programTitle: '123',
              programImage: AssetImage("assets/sample1.png"),
              programStartTime: DateTime.now(),
            ),
            _ProgramCarouselViewUnit(
              programBroadCastingLogo: AssetImage("assets/sample1.png"),
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
          mainAxisSize: MainAxisSize.max,
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

    final head = LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 8) return SizedBox(); // 顺应上面布局消失逻辑
        return Text(
          "测试文本测试",
          style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
          overflow: TextOverflow.clip,
          softWrap: false,
          maxLines: 1,
        );
      },
    );

    final image = ClipRRect(
      clipBehavior: Clip.antiAlias,
      borderRadius: BorderRadiusGeometry.circular(24),
      child: Image(image: programImage, fit: BoxFit.cover),
    ); // 构建图片

    final difference = DateTime.now().difference(programStartTime);
    final timelabel = switch (difference.inHours) {
      < 24 => "${difference.inHours}小时前",
      _ => "${difference.inDays}天前",
    }; // 构建标签

    // 构建轮播指示器 TODO 换名字
    final zhisq = LayoutBuilder(
      builder: (context, constraints) {
        // if (constraints.maxWidth > constraints.maxHeight) return SizedBox(); // 顺应上面布局消失逻辑
        return Align(
          alignment: Alignment.bottomRight,
          child: CircularProgressIndicator(year2023: false, value: 0.2),
        );
      },
    );

    return Container(
      color: Theme.of(context).colorScheme.surfaceContainerHighest,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(child: image),
          Expanded(
            child: Padding(
              padding: EdgeInsetsGeometry.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [title, head, zhisq],
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
    final title = LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 8) return SizedBox(); // 避免 Padding 的 Overflow 错误

        return Row(
          mainAxisSize: MainAxisSize.max,
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
                programName,
                style: Theme.of(context).textTheme.titleMedium,
                overflow: TextOverflow.clip,
                softWrap: false,
                maxLines: 1,
              ),
            ),
          ],
        );
      },
    );

    final head = LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 8) return SizedBox(); // 顺应上面布局消失逻辑
        return Text(
          programTitle,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
          overflow: TextOverflow.ellipsis,
          softWrap: true,
          maxLines: 3,
        );
      },
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
      borderRadius: BorderRadiusGeometry.circular(24),
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
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 16,
                children: [body, image],
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
