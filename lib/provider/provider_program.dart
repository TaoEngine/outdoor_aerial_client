import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:outdoor_aerial_client/data/model/datamodel_program.dart';
import 'package:outdoor_aerial_client/data/source/datasource_program.dart';
import 'package:outdoor_aerial_client/service/service_local.dart';
import 'package:outdoor_aerial_client/service/service_remote.dart';
import 'package:outdoor_aerial_client/provider/provider_database.dart';

/// 节目列表流 Provider
final programsStreamProvider = StreamProvider<List<Program>>((ref) {
  final isar = ref.watch(isarProvider).value;
  if (isar == null) throw Exception('无法启动数据库');
  
  final repository = ProgramSource(
    localService: ProgramLocalService(isar: isar),
    remoteService: ProgramRemoteService(address: '127.0.0.1'),
  );
  return repository.watchPrograms();
});
