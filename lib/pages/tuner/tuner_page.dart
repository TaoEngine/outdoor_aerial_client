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
    return ListView(children: [SelectionProgramTitle(), SelectionProgramView(), Divider(), FavoriteProgramTitle()]);
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
