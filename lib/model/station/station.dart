import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:outdoor_aerial_client/model/station/status.dart';
import 'package:outdoor_aerial_client/model/station/type.dart';

@immutable
class RadioStation {
  /// Outdoor Aerial 服务器分配给广播电台的 id
  final int id;

  /// 广播电台的 LOGO，将显示在播放器专辑、封面、首页中，和广播电台官方的宣发图一致
  final Uint8List logo;

  /// 广播电台的横幅，将用于标识节目卡片归属，需要透明 PNG 格式，内容从 LOGO 中选取非文字部分
  final Uint8List banner;

  /// 广播电台的频率，存储单位为 “兆赫兹”，比如 “90.8” 指 90.8MHz
  final double frequency;

  /// 该广播电台的名称，比如 “安徽交通广播”
  final String name;

  /// 对该广播电台的长文本介绍（可选）
  final String? description;

  /// 该广播电台所属单位，比如 “安徽广播电视台”
  final String institution;

  /// 该广播电台的播出语言，指定存储 ISO 标准地区代码方便解析，比如 “zh_CN”
  final String language;

  /// 该广播电台拥有的社媒账号，点击就能跳转到指定平台（可选）
  final String? social;

  /// 用户是否喜爱该广播电台
  final bool like;

  /// 广播电台的开播时间，比如广播电台在5点开台，此处就填写5时0分。采用 [TimeOfDay] 存储时间
  final TimeOfDay start;

  /// 广播电台的晚安时间，比如广播电台在23点晚安，此处就填写23时0分。采用 [TimeOfDay] 存储时间
  final TimeOfDay end;

  /// 广播电台的类型，采用 [StationType] 区分类型，比如交通、新闻、经济、综合等
  final StationType type;

  /// 广播电台当前的播出状态，采用 [StationStatus] 标识状态，可标记为 “广播中”、“停机检修” 和 “停播”
  final StationStatus status;

  /// 广播电台数据模型
  const RadioStation(
    this.id,
    this.logo,
    this.banner,
    this.frequency,
    this.name,
    this.description,
    this.institution,
    this.language,
    this.social,
    this.like,
    this.start,
    this.end,
    this.type,
    this.status,
  );
}
