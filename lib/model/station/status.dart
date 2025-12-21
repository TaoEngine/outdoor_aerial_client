/// 广播电台的播出状态
///
/// 广播电台存在三种播出状态，广播中状态，每个月底的停机检修以及该电台停播（不要啊）
enum StationStatus {
  /// 广播中
  onair,

  /// 停机检修
  maintaining,

  /// 电台停播，诶！
  offair,
}