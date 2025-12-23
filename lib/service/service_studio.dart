import 'package:outdoor_aerial_client/data/model/datamodel_station.dart';
import 'package:outdoor_aerial_client/data/source/datasource_localsource.dart';
import 'package:outdoor_aerial_client/data/source/datasource_remotesource.dart';

class RadioStationRepository {
  /// 从本地获取广播电台信息
  final RadioStationLocalSource localSource;

  /// 从服务器获取广播电台信息
  final RadioStationRemoteSource remoteSource;

  /// 广播电台的仓库
  RadioStationRepository({
    required this.localSource,
    required this.remoteSource,
  });

  /// 临时存储广播电台的列表
  final List<RadioStation> stations = List.empty(growable: true);

  /// 实时获取电台列表流
  Stream<List<RadioStation>> watchStations() async* {
    /// 首先获取本地数据库中已有的广播电台
    try {
      final localStation = await localSource.getAllStations();
      stations.addAll(localStation);
      yield List.of(stations);
    } catch (e) {
      // TODO 对读取数据库出现的相关错误作处理
      rethrow;
    }

    /// 然后监听服务器进行实时信息更新
    try {
      await for (final station in remoteSource.streamStation()) {
        final index = stations.indexWhere((s) => s.id == station.id); // 索引
        switch (index) {
          case -1: // 找不到索引，是新的广播电台
            stations.add(station);
          default:
            stations[index] = station;
        }
        await localSource.saveStation(station); // 对数据库一并更新
        yield List.of(stations);
      }
    } catch (e) {
      // TODO 对监听服务器出现的相关错误作处理
      rethrow;
    }
  }
}
