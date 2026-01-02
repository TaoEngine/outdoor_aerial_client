import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:outdoor_aerial_client/provider/provider_broadcast.dart';
import 'package:outdoor_aerial_client/widget/widget_player.dart';

import '../desktop/desktop_tuner.dart';

class DesktopMain extends ConsumerStatefulWidget {
  const DesktopMain({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DesktopMainState();
}

class _DesktopMainState extends ConsumerState<DesktopMain> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    final destinations = <Widget>[
      NavigationDrawerDestination(
        icon: Icon(TablerIcons.antenna),
        label: Text("调谐器", style: Theme.of(context).textTheme.labelLarge),
      ),
      NavigationDrawerDestination(
        icon: Icon(TablerIcons.heart),
        label: Text("我喜欢", style: Theme.of(context).textTheme.labelLarge),
      ),
      NavigationDrawerDestination(
        icon: Icon(TablerIcons.folder),
        label: Text("节目单", style: Theme.of(context).textTheme.labelLarge),
      ),
      NavigationDrawerDestination(
        icon: Icon(TablerIcons.settings),
        label: Text("改设置", style: Theme.of(context).textTheme.labelLarge),
      ),
    ];

    final header = Padding(
      padding: .all(4),
      child: ListTile(
        leading: Hero(
          tag: "logo",
          child: CircleAvatar(child: Icon(TablerIcons.antenna)),
        ),
        title: Text("室外天线", style: Theme.of(context).textTheme.titleLarge),
      ),
    );

    final player = Align(alignment: .bottomCenter, child: BottomPlayer());

    return Scaffold(
      body: Stack(
        children: [
          Row(
            children: [
              NavigationDrawer(
                onDestinationSelected: (value) {
                  setState(() {
                    _index = value;
                  });
                },
                selectedIndex: _index,
                header: header,
                children: destinations,
              ),
              Expanded(
                child: switch (_index) {
                  0 => const DesktopTuner(),
                  1 => const Placeholder(),
                  2 => const Placeholder(),
                  3 => const Placeholder(),
                  _ => const Placeholder(),
                },
              ),
            ],
          ),
          player,
        ],
      ),
    );
  }
}

class BottomPlayer extends ConsumerWidget {
  const BottomPlayer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isMuted = ref.watch(broadcastProvider);
    final notifier = ref.watch(broadcastProvider.notifier);
    return PlayerWidget(
      title: '无信号',
      onTap: () {},
      action: IconButton.outlined(
        onPressed: notifier.toggleMute,
        icon: switch (isMuted) {
          false => Icon(TablerIcons.volume),
          true => Icon(TablerIcons.volume_off),
        },
        tooltip: switch (isMuted) {
          false => '对电台静音',
          true => '取消电台静音',
        },
      ),
    );
  }
}
