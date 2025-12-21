import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:outdoor_aerial_client/models/protos/program/program.pb.dart';

import 'package:outdoor_aerial_client/models/protos/program/single.pb.dart';
import 'package:outdoor_aerial_client/service/programs.dart';

class ProgramsNotifier extends AsyncNotifier<List<Program>> {
  @override
  FutureOr<List<Program>> build() async {
    final service = ProgramsGetService(address: 'localhost');
    // 获取所有节目
    final programs = await service.get();

    return programs.programs;
  }
}

class TodayProgramsNotifier extends AsyncNotifier<List<SingleProgram>> {
  @override
  FutureOr<List<SingleProgram>> build() {
    final service = TodayProgramsService(address: 'localhost');
    final subscription = service.stream().listen((program) {
      // 节目更新核心机制
      state = state.whenData((list) => [...list, program]);
    });

    // 创建 “停止连接”
    ref.onDispose(() {
      service.close();
      subscription.cancel();
    });

    return [];
  }
}

final programsProvider = AsyncNotifierProvider<ProgramsNotifier, List<Program>>(
  ProgramsNotifier.new,
);

final todayProgramProvider =
    AsyncNotifierProvider<TodayProgramsNotifier, List<SingleProgram>>(
      TodayProgramsNotifier.new,
    );
