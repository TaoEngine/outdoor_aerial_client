import 'package:isar_community/isar.dart';
import 'package:outdoor_aerial_client/data/base/database_timeofday.dart';
import 'package:outdoor_aerial_client/data/model/datamodel_status.dart';
import 'package:outdoor_aerial_client/data/model/datamodel_type.dart';

part 'database_station.g.dart';

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