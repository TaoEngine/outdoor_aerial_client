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
import 'package:outdoor_aerial_client/data/proto/build/google/type/timeofday.pb.dart'
    as pbtype;

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

  /// [RadioStation] 转 [RadioStationDB]
  ///
  /// 用于将广播电台信息存储到数据库中
  static RadioStationDB modelToDB(RadioStation station) {
    final language =
        '${station.language.languageCode}_${station.language.countryCode}';
    final start = TimeOfDayDB()
      ..hour = station.start.hour
      ..minute = station.start.minute;
    final end = TimeOfDayDB()
      ..hour = station.end.hour
      ..minute = station.end.minute;
    return RadioStationDB()
      ..id = station.id
      ..logo = station.logo.toList()
      ..banner = station.banner.toList()
      ..frequency = station.frequency
      ..name = station.name
      ..description = station.description
      ..institution = station.institution
      ..language = language
      ..social = station.social
      ..like = station.like
      ..start = start
      ..end = end
      ..type = station.type
      ..status = station.status;
  }

  /// [RadioStationPB] 转 [RadioStation]
  ///
  /// 用于将从服务器传回的广播电台信息呈现在组件上
  static RadioStation pbToModel(RadioStationPB pb) {
    final logo = Uint8List.fromList(pb.logo);
    final banner = Uint8List.fromList(pb.banner);
    final languageCode = pb.language.split('_');
    final language = Locale(languageCode[0], languageCode[1]);
    final start = TimeOfDay(hour: pb.start.hours, minute: pb.start.minutes);
    final end = TimeOfDay(hour: pb.end.hours, minute: pb.end.minutes);
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
    return RadioStation(
      id: pb.id,
      logo: logo,
      banner: banner,
      frequency: pb.frequency,
      name: pb.name,
      description: pb.description,
      institution: pb.institution,
      language: language,
      social: pb.social,
      like: pb.like,
      start: start,
      end: end,
      type: type,
      status: status,
    );
  }

  /// [RadioStation] 转 [RadioStationPB]
  ///
  /// 用于将编辑过的广播电台信息重新发送到服务器进行修改
  static RadioStationPB modelToPB(RadioStation station) {
    final language =
        '${station.language.languageCode}_${station.language.countryCode}';
    final start = pbtype.TimeOfDay()
      ..hours = station.start.hour
      ..minutes = station.start.minute;
    final end = pbtype.TimeOfDay()
      ..hours = station.end.hour
      ..minutes = station.end.minute;
    final type = switch (station.type) {
      StationType.integrate => StationTypePB.INTERGRATED,
      StationType.traffic => StationTypePB.TRAFFIC,
      StationType.music => StationTypePB.MUSIC,
      StationType.news => StationTypePB.NEWS,
      StationType.economy => StationTypePB.ECONOMY,
      StationType.sports => StationTypePB.SPORTS,
      StationType.educational => StationTypePB.EDUCATIONAL,
      StationType.science => StationTypePB.SCIENCE,
      StationType.international => StationTypePB.INTERNATIONAL,
      StationType.agricultural => StationTypePB.AGRICULTURAL,
      StationType.children => StationTypePB.CHILDREN,
      StationType.health => StationTypePB.HEALTH,
    };
    final status = switch (station.status) {
      StationStatus.onair => StationStatusPB.ONAIR,
      StationStatus.maintaining => StationStatusPB.MAINTAINING,
      StationStatus.offair => StationStatusPB.OFFAIR,
    };
    return RadioStationPB(
      id: station.id,
      logo: station.logo.toList(),
      banner: station.banner.toList(),
      frequency: station.frequency,
      name: station.name,
      description: station.description,
      institution: station.institution,
      language: language,
      social: station.social,
      like: station.like,
      start: start,
      end: end,
      type: type,
      status: status,
    );
  }
}
