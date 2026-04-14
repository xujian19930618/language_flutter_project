import 'dart:io';
import 'dart:ui';

/// 系统托盘（Tray）抽象接口
///
/// 设计目的：
/// - 作为跨平台适配层（Windows / macOS / Linux）
/// - 上层业务不依赖具体实现，只依赖该接口
/// - 便于后续替换实现（例如：ffi / 插件 / 原生调用）
///
/// 使用方式：
/// - 每个平台实现一个具体类（如 MacOSAppTray / WindowsAppTray）
/// - 通过工厂或条件导入选择对应实现
abstract class AppTray {

  /// 初始化托盘
  ///
  /// 通常用于：
  /// - 创建托盘图标
  /// - 注册点击事件
  /// - 初始化平台相关资源
  Future<void> init();

  /// 设置托盘菜单
  ///
  /// [items] 菜单项列表
  /// - 每个菜单项包含：
  ///   - label：显示文本
  ///   - onClick：点击回调
  ///
  /// 注意：
  /// - 不同平台菜单能力不同（如分隔符、子菜单等）
  /// - 可以在具体实现中做兼容处理
  Future<void> setMenu(List<TrayMenuItem> items);

  /// 显示主窗口
  ///
  /// 一般用于：
  /// - 点击托盘图标时恢复应用窗口
  /// - 从最小化/隐藏状态恢复
  Future<void> showWindow();

  /// 隐藏主窗口
  ///
  /// 常见场景：
  /// - 关闭窗口时不退出，而是最小化到托盘
  Future<void> hideWindow();

  /// 释放资源
  ///
  /// 包括：
  /// - 销毁托盘图标
  /// - 注销监听事件
  /// - 清理平台资源
  Future<void> dispose();
}

/// 托盘菜单项模型
class TrayMenuItem {

  /// 菜单显示文本
  final String label;

  /// 点击菜单时的回调函数
  ///
  /// 使用 [VoidCallback]（无参无返回）：
  /// - 保持简单统一
  /// - 方便 UI 层直接绑定
  final VoidCallback onClick;

  TrayMenuItem({
    required this.label,
    required this.onClick,
  });
}