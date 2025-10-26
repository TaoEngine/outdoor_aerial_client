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
        SelectionProgramTitle(),
        SelectionProgramView(),
        Divider(),
        FavoriteProgramTitle(),
        Padding(padding: const EdgeInsets.all(10), child: FavoriteProgramView()),
      ],
    );
  }
}

class SelectionProgramTitle extends StatelessWidget {
  const SelectionProgramTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 10,
        children: [
          CircleAvatar(child: Icon(TablerIcons.robot)),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 1,
            children: [
              Text("立即听", style: Theme.of(context).textTheme.bodyLarge),
              Text("交由我们推荐的节目", style: Theme.of(context).textTheme.bodySmall),
            ],
          ),
        ],
      ),
    );
  }
}

class SelectionProgramView extends StatefulWidget {
  const SelectionProgramView({super.key});

  @override
  State<SelectionProgramView> createState() => _SelectionProgramViewState();
}

class _SelectionProgramViewState extends State<SelectionProgramView> {
  late final CarouselController __carouselController;
  int __carouselPage = 0;

  @override
  void initState() {
    super.initState();
    __carouselController = CarouselController(initialItem: 5);
  }

  @override
  void dispose() {
    __carouselController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: 180),
      child: CarouselView.weighted(
        controller: __carouselController,
        flexWeights: [1, 6, 1],
        itemSnapping: true,
        children: List.generate(5, (int index) {
          return Card.filled(clipBehavior: Clip.antiAlias, child: Center());
        }),
        onTap: (value) {
          __carouselController.animateToItem(value);
          if (__carouselPage == value) {
            GoRouter.of(context).goNamed("ProgramPage");
          } else {
            __carouselPage = value;
          }
        },
      ),
    );
  }
}

class FavoriteProgramTitle extends StatelessWidget {
  const FavoriteProgramTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 10,
        children: [
          CircleAvatar(child: Icon(TablerIcons.mood_heart)),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 1,
            children: [
              Text("选着听", style: Theme.of(context).textTheme.bodyLarge),
              Text("由你收藏过的节目", style: Theme.of(context).textTheme.bodySmall),
            ],
          ),
        ],
      ),
    );
  }
}

class FavoriteProgramView extends StatelessWidget {
  const FavoriteProgramView({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 20,
      crossAxisSpacing: 20,
      childAspectRatio: 1,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: List.generate(1, (int index) {
        return Card.outlined(
          clipBehavior: Clip.antiAlias,
          child: InkWell(
            onTap: () {
              // TODO 点击卡片转至详情
              GoRouter.of(context).goNamed("PlayPage");
            },
            child: Stack(
              children: [
                Ink.image(
                  image: NetworkImage(
                    "https://ytmedia.radio.cn/CCYT%2F202407%2F23%2F21%2FqrAYKFsw1eT1zBqivRaAw7wqDTub9JBBRe2024072321762.PNG",
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: EdgeInsetsGeometry.all(10),
                    child: Text(
                      "话题：ABCDEFG",
                      style: Theme.of(
                        context,
                      ).textTheme.displaySmall?.copyWith(color: Theme.of(context).colorScheme.primaryContainer),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: EdgeInsetsGeometry.all(10),
                    child: IconButton.filledTonal(
                      onPressed: () {
                        // TODO 点击按钮播放节目
                      },
                      icon: Icon(TablerIcons.player_play),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
