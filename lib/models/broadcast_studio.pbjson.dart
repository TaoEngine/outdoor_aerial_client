// This is a generated file - do not edit.
//
// Generated from broadcast_studio.proto.

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

@$core.Deprecated('Use broadcastStudioDescriptor instead')
const BroadcastStudio$json = {
  '1': 'BroadcastStudio',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    {'1': 'description', '3': 3, '4': 1, '5': 9, '10': 'description'},
    {'1': 'logo', '3': 4, '4': 1, '5': 12, '10': 'logo'},
    {'1': 'freq', '3': 5, '4': 1, '5': 1, '10': 'freq'},
    {
      '1': 'start',
      '3': 6,
      '4': 1,
      '5': 11,
      '6': '.models.TimeOfDayData',
      '10': 'start'
    },
    {
      '1': 'end',
      '3': 7,
      '4': 1,
      '5': 11,
      '6': '.models.TimeOfDayData',
      '10': 'end'
    },
    {'1': 'like', '3': 8, '4': 1, '5': 8, '10': 'like'},
  ],
};

/// Descriptor for `BroadcastStudio`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List broadcastStudioDescriptor = $convert.base64Decode(
    'Cg9Ccm9hZGNhc3RTdHVkaW8SDgoCaWQYASABKAVSAmlkEhIKBG5hbWUYAiABKAlSBG5hbWUSIA'
    'oLZGVzY3JpcHRpb24YAyABKAlSC2Rlc2NyaXB0aW9uEhIKBGxvZ28YBCABKAxSBGxvZ28SEgoE'
    'ZnJlcRgFIAEoAVIEZnJlcRIrCgVzdGFydBgGIAEoCzIVLm1vZGVscy5UaW1lT2ZEYXlEYXRhUg'
    'VzdGFydBInCgNlbmQYByABKAsyFS5tb2RlbHMuVGltZU9mRGF5RGF0YVIDZW5kEhIKBGxpa2UY'
    'CCABKAhSBGxpa2U=');
