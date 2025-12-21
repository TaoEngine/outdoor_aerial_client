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

enum ProgramType {
  /// 综合节目，包含不止一个分类的节目
  integrate,

  /// 新闻节目，聚焦时事与政治的新闻类节目
  news,

  /// 音乐节目，纯粹播放音乐或对音乐进行点评的节目
  music,

  /// 播客节目，邀请嘉宾进行深度对话或者话题延申的节目
  podcast,

  /// 综艺节目，交流趣事讨论八卦或者主持人持续与听众进行互动的节目
  entertainment,

  /// 体育节目，报道实况比赛或者分析赛点事件的节目
  sports,

  /// 广播剧节目，音频小说或评书节目
  storytelling,

  /// 教育节目，谈论家庭教育或孩子的心理问题或教育讲座节目
  educational,

  /// 财经节目，解析今日股市或提供投资建议的节目
  finance,

  /// 健康节目，与听众交流健身或养生知识的节目
  health,
}