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

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'broadcast_datetime.pbenum.dart';

/// 定义时间
class TimeOfDayData extends $pb.GeneratedMessage {
  factory TimeOfDayData({
    $core.int? hours,
    $core.int? minutes,
  }) {
    final result = create();
    if (hours != null) result.hours = hours;
    if (minutes != null) result.minutes = minutes;
    return result;
  }

  TimeOfDayData._();

  factory TimeOfDayData.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory TimeOfDayData.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TimeOfDayData',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'models'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'hours')
    ..aI(2, _omitFieldNames ? '' : 'minutes')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TimeOfDayData clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TimeOfDayData copyWith(void Function(TimeOfDayData) updates) =>
      super.copyWith((message) => updates(message as TimeOfDayData))
          as TimeOfDayData;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TimeOfDayData create() => TimeOfDayData._();
  @$core.override
  TimeOfDayData createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static TimeOfDayData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TimeOfDayData>(create);
  static TimeOfDayData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get hours => $_getIZ(0);
  @$pb.TagNumber(1)
  set hours($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasHours() => $_has(0);
  @$pb.TagNumber(1)
  void clearHours() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get minutes => $_getIZ(1);
  @$pb.TagNumber(2)
  set minutes($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasMinutes() => $_has(1);
  @$pb.TagNumber(2)
  void clearMinutes() => $_clearField(2);
}

/// 定义日期
class DateData extends $pb.GeneratedMessage {
  factory DateData({
    $core.int? year,
    $core.int? month,
    $core.int? day,
  }) {
    final result = create();
    if (year != null) result.year = year;
    if (month != null) result.month = month;
    if (day != null) result.day = day;
    return result;
  }

  DateData._();

  factory DateData.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DateData.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DateData',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'models'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'year')
    ..aI(2, _omitFieldNames ? '' : 'month')
    ..aI(3, _omitFieldNames ? '' : 'day')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DateData clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DateData copyWith(void Function(DateData) updates) =>
      super.copyWith((message) => updates(message as DateData)) as DateData;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DateData create() => DateData._();
  @$core.override
  DateData createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static DateData getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DateData>(create);
  static DateData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get year => $_getIZ(0);
  @$pb.TagNumber(1)
  set year($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasYear() => $_has(0);
  @$pb.TagNumber(1)
  void clearYear() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get month => $_getIZ(1);
  @$pb.TagNumber(2)
  set month($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasMonth() => $_has(1);
  @$pb.TagNumber(2)
  void clearMonth() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get day => $_getIZ(2);
  @$pb.TagNumber(3)
  set day($core.int value) => $_setSignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasDay() => $_has(2);
  @$pb.TagNumber(3)
  void clearDay() => $_clearField(3);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
