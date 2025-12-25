import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/model/datamodel_program.dart';
import '../data/source/datasource_program.dart';
import '../service/service_local.dart';
import '../service/service_remote.dart';

part 'provider_program.g.dart';

/// 节目列表流
@riverpod
class Programs extends _$Programs {
  /// 从本地和服务器获取电台节目信息
  @override
  Stream<List<Program>> build({
    required ProgramLocalService localService,
    required ProgramRemoteService remoteService,
  }) async* {
    final repository = ProgramSource(
      localService: localService,
      remoteService: remoteService,
    );
    yield* repository.watchPrograms();
  }
}
