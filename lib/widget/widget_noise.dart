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

// class NoisePainter extends CustomPainter {
//   final Random _random = Random();

//   @override
//   void paint(Canvas canvas, Size size) {
//     final paint = Paint();

//     // 填充黑色背景
//     canvas.drawRect(Offset.zero & size, Paint()..color = Colors.black);

//     // 绘制雪花点
//     // 增加点数以获得更密集的视觉效果
//     for (int i = 0; i < 8000; i++) {
//       final colorValue = _random.nextInt(255);
//       paint.color = Color.fromARGB(
//         _random.nextInt(150) + 50, // 随机透明度增加层次感
//         colorValue,
//         colorValue,
//         colorValue,
//       );

//       final x = _random.nextDouble() * size.width;
//       final y = _random.nextDouble() * size.height;

//       // 使用微小的矩形模拟像素点
//       canvas.drawRect(Rect.fromLTWH(x, y, 1.5, 1.5), paint);
//     }
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
// }
