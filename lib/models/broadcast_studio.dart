import 'dart:typed_data';

import 'package:flutter/material.dart';

@immutable
class BroadcastStudio {
  /// Outdoor Aerial 服务器给出的广播电台 ID
  final Uint8List id;

  /// 对该广播电台的介绍
  final String abstract;

  /// 广播电台的 Logo
  final ImageProvider logo;

  /// 广播电台的名称
  final String name;

  /// 广播电台的兆赫兹频率
  final double freq;

  /// 广播电台的广播时间
  final TimeOfDay start;

  /// 广播电台的晚安时间
  final TimeOfDay end;

  /// 用户是否喜爱该广播电台
  final bool like;

  /// 有关广播电台的数据模型
  const BroadcastStudio({
    required this.id,
    required this.logo,
    required this.abstract,
    required this.name,
    required this.freq,
    required this.start,
    required this.end,
    required this.like,
  });

  /// 从 Outdoor Aerial 服务器中获取广播电台信息并生成
  factory BroadcastStudio.fromProto(Int8List data) {
    return BroadcastStudio(
      id: Uint8List(20),
      logo: AssetImage("assets/ah929.png"),
      abstract: "听出无限欢乐，我要我的生活",
      name: "安徽生活广播",
      freq: 92.9,
      start: TimeOfDay(hour: 5, minute: 0),
      end: TimeOfDay(hour: 23, minute: 0),
      like: true,
    );
  }
}
