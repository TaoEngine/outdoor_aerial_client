import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

class BottomPlayWidget extends StatelessWidget {
  /// 节目的主标题，包括 Slogan 或者歌曲的名称
  final String title;

  /// 节目名称
  final String? name;

  /// 电台名称
  final String? station;

  /// 节目播出进度
  final double? progress;

  /// 可选描述节目的图片
  final Widget? cover;

  /// 点击播放器需要做的事情
  final VoidCallback onTap;

  /// 按下停止键需要做的事情
  final VoidCallback onStopButtomTap;

  /// 底部播放器组件
  const BottomPlayWidget({
    super.key,
    this.name,
    this.station,
    this.cover,
    this.progress,
    required this.title,
    required this.onTap,
    required this.onStopButtomTap,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: 100,
        maxWidth: switch (MediaQuery.sizeOf(context).width) {
          >= 500 => 500,
          final width => width,
        },
      ),
      child: Padding(
        padding: .all(10),
        child: Card.filled(
          color: Theme.of(context).colorScheme.secondaryContainer,
          clipBehavior: .antiAlias,
          child: InkWell(
            onTap: onTap,
            child: Stack(
              children: [
                FractionallySizedBox(
                  alignment: .centerLeft,
                  widthFactor: progress ?? 1.0,
                  child: Ink(
                    color: Theme.of(context).colorScheme.tertiaryContainer,
                  ),
                ),
                Row(
                  mainAxisAlignment: .start,
                  mainAxisSize: .max,
                  crossAxisAlignment: .center,
                  children: [
                    Padding(
                      padding: .all(5),
                      child: ClipRRect(
                        clipBehavior: .antiAlias,
                        borderRadius: .circular(10),
                        child: AspectRatio(
                          aspectRatio: 1,
                          child:
                              cover ??
                              Center(child: Icon(TablerIcons.antenna_off)),
                        ),
                      ),
                    ),
                    Padding(
                      padding: .only(left: 15, right: 15),
                      child: Column(
                        spacing: 5,
                        mainAxisAlignment: .center,
                        crossAxisAlignment: .start,
                        children: [
                          Text(
                            title,
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          if (name != null && station != null)
                            Text(
                              "$name | $station",
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
                Align(
                  alignment: .centerRight,
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: Center(
                      child: IconButton.outlined(
                        onPressed: () => onStopButtomTap.call(),
                        icon: Icon(TablerIcons.volume_off),
                        tooltip: "电台静音",
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
