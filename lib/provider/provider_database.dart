import 'package:isar_community/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/base/database_program.dart';
import '../data/base/database_station.dart';

part 'provider_database.g.dart';

/// 数据库连接的 Provider
@riverpod
Future<Isar> isarDatabase(Ref ref) async {
  final dir = await getApplicationDocumentsDirectory();
  final isar = await Isar.open([
    RadioStationDBSchema,
    ProgramDBSchema,
  ], directory: dir.path);

  /// 设置释放资源的操作
  ref.onDispose(() async => isar.close());
  return isar;
}