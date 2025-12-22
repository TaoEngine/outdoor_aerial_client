import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:outdoor_aerial_client/data/base/database_station.dart';
import 'package:outdoor_aerial_client/data/base/database_timeofday.dart';
import 'package:outdoor_aerial_client/data/model/datamodel_station.dart';
import 'package:outdoor_aerial_client/data/model/datamodel_status.dart';
import 'package:outdoor_aerial_client/data/model/datamodel_type.dart';
import 'package:outdoor_aerial_client/data/proto/build/dataproto_station.pb.dart';
import 'package:outdoor_aerial_client/data/proto/build/dataproto_status.pbenum.dart';
import 'package:outdoor_aerial_client/data/proto/build/dataproto_type.pbenum.dart';

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

  /// [RadioStationPB] 转 [RadioStationDB]
  ///
  /// 用于将从服务器传回的广播电台信息存储在数据库上
  static RadioStationDB pbToDB(RadioStationPB pb) {
    final start = TimeOfDayDB()
      ..hour = pb.start.hours
      ..minute = pb.start.minutes;
    final end = TimeOfDayDB()
      ..hour = pb.end.hours
      ..minute = pb.end.minutes;
    final type = switch (pb.type) {
      StationTypePB.INTERGRATED => StationType.integrate,
      StationTypePB.TRAFFIC => StationType.traffic,
      StationTypePB.MUSIC => StationType.music,
      StationTypePB.NEWS => StationType.news,
      StationTypePB.ECONOMY => StationType.economy,
      StationTypePB.SPORTS => StationType.sports,
      StationTypePB.EDUCATIONAL => StationType.educational,
      StationTypePB.SCIENCE => StationType.science,
      StationTypePB.INTERNATIONAL => StationType.international,
      StationTypePB.AGRICULTURAL => StationType.agricultural,
      StationTypePB.CHILDREN => StationType.children,
      StationTypePB.HEALTH => StationType.health,
      _ => StationType.integrate,
    };
    final status = switch (pb.status) {
      StationStatusPB.ONAIR => StationStatus.onair,
      StationStatusPB.MAINTAINING => StationStatus.maintaining,
      StationStatusPB.OFFAIR => StationStatus.offair,
      _ => StationStatus.offair,
    };
    return RadioStationDB()
      ..id = pb.id
      ..logo = pb.logo
      ..banner = pb.banner
      ..frequency = pb.frequency
      ..name = pb.name
      ..description = pb.description
      ..institution = pb.institution
      ..language = pb.language
      ..social = pb.social
      ..like = pb.like
      ..start = start
      ..end = end
      ..type = type
      ..status = status;
  }
}
