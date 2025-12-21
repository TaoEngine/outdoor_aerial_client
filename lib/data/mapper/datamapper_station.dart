import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:outdoor_aerial_client/data/base/database_program.dart';
import 'package:outdoor_aerial_client/data/base/database_station.dart';
import 'package:outdoor_aerial_client/data/model/datamodel_program.dart';
import 'package:outdoor_aerial_client/data/model/datamodel_station.dart';

/// 广播电台数据结构转换器
class RadioStationMapper {
  /// [RadioStationDB] 转 [RadioStation]
  ///
  /// 用于将数据库的广播电台信息呈现在组件上
  static RadioStation dbToModel(RadioStationDB db) {
    final logo = Uint8List.fromList(db.logo);
    final banner = Uint8List.fromList(db.banner);
    final languageCode = db.language.split('_');
    final language = Locale(languageCode[0], languageCode[1]);
    final start = TimeOfDay(hour: db.start.hour, minute: db.start.minute);
    final end = TimeOfDay(hour: db.end.hour, minute: db.end.minute);
    return RadioStation(
      id: db.id,
      logo: logo,
      banner: banner,
      frequency: db.frequency,
      name: db.name,
      description: db.description,
      institution: db.institution,
      language: language,
      social: db.social,
      like: db.like,
      start: start,
      end: end,
      type: db.type,
      status: db.status,
    );
  }
}
