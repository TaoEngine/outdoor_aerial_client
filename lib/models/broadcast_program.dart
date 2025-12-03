import 'dart:typed_data';

import 'package:flutter/material.dart';

import 'package:outdoor_aerial_client/models/broadcast_studio.dart';

/// 定义节目播出时间
enum ProgramBroadcastWeekdays { monday, tuesday, wednesday, thursday, friday, saturday, sunday }

@immutable
class BroadcastProgram {
  /// Outdoor Aerial 服务器给出的电台节目 ID
  final ByteData id;

  /// 电台节目的 Logo
  final ImageProvider logo;

  /// 电台节目的名称
  final String name;

  /// 电台节目的所属广播电台
  final BroadcastStudio studio;

  /// 电台节目的固定播出日期
  final List<ProgramBroadcastWeekdays> date;

  /// 电台节目的固定播出时间
  final TimeOfDay start;

  /// 电台节目的固定结束时间
  final TimeOfDay end;

  /// 电台节目的主持人
  final List<String> hosts;

  /// 有关电台节目的数据模型
  const BroadcastProgram({
    required this.id,
    required this.logo,
    required this.name,
    required this.studio,
    required this.date,
    required this.start,
    required this.end,
    required this.hosts,
  });
}

@immutable
class TodayBroadcastProgram extends BroadcastProgram {
  /// 本期电台节目的讲述主题
  final String theme;

  /// 有关本期电台节目的数据模型
  const TodayBroadcastProgram({
    required super.id,
    required super.logo,
    required super.name,
    required super.studio,
    required super.date,
    required super.start,
    required super.end,
    required super.hosts,
    required this.theme,
  });
}
