/// 用于表示 WebSocket 连接状态
enum ConnectStatus {
  /// 未连接
  disconnect,

  /// 连接中
  connecting,

  /// 已连接
  connected,

  /// 出错了
  error,
}
