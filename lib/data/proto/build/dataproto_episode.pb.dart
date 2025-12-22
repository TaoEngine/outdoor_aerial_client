// This is a generated file - do not edit.
//
// Generated from dataproto_episode.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'google/type/date.pb.dart' as $0;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

class EpisodePB extends $pb.GeneratedMessage {
  factory EpisodePB({
    $core.int? program,
    $core.List<$core.int>? cover,
    $core.String? title,
    $core.String? abstract,
    $core.List<$core.int>? favorite,
    $0.Date? time,
  }) {
    final result = create();
    if (program != null) result.program = program;
    if (cover != null) result.cover = cover;
    if (title != null) result.title = title;
    if (abstract != null) result.abstract = abstract;
    if (favorite != null) result.favorite = favorite;
    if (time != null) result.time = time;
    return result;
  }

  EpisodePB._();

  factory EpisodePB.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory EpisodePB.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'EpisodePB',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'program', fieldType: $pb.PbFieldType.OU3)
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'cover', $pb.PbFieldType.OY)
    ..aOS(3, _omitFieldNames ? '' : 'title')
    ..aOS(4, _omitFieldNames ? '' : 'abstract')
    ..a<$core.List<$core.int>>(
        5, _omitFieldNames ? '' : 'favorite', $pb.PbFieldType.OY)
    ..aOM<$0.Date>(6, _omitFieldNames ? '' : 'time', subBuilder: $0.Date.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  EpisodePB clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  EpisodePB copyWith(void Function(EpisodePB) updates) =>
      super.copyWith((message) => updates(message as EpisodePB)) as EpisodePB;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static EpisodePB create() => EpisodePB._();
  @$core.override
  EpisodePB createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static EpisodePB getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<EpisodePB>(create);
  static EpisodePB? _defaultInstance;

  /// 本期电台节目隶属节目信息，通过 id 反查电台节目
  @$pb.TagNumber(1)
  $core.int get program => $_getIZ(0);
  @$pb.TagNumber(1)
  set program($core.int value) => $_setUnsignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasProgram() => $_has(0);
  @$pb.TagNumber(1)
  void clearProgram() => $_clearField(1);

  /// 本期电台节目的配图，通过 AI 结合这期节目的主题生成的配图，并且用于主页卡片的展示
  @$pb.TagNumber(2)
  $core.List<$core.int> get cover => $_getN(1);
  @$pb.TagNumber(2)
  set cover($core.List<$core.int> value) => $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasCover() => $_has(1);
  @$pb.TagNumber(2)
  void clearCover() => $_clearField(2);

  /// 本期电台节目的主题，利用 AI 分析节目音频片段给出的本期节目主题
  @$pb.TagNumber(3)
  $core.String get title => $_getSZ(2);
  @$pb.TagNumber(3)
  set title($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasTitle() => $_has(2);
  @$pb.TagNumber(3)
  void clearTitle() => $_clearField(3);

  /// 本期电台节目的摘要，利用 AI 分析节目音频片段给出的本期节目摘要
  @$pb.TagNumber(4)
  $core.String get abstract => $_getSZ(3);
  @$pb.TagNumber(4)
  set abstract($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasAbstract() => $_has(3);
  @$pb.TagNumber(4)
  void clearAbstract() => $_clearField(4);

  /// 用户是否收藏本期节目
  @$pb.TagNumber(5)
  $core.List<$core.int> get favorite => $_getN(4);
  @$pb.TagNumber(5)
  set favorite($core.List<$core.int> value) => $_setBytes(4, value);
  @$pb.TagNumber(5)
  $core.bool hasFavorite() => $_has(4);
  @$pb.TagNumber(5)
  void clearFavorite() => $_clearField(5);

  /// 本期电台节目的播出时间，比如本期节目在2025年12月18日上午8点半播出
  /// 此处就填写2025年12月18日8时30分
  @$pb.TagNumber(6)
  $0.Date get time => $_getN(5);
  @$pb.TagNumber(6)
  set time($0.Date value) => $_setField(6, value);
  @$pb.TagNumber(6)
  $core.bool hasTime() => $_has(5);
  @$pb.TagNumber(6)
  void clearTime() => $_clearField(6);
  @$pb.TagNumber(6)
  $0.Date ensureTime() => $_ensure(5);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
