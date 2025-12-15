// This is a generated file - do not edit.
//
// Generated from broadcast_program.proto.

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

@$core.Deprecated('Use broadcastProgramDescriptor instead')
const BroadcastProgram$json = {
  '1': 'BroadcastProgram',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    {'1': 'description', '3': 3, '4': 1, '5': 9, '10': 'description'},
    {'1': 'logo', '3': 4, '4': 1, '5': 12, '10': 'logo'},
    {
      '1': 'studio',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.models.BroadcastStudio',
      '10': 'studio'
    },
    {
      '1': 'date',
      '3': 6,
      '4': 3,
      '5': 14,
      '6': '.models.WeekdaysData',
      '10': 'date'
    },
    {
      '1': 'start',
      '3': 7,
      '4': 1,
      '5': 11,
      '6': '.models.TimeOfDayData',
      '10': 'start'
    },
    {
      '1': 'end',
      '3': 8,
      '4': 1,
      '5': 11,
      '6': '.models.TimeOfDayData',
      '10': 'end'
    },
    {'1': 'hosts', '3': 9, '4': 3, '5': 9, '10': 'hosts'},
    {'1': 'like', '3': 10, '4': 1, '5': 8, '10': 'like'},
  ],
};

/// Descriptor for `BroadcastProgram`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List broadcastProgramDescriptor = $convert.base64Decode(
    'ChBCcm9hZGNhc3RQcm9ncmFtEg4KAmlkGAEgASgFUgJpZBISCgRuYW1lGAIgASgJUgRuYW1lEi'
    'AKC2Rlc2NyaXB0aW9uGAMgASgJUgtkZXNjcmlwdGlvbhISCgRsb2dvGAQgASgMUgRsb2dvEi8K'
    'BnN0dWRpbxgFIAEoCzIXLm1vZGVscy5Ccm9hZGNhc3RTdHVkaW9SBnN0dWRpbxIoCgRkYXRlGA'
    'YgAygOMhQubW9kZWxzLldlZWtkYXlzRGF0YVIEZGF0ZRIrCgVzdGFydBgHIAEoCzIVLm1vZGVs'
    'cy5UaW1lT2ZEYXlEYXRhUgVzdGFydBInCgNlbmQYCCABKAsyFS5tb2RlbHMuVGltZU9mRGF5RG'
    'F0YVIDZW5kEhQKBWhvc3RzGAkgAygJUgVob3N0cxISCgRsaWtlGAogASgIUgRsaWtl');

@$core.Deprecated('Use singleProgramDescriptor instead')
const SingleProgram$json = {
  '1': 'SingleProgram',
  '2': [
    {
      '1': 'partof',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.models.BroadcastProgram',
      '10': 'partof'
    },
    {
      '1': 'time',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.models.DateData',
      '10': 'time'
    },
    {'1': 'title', '3': 3, '4': 1, '5': 9, '10': 'title'},
    {'1': 'abstract', '3': 4, '4': 1, '5': 9, '10': 'abstract'},
    {'1': 'image', '3': 5, '4': 1, '5': 12, '10': 'image'},
    {'1': 'favorite', '3': 6, '4': 1, '5': 8, '10': 'favorite'},
  ],
};

/// Descriptor for `SingleProgram`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List singleProgramDescriptor = $convert.base64Decode(
    'Cg1TaW5nbGVQcm9ncmFtEjAKBnBhcnRvZhgBIAEoCzIYLm1vZGVscy5Ccm9hZGNhc3RQcm9ncm'
    'FtUgZwYXJ0b2YSJAoEdGltZRgCIAEoCzIQLm1vZGVscy5EYXRlRGF0YVIEdGltZRIUCgV0aXRs'
    'ZRgDIAEoCVIFdGl0bGUSGgoIYWJzdHJhY3QYBCABKAlSCGFic3RyYWN0EhQKBWltYWdlGAUgAS'
    'gMUgVpbWFnZRIaCghmYXZvcml0ZRgGIAEoCFIIZmF2b3JpdGU=');
