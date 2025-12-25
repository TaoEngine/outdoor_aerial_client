import 'dart:async';
import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'package:isar_community/isar.dart';
import 'package:outdoor_aerial_client/data/base/database_program.dart';
import 'package:outdoor_aerial_client/data/base/database_station.dart';
import 'package:outdoor_aerial_client/data/model/datamodel_station.dart';
import 'package:outdoor_aerial_client/data/source/datasource_station.dart';
import 'package:outdoor_aerial_client/service/service_local.dart';
import 'package:outdoor_aerial_client/service/service_remote.dart';

void main() {
  group('广播电台服务测试', () {
    late Isar isar;
    late RadioStationSource repository;
    late Directory tempDir;

    setUp(() async {
      // 创建临时目录用于测试数据库
      tempDir = await Directory.systemTemp.createTemp('outdoor_aerial_test_');

      isar = await Isar.open([
        RadioStationDBSchema,
        ProgramDBSchema,
      ], directory: tempDir.path);
    });

    tearDown(() async {
      await isar.close();
      await tempDir.delete(recursive: true);
    });

    test('测试通过通道持续获取广播电台3条', () async {
      final localSource = RadioStationLocalService(isar: isar);
      final remoteSource = RadioStationRemoteService(
        address: '127.0.0.1',
        isWss: false,
      );
      repository = RadioStationSource(
        localService: localSource,
        remoteService: remoteSource,
      );

      final completer = Completer<List<RadioStation>>();
      repository.watchStations().listen(
        (stations) {
          if (stations.length >= 3) completer.complete(stations);
        },
        onError: (e) {
          completer.completeError(e);
        },
      );

      final stations = await completer.future;
      expect(stations, isA<List<RadioStation>>());
    });
  });
}
