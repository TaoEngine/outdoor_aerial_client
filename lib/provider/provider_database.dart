import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar_community/isar.dart';
import 'package:outdoor_aerial_client/data/base/database_program.dart';
import 'package:outdoor_aerial_client/data/base/database_station.dart';
import 'package:path_provider/path_provider.dart';

/// 数据库连接的 Provider
final isarProvider = FutureProvider<Isar>((ref) async {
  final dir = await getApplicationDocumentsDirectory();
  final isar = await Isar.open([RadioStationDBSchema, ProgramDBSchema], directory: dir.path);
  return isar;
});
