import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:outdoor_aerial_client/data/model/datamodel_program.dart';
import 'package:outdoor_aerial_client/service/service_program.dart';
import 'package:outdoor_aerial_client/data/source/datasource_localsource.dart';
import 'package:outdoor_aerial_client/data/source/datasource_remotesource.dart';
import 'provider_database.dart';

/// 节目列表流 Provider
final programsStreamProvider = StreamProvider<List<Program>>((ref) {
  final isar = ref.watch(isarProvider).value;
  if (isar == null) throw Exception('无法启动数据库');
  
  final repository = ProgramRepository(
    localSource: ProgramLocalSource(isar: isar),
    remoteSource: ProgramRemoteSource(address: '127.0.0.1'),
  );
  return repository.watchStations();
});
