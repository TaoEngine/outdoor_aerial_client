import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:outdoor_aerial_client/models/program/single.pb.dart';
import 'package:outdoor_aerial_client/models/programs.pb.dart';
import 'package:outdoor_aerial_client/services/programs.dart';

void main() {
  group('节目服务测试', () {
    test('测试一次性获取所有节目', () async {
      final service = ProgramsGetService(address: '127.0.0.1');
      final programs = await service.get();
      expect(programs, isA<Programs>());
    });
    test('测试通过通道持续获取节目3条', () async {
      final service = TodayProgramsService(address: '127.0.0.1');
      final completer = Completer<void>();
      final programs = List<SingleProgram>.empty(growable: true);
      service.stream().listen(
        (program) {
          programs.add(program);
          if (programs.length >= 3) completer.complete();
        },
        onError: (e) {
          service.close();
          completer.completeError(e);
        },
      );
      await completer.future;
      expect(programs, isA<List<SingleProgram>>());
    });
  });
}
