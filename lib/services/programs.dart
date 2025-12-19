import 'package:http/http.dart' as http;
import 'package:outdoor_aerial_client/models/program/single.pb.dart';
import 'package:outdoor_aerial_client/models/programs.pb.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class ProgramsGetService {
  /// Outdoor Aerial 的服务器地址
  final String address;

  /// 是否启用 Https 安全访问
  final bool isHttps;

  /// 指定的 Path 去执行访问所有节目的任务
  static const path = 'programs';

  /// 在应用启动时一次性获取所有节目的服务
  ProgramsGetService({required this.address, this.isHttps = false});

  /// 获取节目
  /// TODO 解决访问出错问题的回调，比如计算机拒绝连接错误、Protobuf数据不匹配错误、对方4XX错误等
  Future<Programs> get() async {
    final response = await http.get(switch (isHttps) {
      false => Uri(scheme: 'http', host: address, port: 8908, path: path),
      true => Uri(scheme: 'https', host: address, port: 8908, path: path),
    });

    switch (response.statusCode) {
      case 200:
        return Programs.fromBuffer(response.bodyBytes);
      default:
        throw http.ClientException('抱歉无法解析服务器数据');
    }
  }
}

class TodayProgramsService {
  /// Outdoor Aerial 的服务器地址
  final String address;

  /// 是否启用 Wss 安全访问
  final bool isWss;

  /// 指定的 Path 去执行流式获取节目的任务
  static const path = 'program';

  /// 流式获取今日最新节目的服务
  TodayProgramsService({required this.address, this.isWss = false});

  /// WebSocket相关接口
  late WebSocketChannel _channel;

  /// 获取节目
  Stream<SingleProgram> stream() async* {
    _channel = WebSocketChannel.connect(switch (isWss) {
      false => Uri(scheme: 'ws', host: address, port: 8908, path: path),
      true => Uri(scheme: 'wss', host: address, port: 8908, path: path),
    })..sink.add('hello');
    await _channel.ready;

    try {
      await for (final message in _channel.stream) {
        if (message is List<int>) {
          yield SingleProgram.fromBuffer(message);
        } else {
          throw FormatException('对面传达的信息我们无法解析');
        }
      }
    } finally {
      await _channel.sink.close();
    }
  }

  /// 停止连接
  void close() => _channel.sink.close();
}
