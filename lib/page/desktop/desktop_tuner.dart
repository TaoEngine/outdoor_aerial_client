import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:outdoor_aerial_client/widget/widget_noise.dart';

class DesktopTuner extends StatefulWidget {
  const DesktopTuner({super.key});

  @override
  State<DesktopTuner> createState() => _DesktopTunerState();
}

class _DesktopTunerState extends State<DesktopTuner>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    // 快速闪烁的效果动画用来模拟电视无信号的画面
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return CustomPaint(
            painter: NoisePainter(context: context),
            child: child,
          );
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 72),
              Transform.scale(
                scale: 3,
                child: const CircleAvatar(child: Icon(TablerIcons.antenna_off)),
              ),
              const SizedBox(height: 72),
              Text(
                '没有节目哦，搜台试试看',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
