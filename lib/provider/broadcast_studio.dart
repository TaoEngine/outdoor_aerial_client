import 'package:flutter/material.dart';

/// 广播电台的管理模板
class BroadcastStudio extends ChangeNotifier {
  ImageProvider? _logoBroadcastStudio;
  String _nameBroadcastStudio = "未知的广播电台";
  double _freqBroadcastStudio = 87.0;
  bool _likeBroadcastStudio = false;

  /// 广播电台的Logo
  ImageProvider? get logoBroadcastStudio => _logoBroadcastStudio;

  /// 广播电台的名称
  String get nameBroadcastStudio => _nameBroadcastStudio;

  /// 广播电台的兆赫兹频率
  double get freqBroadcastStudio => _freqBroadcastStudio;

  /// 用户是否喜爱该广播电台
  bool get likeBroadcastStudio => _likeBroadcastStudio;

  /// 更新广播电台Logo
  void updateLogo(ImageProvider logo) {
    _logoBroadcastStudio = logo;
    notifyListeners();
  }

  /// 更新广播电台的名称
  void updateName(String name) {
    if (name.isNotEmpty) _nameBroadcastStudio = name;
    notifyListeners();
  }

  /// 更新广播电台的兆赫兹频率
  void updateFreq(double freq) {
    if (freq <= 87.0 || freq >= 108.0) _freqBroadcastStudio = freq;
    notifyListeners();
  }

  /// 更新用户是否喜爱该广播电台信息
  void updateLike(bool like) {
    _likeBroadcastStudio = like;
    notifyListeners();
  }
}

/// 新闻广播 TODO 添加此类广播的特点
class NewsBroadcastStudio extends BroadcastStudio {}

/// 音乐广播 TODO 添加此类广播的特点
class MusicBroadcastStudio extends BroadcastStudio {}

/// 交通广播 TODO 添加此类广播的特点
class TransportBroadcastStudio extends BroadcastStudio {}
