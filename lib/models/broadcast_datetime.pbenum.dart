// This is a generated file - do not edit.
//
// Generated from broadcast_datetime.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// 定义周数
class WeekdaysData extends $pb.ProtobufEnum {
  static const WeekdaysData MON =
      WeekdaysData._(0, _omitEnumNames ? '' : 'MON');
  static const WeekdaysData TUE =
      WeekdaysData._(1, _omitEnumNames ? '' : 'TUE');
  static const WeekdaysData WED =
      WeekdaysData._(2, _omitEnumNames ? '' : 'WED');
  static const WeekdaysData THU =
      WeekdaysData._(3, _omitEnumNames ? '' : 'THU');
  static const WeekdaysData FRI =
      WeekdaysData._(4, _omitEnumNames ? '' : 'FRI');
  static const WeekdaysData SAT =
      WeekdaysData._(5, _omitEnumNames ? '' : 'SAT');
  static const WeekdaysData SUN =
      WeekdaysData._(6, _omitEnumNames ? '' : 'SUN');

  static const $core.List<WeekdaysData> values = <WeekdaysData>[
    MON,
    TUE,
    WED,
    THU,
    FRI,
    SAT,
    SUN,
  ];

  static final $core.List<WeekdaysData?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 6);
  static WeekdaysData? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const WeekdaysData._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');
