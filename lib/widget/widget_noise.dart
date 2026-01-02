import 'dart:math';

import 'package:flutter/material.dart';

class NoisePainter extends CustomPainter {
  final BuildContext context;

  NoisePainter({required this.context});

  /// 随机数生成
  final Random _random = Random();

  @override
  void paint(Canvas canvas, Size size) {
    // 限定范围
    final maxWidth = size.width.round();
    final maxHeight = size.height.round();
    final maxDots = ((maxWidth * maxHeight / 2) * 0.1).round();

    final paint = Paint()
      ..color = Theme.of(context).colorScheme.secondary;

    for (var i = 0; i < maxDots; i++) {
      final x = _random.nextInt(maxWidth).toDouble();
      final y = _random.nextInt(maxHeight).toDouble();
      canvas.drawCircle(Offset(x, y), 1, paint);
    }
  }

  @override
  bool shouldRepaint(NoisePainter oldDelegate) => true;
}
