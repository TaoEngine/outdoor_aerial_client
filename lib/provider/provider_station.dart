import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:outdoor_aerial_client/data/model/datamodel_station.dart';
import 'package:outdoor_aerial_client/data/source/datasource_station.dart';
import 'package:outdoor_aerial_client/service/service_local.dart';
import 'package:outdoor_aerial_client/service/service_remote.dart';
import 'package:outdoor_aerial_client/provider/provider_database.dart';

/// 广播电台列表流 Provider
final stationsStreamProvider = StreamProvider<List<RadioStation>>((ref) {
  final isar = ref.watch(isarProvider).value;
  if (isar == null) throw Exception('无法启动数据库');

  final repository = RadioStationSource(
    localService: RadioStationLocalService(isar: isar),
    remoteService: RadioStationRemoteService(address: '127.0.0.1'),
  );
  return repository.watchStations();
});
