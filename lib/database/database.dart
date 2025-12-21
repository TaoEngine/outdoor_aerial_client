import 'package:flutter/material.dart' show TimeOfDay;
import 'package:isar_community/isar.dart';
import 'package:outdoor_aerial_client/model/program/program.dart';
import 'package:outdoor_aerial_client/model/program/status.dart';
import 'package:outdoor_aerial_client/model/program/type.dart';
import 'package:outdoor_aerial_client/model/station/station.dart';
import 'package:outdoor_aerial_client/model/station/status.dart';
import 'package:outdoor_aerial_client/model/station/type.dart';
import 'package:outdoor_aerial_client/model/program/weekday.dart';

part 'database.g.dart';

/// 将 [RadioStation] 存储到数据库的数据结构
@collection
class RadioStationDB {
  /// 参考 [RadioStation.id]
  late Id id;

  /// 参考 [RadioStation.logo]
  late List<int> logo;

  /// 参考 [RadioStation.banner]
  late List<int> banner;

  /// 参考 [RadioStation.frequency]
  late double frequency;

  /// 参考 [RadioStation.name]
  late String name;

  /// 参考 [RadioStation.description]
  String? description;

  /// 参考 [RadioStation.institution]
  late String institution;

  /// 参考 [RadioStation.language]
  late String language;

  /// 参考 [RadioStation.social]
  late String? social;

  /// 参考 [RadioStation.like]
  late bool? like;

  /// 参考 [RadioStation.start] 需用 [TimeOfDayDB] 代为存储 [TimeOfDay]
  late TimeOfDayDB start;

  /// 参考 [RadioStation.end] 需用 [TimeOfDayDB] 代为存储 [TimeOfDay]
  late TimeOfDayDB end;

  /// 参考 [RadioStation.type]
  @enumerated
  late StationType type;

  /// 参考 [RadioStation.status]
  @enumerated
  late StationStatus status;
}

/// 将 [Program] 存储到数据库的数据结构
@collection
class ProgramDB {
  /// 参考 [Program.id]
  late Id id;

  /// 参考 [Program.studio]
  late int studio;

  /// 参考 [Program.name]
  late String name;

  /// 参考 [Program.description]
  String? description;

  /// 参考 [Program.like]
  bool? like;

  /// 参考 [Program.type]
  @enumerated
  late ProgramType type;

  /// 参考 [Program.status]
  @enumerated
  late ProgramStatus status;

  /// 参考 [Program.start]
  late TimeOfDayDB start;

  /// 参考 [Program.end]
  late TimeOfDayDB end;

  /// 参考 [Program.hosts]
  List<String>? hosts;

  /// 参考 [Program.weekday]
  @enumerated
  late List<ProgramWeekday> weekday;
}

/// 将 [TimeOfDay] 存储到数据库的数据结构
@embedded
class TimeOfDayDB {
  /// 存储小时
  late int hour;

  /// 存储分钟
  late int minute;
}