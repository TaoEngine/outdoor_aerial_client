import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/model/datamodel_station.dart';
import '../data/source/datasource_station.dart';
import '../service/service_local.dart';
import '../service/service_remote.dart';

part 'provider_station.g.dart';

/// 广播电台列表流
@riverpod
class Stations extends _$Stations {
  /// 从本地和服务器获取广播电台信息
  @override
  Stream<List<RadioStation>> build({
    required RadioStationLocalService localService,
    required RadioStationRemoteService remoteService,
  }) async* {
    final repository = RadioStationSource(
      localService: localService,
      remoteService: remoteService,
    );
    yield* repository.watchStations();
  }
}
