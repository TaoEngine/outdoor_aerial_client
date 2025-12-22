import 'package:isar_community/isar.dart';
import 'package:outdoor_aerial_client/data/base/database_station.dart';
import 'package:outdoor_aerial_client/data/mapper/datamapper_station.dart';

import 'package:outdoor_aerial_client/data/model/datamodel_station.dart';

class RadioStationLocalSource {
  /// isar数据库
  final Isar isar;

  /// 本地广播电台源
  RadioStationLocalSource({required this.isar});

  /// 从数据库中获取所有广播电台
  Future<List<RadioStation>> getAllStations() async {
    final stationDB = await isar.radioStationDBs.where().findAll();
    final station = List.generate(
      stationDB.length,
      (index) => RadioStationMapper.dbToModel(stationDB[index]),
    );
    return station;
  }

  /// 将广播电台信息存储到数据库中
  ///
  /// 若有重复内容，重复的广播电台信息将被覆盖，否则新增它
  Future<void> saveStation(RadioStation station) async {
    final stationDB = RadioStationMapper.modelToDB(station);
    await isar.writeTxn(() async {
      await isar.radioStationDBs.put(stationDB);
    });
  }
}
