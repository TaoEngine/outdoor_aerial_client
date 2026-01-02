import 'dart:math';

import 'package:flutter/material.dart';

class NoisePainter extends CustomPainter {
  final BuildContext context;

  NoisePainter({required this.context});

  final Random _random = Random.secure();

  @override
  void paint(Canvas canvas, Size size) {
    // 限定范围
    final maxWidth = size.width.round();
    final maxHeight = size.height.round();
    final maxDots = ((maxWidth * maxHeight / 16) * 0.6).round();

    final backgroundPaint = Paint()
      ..color = Theme.of(context).colorScheme.secondaryContainer;
    final foregroundPaint = Paint()
      ..color = Theme.of(context).colorScheme.onPrimary;

    canvas.drawRect(Offset.zero & size, backgroundPaint);
    for (var i = 0; i < maxDots; i++) {
      final x = _random.nextInt(maxWidth).toDouble();
      final y = _random.nextInt(maxHeight).toDouble();
      canvas.drawRect(.fromLTWH(x, y, 4, 4), foregroundPaint);
    }
  }

  @override
  bool shouldRepaint(NoisePainter oldDelegate) => true;
}
