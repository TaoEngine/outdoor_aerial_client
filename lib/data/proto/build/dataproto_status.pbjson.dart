// This is a generated file - do not edit.
//
// Generated from dataproto_status.proto.

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

@$core.Deprecated('Use stationStatusPBDescriptor instead')
const StationStatusPB$json = {
  '1': 'StationStatusPB',
  '2': [
    {'1': 'ONAIR', '2': 0},
    {'1': 'MAINTAINING', '2': 1},
    {'1': 'OFFAIR', '2': 2},
  ],
};

/// Descriptor for `StationStatusPB`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List stationStatusPBDescriptor = $convert.base64Decode(
    'Cg9TdGF0aW9uU3RhdHVzUEISCQoFT05BSVIQABIPCgtNQUlOVEFJTklORxABEgoKBk9GRkFJUh'
    'AC');

@$core.Deprecated('Use programStatusPBDescriptor instead')
const ProgramStatusPB$json = {
  '1': 'ProgramStatusPB',
  '2': [
    {'1': 'LIVE', '2': 0},
    {'1': 'REPLAY', '2': 1},
    {'1': 'SUSPENDED', '2': 2},
  ],
};

/// Descriptor for `ProgramStatusPB`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List programStatusPBDescriptor = $convert.base64Decode(
    'Cg9Qcm9ncmFtU3RhdHVzUEISCAoETElWRRAAEgoKBlJFUExBWRABEg0KCVNVU1BFTkRFRBAC');
