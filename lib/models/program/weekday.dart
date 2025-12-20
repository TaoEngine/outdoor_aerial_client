/// 电台节目播出日期
///
/// 此处记录笼统的周数。
/// 比如节目周一至周五播出，即向节目的 `weekday` 中填入 [monday .. friday]
enum ProgramWeekday {
  /// 周一
  monday,

  /// 周二
  tuesday,

  /// 周三
  wednesday,

  /// 周四
  thursday,

  /// 周五
  friday,

  /// 周六
  saturday,

  /// 周日
  sunday,
}
