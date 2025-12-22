// This is a generated file - do not edit.
//
// Generated from dataproto_status.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class StationStatusPB extends $pb.ProtobufEnum {
  /// 广播中
  static const StationStatusPB ONAIR =
      StationStatusPB._(0, _omitEnumNames ? '' : 'ONAIR');

  /// 停机检修
  static const StationStatusPB MAINTAINING =
      StationStatusPB._(1, _omitEnumNames ? '' : 'MAINTAINING');

  /// 电台停播
  static const StationStatusPB OFFAIR =
      StationStatusPB._(2, _omitEnumNames ? '' : 'OFFAIR');

  static const $core.List<StationStatusPB> values = <StationStatusPB>[
    ONAIR,
    MAINTAINING,
    OFFAIR,
  ];

  static final $core.List<StationStatusPB?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 2);
  static StationStatusPB? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const StationStatusPB._(super.value, super.name);
}

class ProgramStatusPB extends $pb.ProtobufEnum {
  /// / 开播的节目
  static const ProgramStatusPB LIVE =
      ProgramStatusPB._(0, _omitEnumNames ? '' : 'LIVE');

  /// / 重播的节目
  static const ProgramStatusPB REPLAY =
      ProgramStatusPB._(1, _omitEnumNames ? '' : 'REPLAY');

  /// / 暂播的节目
  static const ProgramStatusPB SUSPENDED =
      ProgramStatusPB._(2, _omitEnumNames ? '' : 'SUSPENDED');

  static const $core.List<ProgramStatusPB> values = <ProgramStatusPB>[
    LIVE,
    REPLAY,
    SUSPENDED,
  ];

  static final $core.List<ProgramStatusPB?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 2);
  static ProgramStatusPB? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const ProgramStatusPB._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');
