import 'package:flutter/material.dart';
import 'package:outdoor_aerial_client/data/base/database_program.dart';
import 'package:outdoor_aerial_client/data/base/database_timeofday.dart';
import 'package:outdoor_aerial_client/data/model/datamodel_program.dart';
import 'package:outdoor_aerial_client/data/model/datamodel_status.dart';
import 'package:outdoor_aerial_client/data/model/datamodel_type.dart';
import 'package:outdoor_aerial_client/data/model/datamodel_weekday.dart';
import 'package:outdoor_aerial_client/data/proto/build/dataproto_program.pb.dart';
import 'package:outdoor_aerial_client/data/proto/build/dataproto_status.pbenum.dart';
import 'package:outdoor_aerial_client/data/proto/build/dataproto_type.pbenum.dart';
import 'package:outdoor_aerial_client/data/proto/build/dataproto_weekday.pbenum.dart';
import 'package:outdoor_aerial_client/data/proto/build/google/type/timeofday.pb.dart'
    as pbtype;

/// 电台节目数据结构转换器
class ProgramMapper {
  /// [ProgramDB] 转 [Program]
  ///
  /// 用于将数据库的电台节目信息呈现在组件上
  static Program dbToModel(ProgramDB db) {
    final start = TimeOfDay(hour: db.start.hour, minute: db.start.minute);
    final end = TimeOfDay(hour: db.end.hour, minute: db.end.minute);
    return Program(
      id: db.id,
      name: db.name,
      description: db.description,
      studio: db.studio,
      hosts: db.hosts,
      weekday: db.weekday,
      type: db.type,
      status: db.status,
      start: start,
      end: end,
      like: db.like,
    );
  }

  /// [Program] 转 [ProgramDB]
  ///
  /// 用于将电台节目存储到数据库中
  static ProgramDB modelToDB(Program program) {
    final start = TimeOfDayDB()
      ..hour = program.start.hour
      ..minute = program.start.minute;
    final end = TimeOfDayDB()
      ..hour = program.end.hour
      ..minute = program.end.minute;
    return ProgramDB()
      ..id = program.id
      ..name = program.name
      ..description = program.description
      ..studio = program.studio
      ..hosts = program.hosts
      ..weekday = program.weekday
      ..type = program.type
      ..status = program.status
      ..start = start
      ..end = end
      ..like = program.like;
  }

  /// [Program] 转 [ProgramPB]
  ///
  /// 用于将编辑过的电台节目信息重新发送到服务器进行修改
  static ProgramPB modelToPB(Program program) {
    final start = pbtype.TimeOfDay()
      ..hours = program.start.hour
      ..minutes = program.start.minute;
    final end = pbtype.TimeOfDay()
      ..hours = program.end.hour
      ..minutes = program.end.minute;
    final type = switch (program.type) {
      ProgramType.integrate => ProgramTypePB.PROGRAM_TYPE_INTEGRATE,
      ProgramType.news => ProgramTypePB.PROGRAM_TYPE_NEWS,
      ProgramType.music => ProgramTypePB.PROGRAM_TYPE_MUSIC,
      ProgramType.podcast => ProgramTypePB.PROGRAM_TYPE_PODCAST,
      ProgramType.entertainment => ProgramTypePB.PROGRAM_TYPE_ENTERTAINMENT,
      ProgramType.sports => ProgramTypePB.PROGRAM_TYPE_SPORTS,
      ProgramType.storytelling => ProgramTypePB.PROGRAM_TYPE_STORYTELLING,
      ProgramType.educational => ProgramTypePB.PROGRAM_TYPE_EDUCATIONAL,
      ProgramType.finance => ProgramTypePB.PROGRAM_TYPE_FINANCE,
      ProgramType.health => ProgramTypePB.PROGRAM_TYPE_HEALTH,
    };
    final status = switch (program.status) {
      ProgramStatus.live => ProgramStatusPB.LIVE,
      ProgramStatus.replay => ProgramStatusPB.REPLAY,
      ProgramStatus.suspended => ProgramStatusPB.SUSPENDED,
    };
    final weekday = program.weekday.map((day) {
      return switch (day) {
        ProgramWeekday.monday => ProgramWeekdayPB.MON,
        ProgramWeekday.tuesday => ProgramWeekdayPB.TUE,
        ProgramWeekday.wednesday => ProgramWeekdayPB.WED,
        ProgramWeekday.thursday => ProgramWeekdayPB.THU,
        ProgramWeekday.friday => ProgramWeekdayPB.FRI,
        ProgramWeekday.saturday => ProgramWeekdayPB.SAT,
        ProgramWeekday.sunday => ProgramWeekdayPB.SUN,
      };
    }).toList();
    return ProgramPB(
      id: program.id,
      studio: program.studio,
      name: program.name,
      description: program.description ?? '',
      like: program.like ?? false,
      type: type,
      status: status,
      start: start,
      end: end,
      hosts: program.hosts,
      weekday: weekday,
    );
  }

  /// [ProgramPB] 转 [Program]
  ///
  /// 用于将从服务器传回的电台节目信息呈现在组件上
  static Program pbToModel(ProgramPB pb) {
    final start = TimeOfDay(hour: pb.start.hours, minute: pb.start.minutes);
    final end = TimeOfDay(hour: pb.end.hours, minute: pb.end.minutes);
    final type = switch (pb.type) {
      ProgramTypePB.PROGRAM_TYPE_INTEGRATE => ProgramType.integrate,
      ProgramTypePB.PROGRAM_TYPE_NEWS => ProgramType.news,
      ProgramTypePB.PROGRAM_TYPE_MUSIC => ProgramType.music,
      ProgramTypePB.PROGRAM_TYPE_PODCAST => ProgramType.podcast,
      ProgramTypePB.PROGRAM_TYPE_ENTERTAINMENT => ProgramType.entertainment,
      ProgramTypePB.PROGRAM_TYPE_SPORTS => ProgramType.sports,
      ProgramTypePB.PROGRAM_TYPE_STORYTELLING => ProgramType.storytelling,
      ProgramTypePB.PROGRAM_TYPE_EDUCATIONAL => ProgramType.educational,
      ProgramTypePB.PROGRAM_TYPE_FINANCE => ProgramType.finance,
      ProgramTypePB.PROGRAM_TYPE_HEALTH => ProgramType.health,
      _ => ProgramType.integrate,
    };
    final status = switch (pb.status) {
      ProgramStatusPB.LIVE => ProgramStatus.live,
      ProgramStatusPB.REPLAY => ProgramStatus.replay,
      ProgramStatusPB.SUSPENDED => ProgramStatus.suspended,
      _ => ProgramStatus.live,
    };
    final weekday = pb.weekday.map((day) {
      return switch (day) {
        ProgramWeekdayPB.MON => ProgramWeekday.monday,
        ProgramWeekdayPB.TUE => ProgramWeekday.tuesday,
        ProgramWeekdayPB.WED => ProgramWeekday.wednesday,
        ProgramWeekdayPB.THU => ProgramWeekday.thursday,
        ProgramWeekdayPB.FRI => ProgramWeekday.friday,
        ProgramWeekdayPB.SAT => ProgramWeekday.saturday,
        ProgramWeekdayPB.SUN => ProgramWeekday.sunday,
        _ => ProgramWeekday.monday,
      };
    }).toList();
    return Program(
      id: pb.id,
      studio: pb.studio,
      name: pb.name,
      description: pb.description.isEmpty ? null : pb.description,
      like: pb.like,
      type: type,
      status: status,
      start: start,
      end: end,
      hosts: pb.hosts.toList(),
      weekday: weekday,
    );
  }
}
