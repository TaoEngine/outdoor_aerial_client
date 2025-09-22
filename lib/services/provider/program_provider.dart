import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

/// 节目状态管理模板
abstract class ProgramProvider with ChangeNotifier {
  /// 电台节目名称
  String? _programName;

  /// 电台节目标题
  String? _programTitle;

  /// 节目所属广播电台 TODO 应该将这个和广播电台的状态管理事件绑定起来，而不是只给一个 [String]
  String? _programBroadcasting;

  /// 节目显示的图标
  Image? _programImage;

  /// 节目固定播出日期
  List<ProgramBroadcastWeekdays>? _programBroadcastDate;

  /// 节目播出时间
  List<TimeOfDay>? _programBroadcastTime;

  String get programName => _programName ?? "未知的节目";
  String get programTitle => _programTitle ?? "未知的节目标题";
  String get programBroadcasting => _programBroadcasting ?? "未知的广播电台";
  Widget get programImage => _programImage ?? Center(child: Icon(TablerIcons.radio));
  List<ProgramBroadcastWeekdays> get programBroadcastDate =>
      _programBroadcastDate ??
      [
        ProgramBroadcastWeekdays.monday,
        ProgramBroadcastWeekdays.tuesday,
        ProgramBroadcastWeekdays.wednesday,
        ProgramBroadcastWeekdays.thursday,
        ProgramBroadcastWeekdays.friday,
        ProgramBroadcastWeekdays.saturday,
        ProgramBroadcastWeekdays.sunday,
      ];
  List<TimeOfDay> get programBroadcastTime =>
      _programBroadcastTime ?? [TimeOfDay(hour: 0, minute: 0), TimeOfDay(hour: 23, minute: 59)];

  /// 刷新节目状态
  void refreshProgram({String? programName, String? programTitle, String? programBroadcasting, Image? programImage}) {
    _programName = programName;
    _programTitle = programTitle;
    _programBroadcasting = programBroadcasting;
    _programImage = programImage;
    notifyListeners();
  }
}

/// 定义节目播出时间
enum ProgramBroadcastWeekdays { monday, tuesday, wednesday, thursday, friday, saturday, sunday }

/// TODO 待开发的 音乐节目状态管理
class MusicProgramProvider extends ProgramProvider {}

/// TODO 待开发的 对话节目状态管理
class TalkProgramProvider extends ProgramProvider {}