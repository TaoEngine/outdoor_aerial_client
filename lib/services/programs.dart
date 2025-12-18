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

class ProgramsUpdateService {
  /// Outdoor Aerial 的服务器地址
  final String address;

  /// 是否启用 Https 安全访问
  final bool isWss;

  /// 指定的 Path 去执行流式获取节目的任务
  static const path = 'program';

  /// 在应用使用过程中流式获取最新节目的服务
  ProgramsUpdateService({required this.address, this.isWss = false});

  /// 获取节目
  Future<Stream> stream() async {
    final channel = WebSocketChannel.connect(switch (isWss) {
      false => Uri(scheme: 'ws', host: address, port: 8908, path: path),
      true => Uri(scheme: 'wss', host: address, port: 8908, path: path),
    })..sink.add('hello');
    await channel.ready;

    return channel.stream.map((message) {
      if (message is List<int>) {
        return SingleProgram.fromBuffer(message);
      }
    });
  }
}
