import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:go_router/go_router.dart';

class TunerPage extends StatefulWidget {
  const TunerPage({super.key});

  @override
  State<TunerPage> createState() => _TunerPageState();
}

class _TunerPageState extends State<TunerPage> {
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
    return Padding(
      padding: EdgeInsetsGeometry.only(left: 8, right: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        spacing: 10,
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(maxHeight: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: 10,
              children: [
                CircleAvatar(child: Icon(TablerIcons.mood_happy)),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 1,
                  children: [
                    Text("立即听", style: Theme.of(context).textTheme.bodyLarge),
                    Text("最近录制的标星节目", style: Theme.of(context).textTheme.bodySmall),
                  ],
                ),
              ],
            ),
          ),
          ConstrainedBox(
            constraints: BoxConstraints(maxHeight: 180),
            child: CarouselView.weighted(
              controller: __carouselController,
              flexWeights: [1, 6, 1],
              itemSnapping: true,
              children: <Widget>[
                Container(color: Colors.amber),
                Container(color: Colors.amber),
                Container(color: Colors.amber),
                Container(color: Colors.amber),
                Container(color: Colors.amber),
              ],
              onTap: (value) {
                __carouselController.animateToItem(value);
                if (__carouselPage == value) {
                  GoRouter.of(context).goNamed("ProgramPage");
                } else {
                  __carouselPage = value;
                }
              },
            ),
          ),
          Divider(),
        ],
      ),
    );
  }
}
