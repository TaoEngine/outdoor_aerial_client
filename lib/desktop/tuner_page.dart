import 'dart:typed_data';

import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:go_router/go_router.dart';
import 'package:m3e_collection/m3e_collection.dart';
import 'package:outdoor_aerial_client/models/program/single.pb.dart';
import 'package:outdoor_aerial_client/providers/programs.dart';

class TunerPage extends ConsumerStatefulWidget {
  const TunerPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TunerPageState();
}

class _TunerPageState extends ConsumerState<TunerPage> {
  @override
  Widget build(BuildContext context) {
    final todayProgramsState = ref.watch(todayProgramProvider);

    return todayProgramsState.when(
      data: (programs) {
        return switch (programs.length) {
          0 => Center(
            child: Center(
              child: SizedBox.square(
                dimension: Theme.of(context).textTheme.displayLarge?.fontSize,
                child: LoadingIndicatorM3E(),
              ),
            ),
          ),
          _ => ListView(
            children: [
              ProgramCarouselView(programs: programs),
              // ProgramMasonryView()
            ],
          ),
        };
      },
      error: (error, stack) => Center(child: Text('Error: $error')),
      loading: () => Center(
        child: SizedBox.square(
          dimension: Theme.of(context).textTheme.displayLarge?.fontSize,
          child: LoadingIndicatorM3E(),
        ),
      ),
    );
  }
}

class ProgramCarouselView extends StatefulWidget {
  final List<SingleProgram> programs;
  const ProgramCarouselView({super.key, required this.programs});

  @override
  State<ProgramCarouselView> createState() => _ProgramCarouselViewState();
}

class _ProgramCarouselViewState extends State<ProgramCarouselView>
    with TickerProviderStateMixin {
  late final CarouselController _carouselController;
  late final AnimationController _autoplayController;
  int _carouselItems = 0;

  @override
  void initState() {
    super.initState();
    _carouselController = CarouselController(initialItem: _carouselItems);
    _autoplayController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    );
    _autoplayController
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          final currentIndex = _getCarouselIndex();
          if (currentIndex >= _carouselItems - 1) {
            _carouselController.animateToItem(0);
          } else {
            _carouselController.animateToItem(currentIndex + 1);
          }
          _autoplayController
            ..reset()
            ..forward();
        }
      })
      ..forward();
  }

  @override
  void dispose() {
    _autoplayController.dispose();
    _carouselController.dispose();
    super.dispose();
  }

  int _getCarouselIndex() {
    final maxScroll = _carouselController.position.maxScrollExtent;
    final itemExtent = maxScroll > 0 ? maxScroll / (_carouselItems - 1) : 1;
    final carouselIndex = (_carouselController.offset / itemExtent).round();
    return carouselIndex;
  }

  void _onCarouselUnitTap(int value) {
    final currentIndex = _getCarouselIndex();
    if (currentIndex == value) {
      GoRouter.of(context).pushNamed("ProgramPage");
    } else {
      _carouselController.animateToItem(value);
    }
    _autoplayController
      ..reset()
      ..forward();
  }

  @override
  Widget build(BuildContext context) {
    final programsCard = widget.programs.map((program) {
      final cover = program.image;
      final logo = program.image;
      final studio = '测试';
      final name = '测试';
      final title = program.title;
      final time = TimeOfDay(hour: 12, minute: 34);
      return ProgramCarouselViewUnit(
        key: ObjectKey(program),
        cover: cover,
        logo: logo,
        studio: studio,
        name: name,
        title: title,
        hosts: [],
        time: time,
        controller: _autoplayController,
      );
    }).toList();

    _carouselItems = widget.programs.length;

    return Padding(
      padding: const .only(top: 16),
      child: LimitedBox(
        maxHeight: 240,
        child: CarouselView.weighted(
          key: const PageStorageKey("ProgramCarouselView"), // 持续保持轮播图展示状态
          flexWeights: const [1, 6, 1],
          itemSnapping: true,
          onTap: _onCarouselUnitTap,
          controller: _carouselController,
          children: programsCard,
        ),
      ),
    );
  }
}

class ProgramCarouselViewUnit extends StatefulWidget {
  /// 封图
  final List<int> cover;

  /// 广播电台 logo
  final List<int> logo;

  /// 广播电台名称
  final String studio;

  /// 电台节目名称
  final String name;

  /// 本期电台节目的主题
  final String title;

  /// 主持人信息
  final List<String> hosts;

  /// 今日播出时间
  final TimeOfDay time;

