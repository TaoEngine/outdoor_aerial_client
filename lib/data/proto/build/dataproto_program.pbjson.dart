// This is a generated file - do not edit.
//
// Generated from dataproto_program.proto.

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

@$core.Deprecated('Use programPBDescriptor instead')
const ProgramPB$json = {
  '1': 'ProgramPB',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 13, '10': 'id'},
    {'1': 'studio', '3': 2, '4': 1, '5': 13, '10': 'studio'},
    {'1': 'name', '3': 3, '4': 1, '5': 9, '10': 'name'},
    {'1': 'description', '3': 4, '4': 1, '5': 9, '10': 'description'},
    {'1': 'like', '3': 5, '4': 1, '5': 8, '10': 'like'},
    {
      '1': 'type',
      '3': 6,
      '4': 1,
      '5': 14,
      '6': '.proto.ProgramTypePB',
      '10': 'type'
    },
    {
      '1': 'status',
      '3': 7,
      '4': 1,
      '5': 14,
      '6': '.proto.ProgramStatusPB',
      '10': 'status'
    },
    {
      '1': 'start',
      '3': 8,
      '4': 1,
      '5': 11,
      '6': '.google.type.TimeOfDay',
      '10': 'start'
    },
    {
      '1': 'end',
      '3': 9,
      '4': 1,
      '5': 11,
      '6': '.google.type.TimeOfDay',
      '10': 'end'
    },
    {'1': 'hosts', '3': 10, '4': 3, '5': 9, '10': 'hosts'},
    {
      '1': 'weekday',
      '3': 11,
      '4': 3,
      '5': 14,
      '6': '.proto.ProgramWeekdayPB',
      '10': 'weekday'
    },
  ],
};

/// Descriptor for `ProgramPB`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List programPBDescriptor = $convert.base64Decode(
    'CglQcm9ncmFtUEISDgoCaWQYASABKA1SAmlkEhYKBnN0dWRpbxgCIAEoDVIGc3R1ZGlvEhIKBG'
    '5hbWUYAyABKAlSBG5hbWUSIAoLZGVzY3JpcHRpb24YBCABKAlSC2Rlc2NyaXB0aW9uEhIKBGxp'
    'a2UYBSABKAhSBGxpa2USKAoEdHlwZRgGIAEoDjIULnByb3RvLlByb2dyYW1UeXBlUEJSBHR5cG'
    'USLgoGc3RhdHVzGAcgASgOMhYucHJvdG8uUHJvZ3JhbVN0YXR1c1BCUgZzdGF0dXMSLAoFc3Rh'
    'cnQYCCABKAsyFi5nb29nbGUudHlwZS5UaW1lT2ZEYXlSBXN0YXJ0EigKA2VuZBgJIAEoCzIWLm'
    'dvb2dsZS50eXBlLlRpbWVPZkRheVIDZW5kEhQKBWhvc3RzGAogAygJUgVob3N0cxIxCgd3ZWVr'
    'ZGF5GAsgAygOMhcucHJvdG8uUHJvZ3JhbVdlZWtkYXlQQlIHd2Vla2RheQ==');
