import 'package:isar_community/isar.dart';
import 'package:outdoor_aerial_client/data/base/database_timeofday.dart';
import 'package:outdoor_aerial_client/data/model/datamodel_program.dart';
import 'package:outdoor_aerial_client/data/model/datamodel_status.dart';
import 'package:outdoor_aerial_client/data/model/datamodel_type.dart';
import 'package:outdoor_aerial_client/data/model/datamodel_weekday.dart';

part 'database_program.g.dart';

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