  /// 轮播指示动画控制器
  final Animation<double> controller;

  const ProgramCarouselViewUnit({
    super.key,
    required this.cover,
    required this.logo,
    required this.studio,
    required this.name,
    required this.title,
    required this.hosts,
    required this.time,
    required this.controller,
  });

  @override
  State<ProgramCarouselViewUnit> createState() =>
      _ProgramCarouselViewUnitState();
}

class _ProgramCarouselViewUnitState extends State<ProgramCarouselViewUnit> {
  late ImageProvider _coverProvider;
  late ImageProvider _logoProvider;

  @override
  void initState() {
    super.initState();
    _initProviders();
  }

  void _initProviders() {
    _coverProvider = MemoryImage(Uint8List.fromList(widget.cover));
    _logoProvider = MemoryImage(Uint8List.fromList(widget.logo));
  }

  @override
  void didUpdateWidget(covariant ProgramCarouselViewUnit oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.cover != oldWidget.cover) {
      _coverProvider = MemoryImage(Uint8List.fromList(widget.cover));
    }
    if (widget.logo != oldWidget.logo) {
      _logoProvider = MemoryImage(Uint8List.fromList(widget.logo));
    }
  }

  @override
  Widget build(BuildContext context) {
    // 构建的广播电台图标
    final logo = Image(
      image: _logoProvider,
      height: Theme.of(context).textTheme.titleLarge?.fontSize,
      fit: .fitHeight,
      alignment: .centerLeft,
    );

    // 构建的广播电台名称
    final studio = Text(
      widget.studio,
      style: Theme.of(context).textTheme.titleMedium,
    );

    // 构建的正文
    final body = Text(
      widget.name,
      style: Theme.of(
        context,
      ).textTheme.titleLarge?.copyWith(fontWeight: .bold),
    );

    // 构建的图片
    final image = ClipRRect(
      clipBehavior: .antiAlias,
      borderRadius: .circular(24),
      child: Image(image: _coverProvider, fit: .cover),
    );

    // 构建的主持人信息
    final hosts = Row(
      mainAxisSize: .min,
      children: [
        if (widget.hosts.isEmpty)
          Flexible(
            child: Icon(
              TablerIcons.route,
              size: Theme.of(context).textTheme.titleSmall?.fontSize,
            ),
          ),
        if (widget.hosts.length == 1)
          Flexible(
            child: Icon(
              TablerIcons.user,
              size: Theme.of(context).textTheme.titleSmall?.fontSize,
            ),
          ),
        if (widget.hosts.length == 2)
          Flexible(
            child: Icon(
              TablerIcons.users,
              size: Theme.of(context).textTheme.titleSmall?.fontSize,
            ),
          ),
        if (widget.hosts.length >= 3)
          Flexible(
            child: Icon(
              TablerIcons.users_group,
              size: Theme.of(context).textTheme.titleSmall?.fontSize,
            ),
          ),
        if (widget.hosts.isNotEmpty)
          Flexible(
            child: Text(
              widget.hosts.fold<String>("", (combine, host) {
                return "$combine $host";
              }),
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ),
        if (widget.hosts.isEmpty)
          Flexible(
            child: Text("无人驾驶", style: Theme.of(context).textTheme.titleSmall),
          ),
      ],
    );

    // 构建的时间标签
    final timeDifference = DateTime.now().difference(
      DateTime.now().copyWith(
        hour: widget.time.hour,
        minute: widget.time.minute,
      ),
    );
    final timelabel = switch (timeDifference.inHours) {
      <= 0 => "${timeDifference.inMinutes}分钟前",
      _ => "${timeDifference.inHours}小时前",
    };
    final tags = Chip(
      avatar: const Icon(TablerIcons.clock),
      label: Text(timelabel, overflow: .ellipsis, softWrap: false, maxLines: 1),
    );

    // 构建轮播指示
    final indicator = LayoutBuilder(
      builder: (context, constraints) {
        final showOpacity = switch (constraints.maxWidth <=
            constraints.maxHeight) {
          true => 0.0,
          false => 1.0,
        };
        return AnimatedOpacity(
          opacity: showOpacity,
          duration: Durations.short4,
          child: SizedBox.square(
            dimension: Theme.of(context).textTheme.displaySmall?.fontSize,
            child: AnimatedBuilder(
              animation: widget.controller,
              builder: (context, child) {
                return Transform.rotate(
                  angle: widget.controller.value * 20,
                  child: CircularProgressIndicator.adaptive(
                    value: widget.controller.value,
                  ),
                );
              },
            ),
          ),
        );
      },
    );

    return Container(
      color: Theme.of(context).colorScheme.surfaceContainerHighest,
      child: Stack(
        children: [
          Row(
            crossAxisAlignment: .stretch,
            children: [
              Expanded(child: image),
              Expanded(
                child: Padding(
                  padding: .all(16),
                  child: Column(
                    mainAxisAlignment: .spaceBetween,
                    crossAxisAlignment: .start,
                    children: [
                      SingleChildScrollView(
                        scrollDirection: .horizontal,
                        physics: const NeverScrollableScrollPhysics(),
                        child: Row(
                          mainAxisSize: .min,
                          spacing: 8,
                          children: [logo, studio],
                        ),
                      ),
                      SingleChildScrollView(
                        scrollDirection: .horizontal,
                        physics: const NeverScrollableScrollPhysics(),
                        child: Column(
                          crossAxisAlignment: .start,
                          spacing: 4,
                          children: [body, hosts],
                        ),
                      ),
                      SingleChildScrollView(
                        scrollDirection: .horizontal,
                        physics: const NeverScrollableScrollPhysics(),
                        child: tags,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: .all(16),
            child: Align(alignment: .bottomLeft, child: indicator),
          ),
        ],
      ),
    );
  }
}

class ProgramCard extends StatelessWidget {
  /// 某一期电台节目信息
  ///
  /// 需要提供 [SingleProgram] 数据结构
  final SingleProgram oneProgram;

  const ProgramCard({super.key, required this.oneProgram});

  @override
  Widget build(BuildContext context) {
    final title = LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 8)
          return SizedBox(); // 避免 Padding 的 Overflow 错误

        return Row(
          mainAxisSize: .max,
          mainAxisAlignment: .start,
          crossAxisAlignment: .center,
          spacing: 8,
          children: [
            // Flexible(
            //   child: Image(
            //     image: MemoryImage(
            //       Uint8List.fromList(oneProgram.partof.studio.logo),
            //     ),
            //     height: Theme.of(context).textTheme.titleLarge?.fontSize,
            //     fit: .fitHeight,
            //     alignment: .centerLeft,
            //   ),
            // ),
            // Flexible(
            //   child: Text(
            //     oneProgram.partof.name,
            //     style: Theme.of(context).textTheme.titleMedium,
            //     overflow: .clip,
            //     softWrap: false,
            //     maxLines: 1,
            //   ),
            // ),
          ],
        );
      },
    ); // 构建标题

    final head = LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 8) return SizedBox(); // 顺应上面布局消失逻辑
        return Text(
          oneProgram.title,
          style: Theme.of(
            context,
          ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
          overflow: .ellipsis,
          softWrap: true,
          maxLines: 3,
        );
      },
    ); // 构建正文

    final image = ClipRRect(
      clipBehavior: .antiAlias,
      borderRadius: .circular(24),
      child: Image(
        image: MemoryImage(Uint8List.fromList(oneProgram.image)),
        width: 100,
        height: 100,
      ),
    ); // 构建图片

    // final difference = DateTime.now().difference(oneProgram.);
    // final timelabel = switch (difference.inHours) {
    //   < 24 => "${difference.inHours}小时前",
    //   _ => "${difference.inDays}天前",
    // };
    final tags = Row(
      mainAxisSize: .min,
      spacing: 4,
      children: [
        // if (oneProgram.partof.like)
        //   Chip(
        //     avatar: Icon(TablerIcons.heart_filled),
        //     label: const Text("我喜欢"),
        //   ),
        // if (oneProgram.favorite)
        //   Chip(
        //     avatar: const Icon(TablerIcons.tag_filled),
        //     label: const Text("已收藏"),
        //   ),
        // Chip(avatar: const Icon(TablerIcons.clock), label: Text(timelabel)),
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
        shape: RoundedRectangleBorder(borderRadius: .circular(25)),
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
                    child: Column(
                      crossAxisAlignment: .start,
                      spacing: 8,
                      children: [title, head],
                    ),
                  ),
                  image,
                ],
              ),
              const SizedBox(height: 16),
              Row(
                crossAxisAlignment: .center,
                children: [tags, const Spacer(), action],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProgramMasonryView extends StatelessWidget {
  const ProgramMasonryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: MasonryGridView.count(
        crossAxisCount: 4,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        itemBuilder: (context, index) {
          return Placeholder();
        },
      ),
    );
  }
}
