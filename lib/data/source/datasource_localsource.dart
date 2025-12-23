import 'package:isar_community/isar.dart';
import 'package:outdoor_aerial_client/data/base/database_program.dart';
import 'package:outdoor_aerial_client/data/base/database_station.dart';
import 'package:outdoor_aerial_client/data/mapper/datamapper_program.dart';
import 'package:outdoor_aerial_client/data/mapper/datamapper_station.dart';
import 'package:outdoor_aerial_client/data/model/datamodel_program.dart';
import 'package:outdoor_aerial_client/data/model/datamodel_station.dart';

class RadioStationLocalSource {
  /// isar数据库
  final Isar isar;

  /// 本地广播电台源
  RadioStationLocalSource({required this.isar});

  /// 从数据库中获取所有广播电台
  Future<List<RadioStation>> getAllStations() async {
    final stationDBs = await isar.radioStationDBs.where().findAll();
    final stations = List.generate(
      stationDBs.length,
      (index) => RadioStationMapper.dbToModel(stationDBs[index]),
    );
    return stations;
  }

  /// 将广播电台信息存储到数据库中
  ///
  /// 若有重复内容，重复的广播电台信息将被覆盖，否则新增它
  Future<void> saveStation(RadioStation station) async {
    final stationDBs = RadioStationMapper.modelToDB(station);
    await isar.writeTxn(() async {
      await isar.radioStationDBs.put(stationDBs);
    });
  }
}

class ProgramLocalSource {
  /// isar数据库
  final Isar isar;

  /// 本地电台节目源
  ProgramLocalSource({required this.isar});

  /// 从数据库中获取所有电台节目
  Future<List<Program>> geetAllPrograms() async {
    final programDBs = await isar.programDBs.where().findAll();
    final programs = List.generate(
      programDBs.length,
      (index) => ProgramMapper.dbToModel(programDBs[index]),
    );
    return programs;
  }

  /// 将广播电台信息存储到数据库中
  ///
  /// 若有重复内容，重复的广播电台信息将被覆盖，否则新增它
  Future<void> saveProgram(Program program) async {
    final programDBs = ProgramMapper.modelToDB(program);
    await isar.writeTxn(() async {
      await isar.programDBs.put(programDBs);
    });
  }
}
