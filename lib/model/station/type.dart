/// 广播电台的类型
///
/// 每个广播电台都会有它擅长播出的类型，在这里罗列了一些常见的电台类型
///
/// 注意拥有多种类型的电台在此将被归类为 “综合” 电台，
/// 并且数据结构中并不会设立 “其他” 项
enum StationType {
  /// 综合台
  integrate,

  /// 交通台
  traffic,

  /// 音乐台
  music,

  /// 新闻台
  news,

  /// 经济台
  economy,

  /// 体育台
  sports,

  /// 教育台
  educational,

  /// 科学台
  science,

  /// 国际台
  international,

  /// 农业台
  agricultural,

  /// 少儿台
  children,

  /// 健康台
  health,
}