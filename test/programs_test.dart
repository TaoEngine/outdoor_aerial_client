import 'package:flutter_test/flutter_test.dart';
import 'package:outdoor_aerial_client/services/programs.dart';

void main() {
  group('节目服务测试', () {
    test('测试一次性获取所有节目', () async {
      final service = ProgramsGetService(address: '127.0.0.1');
      final programs = await service.get();
      print(programs.programs[0].name);
    });
    test('测试通过通道持续获取节目1条', () async {
      final service = ProgramsUpdateService(address: '127.0.0.1');
      final channel = await service.stream();
    });
  });
}
