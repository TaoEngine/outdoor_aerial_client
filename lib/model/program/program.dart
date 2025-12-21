import 'package:flutter/material.dart';
import 'package:outdoor_aerial_client/model/program/status.dart';
import 'package:outdoor_aerial_client/model/program/type.dart';
import 'package:outdoor_aerial_client/model/program/weekday.dart';

@immutable
class Program {
  /// Outdoor Aerial 服务器分配给电台节目的 id
  final int id;

  /// 该电台节目隶属广播电台，通过 id 反查广播电台
  final int studio;

  /// 该电台节目的名称，比如 “快乐出发”
  final String name;

  /// 对该电台节目的长文本介绍（可选）
  final String? description;

  /// 用户是否喜欢该电台节目，若true则为用户订阅里面的节目，若false则为用户屏蔽这个节目（可选）
  final bool? like;

  /// 电台节目的类型，采用 [ProgramType] 区分类型，比如新闻、音乐、访谈、闲聊等
  final ProgramType type;

  /// 电台当前的播出状态，采用 [ProgramStatus] 标记状态，可标记为 “开播”、“重播” 和 “暂播”
  final ProgramStatus status;

  /// 电台节目的固定播出时间，比如节目8点半播出，此处就填写8时30分。采用 [TimeOfDay] 存储时间
  final TimeOfDay start;

  /// 电台节目的固定结束时间，比如节目10点半结束，此处就填写10时30分。采用 [TimeOfDay] 存储时间
  final TimeOfDay end;

  /// 该电台节目的主持人阵容，可以为多个，比如 “晏大胖”
  final List<String> hosts;

  /// 电台节目的固定播出日期，采用多个 [ProgramWeekday] 标记星期
  final List<ProgramWeekday> weekday;

  /// 电台节目数据模型
  const Program(
    this.id,
    this.name,
    this.description,
    this.studio,
    this.hosts,
    this.weekday,
    this.type,
    this.status,
    this.start,
    this.end,
    this.like,
  );
}
