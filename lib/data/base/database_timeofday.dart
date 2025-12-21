import 'package:flutter/material.dart' show TimeOfDay;
import 'package:isar_community/isar.dart';

part 'database_timeofday.g.dart';

/// 将 [TimeOfDay] 存储到数据库的数据结构
@embedded
class TimeOfDayDB {
  /// 存储小时
  late int hour;

  /// 存储分钟
  late int minute;
}