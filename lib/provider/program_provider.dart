import 'package:flutter/material.dart';

import 'package:outdoor_aerial_client/provider/broadcast_studio.dart';

/// 节目状态管理模板
class ProgramProvider with ChangeNotifier {
  ImageProvider? _logoProgram;
  String _nameProgram = "未知的节目";
  String _themeProgram = "未知的节目主题";
  BroadcastStudio _programBroadcastStudio = BroadcastStudio();
  List<ProgramBroadcastWeekdays>? _dateProgram;
  List<TimeOfDay>? _programBroadcastTime;

  /// 电台节目的Logo
  ImageProvider? get logoProgram => _logoProgram;

  /// 电台节目的名称
  String get nameProgram => _nameProgram;

  /// 电台节目的讲述主题
  String get themeProgram => _themeProgram;

  /// 电台节目的所属广播电台
  BroadcastStudio get programBroadcasting => _programBroadcastStudio;

  /// 节目固定播出日期
  List<ProgramBroadcastWeekdays> get dateProgram =>
      _dateProgram ?? [.monday, .tuesday, .wednesday, .thursday, .friday, .saturday, .sunday];

  /// 节目播出时间
  List<TimeOfDay> get programBroadcastTime =>
      _programBroadcastTime ?? [TimeOfDay(hour: 0, minute: 0), TimeOfDay(hour: 23, minute: 59)];

  /// 更新电台节目的Logo
  void updateLogo(ImageProvider logo) {
    _logoProgram = logo;
    notifyListeners();
  }

  /// 更新电台节目的名称
  void updateName(String name) {
    _nameProgram = name;
    notifyListeners();
  }

  /// 更新电台节目的讲述主题
  void updateTheme(String theme) {
    _themeProgram = theme;
    notifyListeners();
  }

  /// 更新电台节目的所属广播电台
  void updateBroadcasting(BroadcastStudio broadcasting) {
    _programBroadcastStudio = broadcasting;
    notifyListeners();
  }
}

/// 定义节目播出时间
enum ProgramBroadcastWeekdays { monday, tuesday, wednesday, thursday, friday, saturday, sunday }
