import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import 'package:outdoor_aerial_client/models/broadcast_program.pb.dart';

class BroadcastProgramsNotifier extends AsyncNotifier<BroadcastPrograms> {
  WebSocketChannel? _channel;
  StreamSubscription? _subscription;

  @override
  FutureOr<BroadcastPrograms> build() async {
    return const BroadcastPrograms(status: ConnectStatus.disconnect);
  }

  Future<void> connectServer() async {
    state = const AsyncValue.loading();

    try {
      // 登录 OutdoorAerial 服务器
      _channel = WebSocketChannel.connect(
        Uri.parse("ws://127.0.0.1:8908/program"),
      );
      state = const AsyncValue.data(
        BroadcastPrograms(status: ConnectStatus.connecting),
      );

      _subscription = _channel!.stream.listen(
        (data) {
          final currentState =
              state.value ??
              const BroadcastPrograms(status: ConnectStatus.disconnect);
          state = AsyncValue.data(currentState);
        },
        onError: (_) {
          state = AsyncValue.data(
            BroadcastPrograms(status: ConnectStatus.error),
          );
        },
        onDone: () {
          state = AsyncValue.data(
            BroadcastPrograms(status: ConnectStatus.disconnect),
          );
        },
      );
      state = const AsyncValue.data(
        BroadcastPrograms(status: ConnectStatus.connected),
      );
    } catch (e) {
      state = AsyncValue.data(BroadcastPrograms(status: ConnectStatus.error));
    }
  }
}

/// 用于表示 WebSocket 连接状态
enum ConnectStatus {
  /// 未连接
  disconnect,

  /// 连接中
  connecting,

  /// 已连接
  connected,

  /// 出错了
  error,
}

final broadcastProgramsProvider =
    AsyncNotifierProvider.autoDispose<
      BroadcastProgramsNotifier,
      BroadcastPrograms
    >(BroadcastProgramsNotifier.new);

class BroadcastPrograms extends Equatable {
  final ConnectStatus status;
  final List<SingleProgram> programs;

  const BroadcastPrograms({required this.status, this.programs = const []});

  @override
  List<Object?> get props => [status, programs];
}
