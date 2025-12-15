// This is a generated file - do not edit.
//
// Generated from broadcast_datetime.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports
// ignore_for_file: unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use weekdaysDataDescriptor instead')
const WeekdaysData$json = {
  '1': 'WeekdaysData',
  '2': [
    {'1': 'MON', '2': 0},
    {'1': 'TUE', '2': 1},
    {'1': 'WED', '2': 2},
    {'1': 'THU', '2': 3},
    {'1': 'FRI', '2': 4},
    {'1': 'SAT', '2': 5},
    {'1': 'SUN', '2': 6},
  ],
};

/// Descriptor for `WeekdaysData`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List weekdaysDataDescriptor = $convert.base64Decode(
    'CgxXZWVrZGF5c0RhdGESBwoDTU9OEAASBwoDVFVFEAESBwoDV0VEEAISBwoDVEhVEAMSBwoDRl'
    'JJEAQSBwoDU0FUEAUSBwoDU1VOEAY=');

@$core.Deprecated('Use timeOfDayDataDescriptor instead')
const TimeOfDayData$json = {
  '1': 'TimeOfDayData',
  '2': [
    {'1': 'hours', '3': 1, '4': 1, '5': 5, '10': 'hours'},
    {'1': 'minutes', '3': 2, '4': 1, '5': 5, '10': 'minutes'},
  ],
};

/// Descriptor for `TimeOfDayData`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List timeOfDayDataDescriptor = $convert.base64Decode(
    'Cg1UaW1lT2ZEYXlEYXRhEhQKBWhvdXJzGAEgASgFUgVob3VycxIYCgdtaW51dGVzGAIgASgFUg'
    'dtaW51dGVz');

@$core.Deprecated('Use dateDataDescriptor instead')
const DateData$json = {
  '1': 'DateData',
  '2': [
    {'1': 'year', '3': 1, '4': 1, '5': 5, '10': 'year'},
    {'1': 'month', '3': 2, '4': 1, '5': 5, '10': 'month'},
    {'1': 'day', '3': 3, '4': 1, '5': 5, '10': 'day'},
  ],
};

/// Descriptor for `DateData`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List dateDataDescriptor = $convert.base64Decode(
    'CghEYXRlRGF0YRISCgR5ZWFyGAEgASgFUgR5ZWFyEhQKBW1vbnRoGAIgASgFUgVtb250aBIQCg'
    'NkYXkYAyABKAVSA2RheQ==');
