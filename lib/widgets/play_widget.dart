import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

class PlayStreamDesktop extends StatefulWidget {
  /// 在桌面端显示的串流页面测试
  ///
  /// 由于桌面端屏幕大，能展示许多东西，因此使用居中卡片布局放入所有播放组件，
  /// 并且卡片出现消失动画还能联动底部播放栏，当叉掉时卡片转换为底部操作栏
  const PlayStreamDesktop({super.key});

  @override
  State<PlayStreamDesktop> createState() => _PlayStreamDesktopState();
}

class PlayStreamMobile extends StatefulWidget {
  /// 节目名称
  final String programName;

  /// 节目标题
  ///
  /// 比如节目的Slogan
  /// 或者节目中的各个小主题
  /// 或者节目中播放的音乐
  final String programTitle;

  /// 节目主持人
  final String programHost;

  /// 节目所属广播电台
  final String programBroadcasting;

  /// 节目播出日期
  final List<DateTime> programDate;

  /// 节目播出时间
  final DateTimeRange<DateTime> programTime;

  /// 节目结束时的触发器
  ///
  /// 用于提醒客户端要更新现在的节目单了
  /// 当时间到的时候，一秒触发一次
  final VoidCallback onTimeReached;

  /// 在手机端显示的串流页面
  ///
  /// 由于手机端屏幕小，只够显示播放控件，因此只展示部分播放控件以Column布局呈现
  /// 并且与底部播放栏应少有动画，当显示串流页面时就应该隐藏底部操作栏
  const PlayStreamMobile({
    super.key,
    required this.programName,
    required this.programTitle,
    required this.programHost,
    required this.programBroadcasting,
    required this.programDate,
    required this.programTime,
    required this.onTimeReached,
  });

  @override
  State<PlayStreamMobile> createState() => _PlayStreamMobileState();
}

class TimeSlider extends StatefulWidget {
  final DateTimeRange programTimeRange;
  final Duration programTimeRefresh;
  final VoidCallback onTimeReached;
  const TimeSlider({
    super.key,
    required this.programTimeRange,
    this.programTimeRefresh = const Duration(seconds: 1),
    required this.onTimeReached,
  });

  @override
  State<TimeSlider> createState() => _TimeSliderState();
}

class _PlayStreamDesktopState extends State<PlayStreamDesktop> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class _PlayStreamMobileState extends State<PlayStreamMobile> {
  /// 是否选择录制此节目
  ///
  /// 如果启用了录制，节目将会录制在本机
  bool isRecording = false;

  /// 是否喜欢此节目
  ///
  /// 如果喜欢这个节目，它将会出现在 “我喜欢” 选单中
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.only(
        left: 60,
        right: 60,
        top: 40,
        bottom: 20,
      ),
      child: Flex(
        direction: Axis.vertical,
        children: [
          const Expanded(
            flex: 6,
            child: AspectRatio(aspectRatio: 1.0, child: Placeholder()),
          ),

          Expanded(
            flex: 3,
            child: Column(
              spacing: 5,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.programTitle,
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    TextButton.icon(
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all<Color>(
                          Theme.of(context).colorScheme.secondaryContainer,
                        ),
                        foregroundColor: WidgetStateProperty.all<Color>(
                          Theme.of(context).colorScheme.onSecondaryContainer,
                        ),
                      ),
                      onPressed: () => setState(() {
                        isFavorite = !isFavorite;
                      }),
                      icon: isFavorite
                          ? const Icon(TablerIcons.heart_filled)
                          : const Icon(TablerIcons.heart_plus),
                      label: isFavorite
                          ? const Text("已添加喜欢")
                          : const Text("喜欢此节目"),
                    ),
                  ],
                ),
                Text(
                  widget.programName,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                Row(
                  spacing: 5,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(TablerIcons.users_group, size: 20),
                    Text(
                      widget.programHost,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
                Row(
                  spacing: 5,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(TablerIcons.building_broadcast_tower, size: 20),
                    Text(
                      widget.programBroadcasting,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ],
            ),
          ),

          Expanded(
            flex: 2,
            child: Column(
              spacing: 10,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TimeSlider(
                  programTimeRange: widget.programTime,
                  onTimeReached: widget.onTimeReached,
                ),
              ],
            ),
          ),

          Expanded(
            flex: 2,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                "调频频率 | 音频采样率 | 实时流大小 | 信号值 | R-D-S 状态",
                style: Theme.of(context).textTheme.labelSmall,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _TimeSliderState extends State<TimeSlider> {
  late DateTimeRange _nowTimeRange;
  late Timer _programTimer;

  @override
  Widget build(BuildContext context) {
    // 生成一下进度条该有的进度
    final int nowtimeSpent = _nowTimeRange.duration.inMilliseconds;
    final int programSpent = widget.programTimeRange.duration.inMilliseconds;
    final double? indicatorValue = switch (nowtimeSpent / programSpent) {
      >= 1 => 1,
      <= 0 => null,
      _ => nowtimeSpent / programSpent,
    };

    // 生成一下
    final String startTimeTitle = tagGenerate(widget.programTimeRange.start);
    final String stopTimeTitle = tagGenerate(widget.programTimeRange.end);

    if (nowtimeSpent >= programSpent) widget.onTimeReached.call();
    return Column(
      spacing: 5,
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text("节目播出时间", style: Theme.of(context).textTheme.bodyMedium),
        SizedBox(
          width: 200,
          child: LinearProgressIndicator(
            minHeight: 10,
            borderRadius: BorderRadius.circular(25),
            value: indicatorValue,
            // ignore: deprecated_member_use
            year2023: false,
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(startTimeTitle, style: Theme.of(context).textTheme.bodySmall),
            Text(stopTimeTitle, style: Theme.of(context).textTheme.bodySmall),
          ],
        ),
      ],
    );
  }

  @override
  void dispose() {
    _programTimer.cancel();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _nowTimeRange = DateTimeRange(
      start: widget.programTimeRange.start,
      end: DateTime.now(),
    );
    _programTimer = Timer.periodic(
      widget.programTimeRefresh,
      (_) => setState(() {
        _nowTimeRange = DateTimeRange(
          start: widget.programTimeRange.start,
          end: DateTime.now(),
        );
      }),
    );
  }

  String tagGenerate(DateTime datetime) {
    String dateTag;
    dateTag = switch (datetime.hour) {
      <= 3 => "午夜",
      <= 6 => "凌晨",
      <= 8 => "早晨",
      <= 11 => "上午",
      <= 12 => "中午",
      <= 17 => "下午",
      <= 19 => "傍晚",
      <= 21 => "晚间",
      _ => "深夜",
    };
    dateTag +=
        " ${datetime.hour.toString().length == 1 ? "0${datetime.hour}" : datetime.hour}"
        ":${datetime.minute.toString().length == 1 ? "0${datetime.minute}" : datetime.minute}";

    return dateTag;
  }
}
