import 'dart:typed_data';

import 'package:flutter/material.dart';

@immutable
class Episode {
  /// 本期电台节目隶属节目信息，通过 UUID 反查电台节目
  final Uint8List program;

  /// 本期电台节目的配图，通过 AI 结合这期节目的主题生成的配图，并且用于主页卡片的展示
  final Uint8List cover;

  /// 本期电台节目的主题，利用 AI 分析节目音频片段给出的本期节目主题
  final String title;

  /// 本期电台节目的摘要，利用 AI 分析节目音频片段给出的本期节目摘要
  final String abstract;

  /// 用户是否收藏本期节目
  final bool favorite;

  /// 本期电台节目的播出时间，比如本期节目在2025年12月18日上午8点半播出，
  /// 此处就填写2025年12月18日8时30分。采用 [DateTime] 存储时间
  final DateTime time;

  const Episode(
    this.program,
    this.cover,
    this.title,
    this.abstract,
    this.favorite,
    this.time,
  );
}
