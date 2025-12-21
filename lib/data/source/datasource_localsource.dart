import 'package:isar_community/isar.dart';
import 'package:outdoor_aerial_client/data/base/database_station.dart';
import 'package:outdoor_aerial_client/data/mapper/datamapper_station.dart';

import 'package:outdoor_aerial_client/data/model/datamodel_station.dart';

class RadioStationLocalSource {
  final Isar _isar;

  /// 本地广播电台源
  RadioStationLocalSource(this._isar);

  /// 从数据库中获取所有广播电台
  Future<List<RadioStation>> getAllStations() async {
    final stationDB = await _isar.radioStationDBs.where().findAll();
    final station = List.generate(
      stationDB.length,
      (index) => RadioStationMapper.dbToModel(stationDB[index]),
    );
    return station;
  }
}
