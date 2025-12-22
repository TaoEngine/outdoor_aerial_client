// This is a generated file - do not edit.
//
// Generated from dataproto_type.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class StationTypePB extends $pb.ProtobufEnum {
  /// 综合台
  static const StationTypePB INTERGRATED =
      StationTypePB._(0, _omitEnumNames ? '' : 'INTERGRATED');

  /// 交通台
  static const StationTypePB TRAFFIC =
      StationTypePB._(1, _omitEnumNames ? '' : 'TRAFFIC');

  /// 音乐台
  static const StationTypePB MUSIC =
      StationTypePB._(2, _omitEnumNames ? '' : 'MUSIC');

  /// 新闻台
  static const StationTypePB NEWS =
      StationTypePB._(3, _omitEnumNames ? '' : 'NEWS');

  /// 经济台
  static const StationTypePB ECONOMY =
      StationTypePB._(4, _omitEnumNames ? '' : 'ECONOMY');

  /// 体育台
  static const StationTypePB SPORTS =
      StationTypePB._(5, _omitEnumNames ? '' : 'SPORTS');

  /// 教育台
  static const StationTypePB EDUCATIONAL =
      StationTypePB._(6, _omitEnumNames ? '' : 'EDUCATIONAL');

  /// 科学台
  static const StationTypePB SCIENCE =
      StationTypePB._(7, _omitEnumNames ? '' : 'SCIENCE');

  /// 国际台
  static const StationTypePB INTERNATIONAL =
      StationTypePB._(8, _omitEnumNames ? '' : 'INTERNATIONAL');

  /// 农业台
  static const StationTypePB AGRICULTURAL =
      StationTypePB._(9, _omitEnumNames ? '' : 'AGRICULTURAL');

  /// 少儿台
  static const StationTypePB CHILDREN =
      StationTypePB._(10, _omitEnumNames ? '' : 'CHILDREN');

  /// 健康台
  static const StationTypePB HEALTH =
      StationTypePB._(11, _omitEnumNames ? '' : 'HEALTH');

  static const $core.List<StationTypePB> values = <StationTypePB>[
    INTERGRATED,
    TRAFFIC,
    MUSIC,
    NEWS,
    ECONOMY,
    SPORTS,
    EDUCATIONAL,
    SCIENCE,
    INTERNATIONAL,
    AGRICULTURAL,
    CHILDREN,
    HEALTH,
  ];

  static final $core.List<StationTypePB?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 11);
  static StationTypePB? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const StationTypePB._(super.value, super.name);
}

class ProgramTypePB extends $pb.ProtobufEnum {
  /// / 综合节目，包含不止一个分类的节目
  static const ProgramTypePB PROGRAM_TYPE_INTEGRATE =
      ProgramTypePB._(0, _omitEnumNames ? '' : 'PROGRAM_TYPE_INTEGRATE');

  /// / 新闻节目，聚焦时事与政治的新闻类节目
  static const ProgramTypePB PROGRAM_TYPE_NEWS =
      ProgramTypePB._(1, _omitEnumNames ? '' : 'PROGRAM_TYPE_NEWS');

  /// / 音乐节目，纯粹播放音乐或对音乐进行点评的节目
  static const ProgramTypePB PROGRAM_TYPE_MUSIC =
      ProgramTypePB._(2, _omitEnumNames ? '' : 'PROGRAM_TYPE_MUSIC');

  /// / 播客节目，邀请嘉宾进行深度对话或者话题延申的节目
  static const ProgramTypePB PROGRAM_TYPE_PODCAST =
      ProgramTypePB._(3, _omitEnumNames ? '' : 'PROGRAM_TYPE_PODCAST');

  /// / 综艺节目，交流趣事讨论八卦或者主持人持续与听众进行互动的节目
  static const ProgramTypePB PROGRAM_TYPE_ENTERTAINMENT =
      ProgramTypePB._(4, _omitEnumNames ? '' : 'PROGRAM_TYPE_ENTERTAINMENT');

  /// / 体育节目，报道实况比赛或者分析赛点事件的节目
  static const ProgramTypePB PROGRAM_TYPE_SPORTS =
      ProgramTypePB._(5, _omitEnumNames ? '' : 'PROGRAM_TYPE_SPORTS');

  /// / 广播剧节目，音频小说或评书节目
  static const ProgramTypePB PROGRAM_TYPE_STORYTELLING =
      ProgramTypePB._(6, _omitEnumNames ? '' : 'PROGRAM_TYPE_STORYTELLING');

  /// / 教育节目，谈论家庭教育或孩子的心理问题或教育讲座节目
  static const ProgramTypePB PROGRAM_TYPE_EDUCATIONAL =
      ProgramTypePB._(7, _omitEnumNames ? '' : 'PROGRAM_TYPE_EDUCATIONAL');

  /// / 财经节目，解析今日股市或提供投资建议的节目
  static const ProgramTypePB PROGRAM_TYPE_FINANCE =
      ProgramTypePB._(8, _omitEnumNames ? '' : 'PROGRAM_TYPE_FINANCE');

  /// / 健康节目，与听众交流健身或养生知识的节目
  static const ProgramTypePB PROGRAM_TYPE_HEALTH =
      ProgramTypePB._(9, _omitEnumNames ? '' : 'PROGRAM_TYPE_HEALTH');

  static const $core.List<ProgramTypePB> values = <ProgramTypePB>[
    PROGRAM_TYPE_INTEGRATE,
    PROGRAM_TYPE_NEWS,
    PROGRAM_TYPE_MUSIC,
    PROGRAM_TYPE_PODCAST,
    PROGRAM_TYPE_ENTERTAINMENT,
    PROGRAM_TYPE_SPORTS,
    PROGRAM_TYPE_STORYTELLING,
    PROGRAM_TYPE_EDUCATIONAL,
    PROGRAM_TYPE_FINANCE,
    PROGRAM_TYPE_HEALTH,
  ];

  static final $core.List<ProgramTypePB?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 9);
  static ProgramTypePB? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const ProgramTypePB._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');
