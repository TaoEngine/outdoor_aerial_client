// This is a generated file - do not edit.
//
// Generated from dataproto_weekday.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// 定义周数
class ProgramWeekdayPB extends $pb.ProtobufEnum {
  /// 周一
  static const ProgramWeekdayPB MON =
      ProgramWeekdayPB._(0, _omitEnumNames ? '' : 'MON');

  /// 周二
  static const ProgramWeekdayPB TUE =
      ProgramWeekdayPB._(1, _omitEnumNames ? '' : 'TUE');

  /// 周三
  static const ProgramWeekdayPB WED =
      ProgramWeekdayPB._(2, _omitEnumNames ? '' : 'WED');

  /// 周四
  static const ProgramWeekdayPB THU =
      ProgramWeekdayPB._(3, _omitEnumNames ? '' : 'THU');

  /// 周五
  static const ProgramWeekdayPB FRI =
      ProgramWeekdayPB._(4, _omitEnumNames ? '' : 'FRI');

  /// 周六
  static const ProgramWeekdayPB SAT =
      ProgramWeekdayPB._(5, _omitEnumNames ? '' : 'SAT');

  /// 周日
  static const ProgramWeekdayPB SUN =
      ProgramWeekdayPB._(6, _omitEnumNames ? '' : 'SUN');

  static const $core.List<ProgramWeekdayPB> values = <ProgramWeekdayPB>[
    MON,
    TUE,
    WED,
    THU,
    FRI,
    SAT,
    SUN,
  ];

  static final $core.List<ProgramWeekdayPB?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 6);
  static ProgramWeekdayPB? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const ProgramWeekdayPB._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');
