import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:go_router/go_router.dart';

import 'package:outdoor_aerial_client/providers/broadcast_programs.dart';

class TunerPage extends StatefulWidget {
  const TunerPage({super.key});

  @override
  State<TunerPage> createState() => _TunerPageState();
}

class _TunerPageState extends State<TunerPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [ProgramCarouselView()], // 放置 _ProgramCarouselView 轮播图和 _ProgramCard 卡片的地方
    );
  }
}

class ProgramCarouselView extends ConsumerStatefulWidget {
  const ProgramCarouselView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProgramCarouselViewState();
}

class _ProgramCarouselViewState extends ConsumerState<ProgramCarouselView> {
  late final CarouselController _carouselController;
  int carouselItems = 0;

  @override
  void initState() {
    super.initState();
    _carouselController = CarouselController(initialItem: carouselItems);
  }

  @override
  void dispose() {
    _carouselController.dispose();
    super.dispose();
  }

  void onTap(int value) {
    final maxScroll = _carouselController.position.maxScrollExtent;
    final itemExtent = maxScroll > 0 ? maxScroll / (carouselItems - 1) : 1;
    final int currentIndex = (_carouselController.offset / itemExtent).round();
    if (currentIndex == value) {
      GoRouter.of(context).pushNamed("ProgramPage");
    } else {
      _carouselController.animateToItem(value);
    }
  }

  @override
  Widget build(BuildContext context) {
    final programs = ref.watch(broadcastProgramsProvider);
    carouselItems = programs.length;

    return Padding(
      padding: const .only(top: 16),
      child: LimitedBox(
        maxHeight: 240,
        child: CarouselView.weighted(
          key: const PageStorageKey("ProgramCarouselView"), // 持续保持轮播图展示状态
          flexWeights: const [1, 6, 1],
          itemSnapping: true,
          controller: _carouselController,
          onTap: onTap,
          children: programs.map((program) {
            return ProgramCarouselViewUnit(
              programBroadcasting: program.studio.name,
              programBroadcastingLogo: program.studio.logo,
              programTitle: program.name,
              programImage: program.logo,
              programStartTime: DateTime(2025, 12, 3, program.start.hour, program.start.minute),
            );
          }).toList(),
        ),
      ),
    );
  }
}

class ProgramCarouselViewUnit extends StatelessWidget {
  /// 节目所属电台名称
  final String programBroadcasting;

  /// 节目所属电台Logo
  final ImageProvider programBroadcastingLogo;

  /// 节目内容
  final String programTitle;

  /// 节目内容图片
  final ImageProvider programImage;

  /// 节目播出时间
  final DateTime programStartTime;

  const ProgramCarouselViewUnit({
    super.key,
    required this.programBroadcasting,
    required this.programBroadcastingLogo,
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
          mainAxisSize: .max,
          mainAxisAlignment: .start,
          crossAxisAlignment: .center,
          spacing: 8,
          children: [
            Flexible(
              child: Image(
                image: programBroadcastingLogo,
                height: Theme.of(context).textTheme.titleLarge?.fontSize,
                fit: .fitHeight,
                alignment: .centerLeft,
              ),
            ),
            Flexible(
              child: Text(
                programBroadcasting,
                style: Theme.of(context).textTheme.titleMedium,
                overflow: .clip,
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
          programTitle,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: .bold),
          overflow: .clip,
          softWrap: false,
          maxLines: 1,
        );
      },
    ); // 构建正文

    final image = ClipRRect(
      clipBehavior: .antiAlias,
      borderRadius: .circular(24),
      child: Image(image: programImage, fit: .cover),
    ); // 构建图片

    // final difference = DateTime.now().difference(programStartTime);
    // final timelabel = switch (difference.inHours) {
    //   < 24 => "${difference.inHours}小时前",
    //   _ => "${difference.inDays}天前",
    // }; // 构建标签

    final indicator = LayoutBuilder(
      builder: (context, constraints) {
        // if (constraints.maxWidth > constraints.maxHeight) return SizedBox(); // 顺应上面布局消失逻辑
        return Align(
          alignment: .bottomRight,
          child: CircularProgressIndicator(year2023: false, value: 0.2),
        );
      },
    ); // 构建轮播指示

    return Container(
      color: Theme.of(context).colorScheme.surfaceContainerHighest,
      child: Row(
        crossAxisAlignment: .stretch,
        children: [
          Expanded(child: image),
          Expanded(
            child: Padding(
              padding: .all(16),
              child: Column(
                mainAxisSize: .max,
                mainAxisAlignment: .spaceBetween,
                crossAxisAlignment: .start,
                children: [title, head, indicator],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProgramCard extends StatelessWidget {
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

  const ProgramCard({
    super.key,
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
          mainAxisSize: .max,
          mainAxisAlignment: .start,
          crossAxisAlignment: .center,
          spacing: 8,
          children: [
            Flexible(
              child: Image(
                image: programBroadCastingLogo,
                height: Theme.of(context).textTheme.titleLarge?.fontSize,
                fit: .fitHeight,
                alignment: .centerLeft,
              ),
            ),
            Flexible(
              child: Text(
                programName,
                style: Theme.of(context).textTheme.titleMedium,
                overflow: .clip,
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
          programTitle,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
          overflow: .ellipsis,
          softWrap: true,
          maxLines: 3,
        );
      },
    ); // 构建正文

    final image = ClipRRect(
      clipBehavior: .antiAlias,
      borderRadius: .circular(24),
      child: Image(image: programImage, width: 100, height: 100),
    ); // 构建图片

    final difference = DateTime.now().difference(programStartTime);
    final timelabel = switch (difference.inHours) {
      < 24 => "${difference.inHours}小时前",
      _ => "${difference.inDays}天前",
    };
    final tags = Row(
      mainAxisSize: .min,
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
    ); // 构建按钮

    return Padding(
      padding: const .all(8),
      child: Card.filled(
        clipBehavior: .antiAlias,
        shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(25)),
        child: Padding(
          padding: const .all(20),
          child: Column(
            mainAxisSize: .min,
            crossAxisAlignment: .start,
            children: [
              Row(
                mainAxisSize: .max,
                mainAxisAlignment: .spaceAround,
                crossAxisAlignment: .start,
                spacing: 16,
                children: [
                  Expanded(
                    child: Column(crossAxisAlignment: .start, spacing: 8, children: [title, head]),
                  ),
                  image,
                ],
              ),
              const SizedBox(height: 16),
              Row(crossAxisAlignment: .center, children: [tags, const Spacer(), action]),
            ],
          ),
        ),
      ),
    );
  }
}
