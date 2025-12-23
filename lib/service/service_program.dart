import 'package:outdoor_aerial_client/data/model/datamodel_program.dart';
import 'package:outdoor_aerial_client/data/source/datasource_localsource.dart';
import 'package:outdoor_aerial_client/data/source/datasource_remotesource.dart';

class ProgramRepository {
  /// TODO 像 RadioStationRepository 那样从本地获取电台节目信息
  final ProgramLocalSource localSource;

  /// TODO 像 RadioStationRepository 那样从服务器获取电台节目信息
  final ProgramRemoteSource remoteSource;

  /// 电台节目的仓库
  ProgramRepository({required this.localSource, required this.remoteSource});

  /// 临时存储电台节目的列表
  final List<Program> programs = List.empty(growable: true);

  /// 实时获取电台列表流
  Stream<List<Program>> watchStations() async* {
    /// 首先获取本地数据库中已有的电台节目
    try {
      final localStation = await localSource.geetAllPrograms();
      programs.addAll(localStation);
      yield List.of(programs);
    } catch (e) {
      // TODO 对读取数据库出现的相关错误作处理
      rethrow;
    }

    /// 然后监听服务器进行实时信息更新
    try {
      await for (final station in remoteSource.streamProgram()) {
        final index = programs.indexWhere((s) => s.id == station.id); // 索引
        switch (index) {
          case -1: // 找不到索引，是新的电台节目
            programs.add(station);
          default:
            programs[index] = station;
        }
        await localSource.saveProgram(station); // 对数据库一并更新
        yield List.of(programs);
      }
    } catch (e) {
      // TODO 对监听服务器出现的相关错误作处理
      rethrow;
    }
  }
}
