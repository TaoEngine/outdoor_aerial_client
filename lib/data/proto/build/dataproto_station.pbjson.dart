// This is a generated file - do not edit.
//
// Generated from dataproto_station.proto.

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

@$core.Deprecated('Use radioStationPBDescriptor instead')
const RadioStationPB$json = {
  '1': 'RadioStationPB',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
    {'1': 'logo', '3': 2, '4': 1, '5': 12, '10': 'logo'},
    {'1': 'banner', '3': 3, '4': 1, '5': 12, '10': 'banner'},
    {'1': 'frequency', '3': 4, '4': 1, '5': 1, '10': 'frequency'},
    {'1': 'name', '3': 5, '4': 1, '5': 9, '10': 'name'},
    {'1': 'description', '3': 6, '4': 1, '5': 9, '10': 'description'},
    {'1': 'institution', '3': 7, '4': 1, '5': 9, '10': 'institution'},
    {'1': 'language', '3': 8, '4': 1, '5': 9, '10': 'language'},
    {'1': 'social', '3': 9, '4': 1, '5': 9, '10': 'social'},
    {'1': 'like', '3': 10, '4': 1, '5': 8, '10': 'like'},
    {
      '1': 'start',
      '3': 11,
      '4': 1,
      '5': 11,
      '6': '.google.type.TimeOfDay',
      '10': 'start'
    },
    {
      '1': 'end',
      '3': 12,
      '4': 1,
      '5': 11,
      '6': '.google.type.TimeOfDay',
      '10': 'end'
    },
    {
      '1': 'type',
      '3': 13,
      '4': 1,
      '5': 14,
      '6': '.proto.StationTypePB',
      '10': 'type'
    },
    {
      '1': 'status',
      '3': 14,
      '4': 1,
      '5': 14,
      '6': '.proto.StationStatusPB',
      '10': 'status'
    },
  ],
};

/// Descriptor for `RadioStationPB`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List radioStationPBDescriptor = $convert.base64Decode(
    'Cg5SYWRpb1N0YXRpb25QQhIOCgJpZBgBIAEoBVICaWQSEgoEbG9nbxgCIAEoDFIEbG9nbxIWCg'
    'ZiYW5uZXIYAyABKAxSBmJhbm5lchIcCglmcmVxdWVuY3kYBCABKAFSCWZyZXF1ZW5jeRISCgRu'
    'YW1lGAUgASgJUgRuYW1lEiAKC2Rlc2NyaXB0aW9uGAYgASgJUgtkZXNjcmlwdGlvbhIgCgtpbn'
    'N0aXR1dGlvbhgHIAEoCVILaW5zdGl0dXRpb24SGgoIbGFuZ3VhZ2UYCCABKAlSCGxhbmd1YWdl'
    'EhYKBnNvY2lhbBgJIAEoCVIGc29jaWFsEhIKBGxpa2UYCiABKAhSBGxpa2USLAoFc3RhcnQYCy'
    'ABKAsyFi5nb29nbGUudHlwZS5UaW1lT2ZEYXlSBXN0YXJ0EigKA2VuZBgMIAEoCzIWLmdvb2ds'
    'ZS50eXBlLlRpbWVPZkRheVIDZW5kEigKBHR5cGUYDSABKA4yFC5wcm90by5TdGF0aW9uVHlwZV'
    'BCUgR0eXBlEi4KBnN0YXR1cxgOIAEoDjIWLnByb3RvLlN0YXRpb25TdGF0dXNQQlIGc3RhdHVz');
