import 'package:outdoor_aerial_client/data/mapper/datamapper_program.dart';
import 'package:outdoor_aerial_client/data/mapper/datamapper_station.dart';
import 'package:outdoor_aerial_client/data/model/datamodel_program.dart';
import 'package:outdoor_aerial_client/data/model/datamodel_station.dart';
import 'package:outdoor_aerial_client/data/proto/build/dataproto_program.pb.dart';
import 'package:outdoor_aerial_client/data/proto/build/dataproto_station.pb.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class RadioStationRemoteService {
  /// Outdoor Aerial 的服务器地址
  final String address;

  /// 是否启用 Wss 安全访问
  final bool isWss;

  /// 指定的 Path 去执行访问广播电台的任务
  static const path = 'station';

  /// 远程广播电台源
  RadioStationRemoteService({required this.address, this.isWss = true});

  /// WebSocket相关接口
  late WebSocketChannel _channel;

  /// 从服务器中获取所有广播电台
  Stream<RadioStation> streamStation() async* {
    _channel = WebSocketChannel.connect(switch (isWss) {
      false => Uri(scheme: 'ws', host: address, port: 8908, path: path),
      true => Uri(scheme: 'wss', host: address, port: 8908, path: path),
    });
    await _channel.ready;
    try {
      await for (final message in _channel.stream) {
        if (message is List<int>) {
          final stationPB = RadioStationPB.fromBuffer(message);
          final station = RadioStationMapper.pbToModel(stationPB);
          yield station;
        } else {
          throw FormatException('抱歉对面传达的信息我们无法解析');
        }
      }
    } finally {
      await _channel.sink.close();
    }
  }
}

class ProgramRemoteService {
  /// Outdoor Aerial 的服务器地址
  final String address;

  /// 是否启用 Wss 安全访问
  final bool isWss;

  /// 指定的 Path 去执行访问电台节目的任务
  static const path = 'program';

  /// 远程电台节目源
  ProgramRemoteService({required this.address, this.isWss = true});

  /// WebSocket相关接口
  late WebSocketChannel _channel;

  /// 从服务器中获取所有电台节目
  Stream<Program> streamProgram() async* {
    _channel = WebSocketChannel.connect(switch (isWss) {
      false => Uri(scheme: 'ws', host: address, port: 8908, path: path),
      true => Uri(scheme: 'wss', host: address, port: 8908, path: path),
    });
    await _channel.ready;
    try {
      await for (final message in _channel.stream) {
        if (message is List<int>) {
          final programPB = ProgramPB.fromBuffer(message);
          final program = ProgramMapper.pbToModel(programPB);
          yield program;
        } else {
          throw FormatException('抱歉对面传达的信息我们无法解析');
        }
      }
    } finally {
      await _channel.sink.close();
    }
  }
}