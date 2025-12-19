import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:outdoor_aerial_client/models/program/program.pb.dart';

import 'package:outdoor_aerial_client/models/program/single.pb.dart';
import 'package:outdoor_aerial_client/services/programs.dart';

final _ProgramsProvider = Provider<ProgramsGetService>((ref) {
  return ProgramsGetService(address: '127.0.0.1');
});

final _todayProgramsProvider = Provider<TodayProgramsService>((ref) {
  return TodayProgramsService(address: '127.0.0.1');
});

class ProgramsNotifier extends AsyncNotifier<List<Program>> {
  @override
  FutureOr<List<Program>> build() async {
    final service = ref.read(_ProgramsProvider);
    // 获取所有节目
    final programs = await service.get();

    return programs.programs;
  }
}

class TodayProgramsNotifier extends AsyncNotifier<List<SingleProgram>> {
  @override
  FutureOr<List<SingleProgram>> build() {
    final service = ref.read(_todayProgramsProvider);
    final subscription = service.stream().listen((program) {
      // 节目更新核心机制
      state = state.whenData((list) => [...list, program]);
    });

    // 及时停止连接
    ref.onDispose(() {
      service.close();
      subscription.cancel();
    });

    return [];
  }
}

final todayProgramProvider =
    AsyncNotifierProvider<TodayProgramsNotifier, List<SingleProgram>>(
      TodayProgramsNotifier.new,
    );
