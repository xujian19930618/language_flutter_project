import 'dart:ui';

import 'package:tray_manager/tray_manager.dart';
import 'package:window_manager/window_manager.dart';
import 'AppTray.dart';

/// Windows 托盘实现（兼容新版 tray_manager）
class WindowsTray implements AppTray {
  /// tray_manager 单例
  final TrayManager tray = TrayManager.instance;

  /// key -> 回调 映射
  final Map<String, VoidCallback> _handlers = {};

  /// 初始化托盘
  @override
  Future<void> init() async {
    // 设置图标
    await tray.setIcon('assets/tray_icon.ico');

    // tooltip
    await tray.setToolTip('My Flutter App');
  }

  /// 设置菜单
  @override
  Future<void> setMenu(List<TrayMenuItem> items) async {
    _handlers.clear();

    final menuItems = <MenuItem>[];

    for (int i = 0; i < items.length; i++) {
      final key = 'menu_$i';

      _handlers[key] = items[i].onClick;

      menuItems.add(
        MenuItem(
          key: key,
          label: items[i].label,
        ),
      );
    }

    await tray.setContextMenu(Menu(items: menuItems));
  }

  /// 显示窗口
  @override
  Future<void> showWindow() async {
    await windowManager.show();
    await windowManager.focus();
  }

  /// 隐藏窗口
  @override
  Future<void> hideWindow() async {
    await windowManager.hide();
  }

  /// 释放资源
  @override
  Future<void> dispose() async {
    await tray.destroy();
  }

  /// ⚠️ 注意：新版 tray_manager 通常用的是监听器注册方式（不是 mixin）
  ///
  /// 如果你的版本支持监听：
  /// 需要在 main.dart 注册：
  ///
  /// trayManager.addListener(...)
  ///
  /// 如果不支持，就要改成 plugin callback 或手动监听
  void onTrayMenuItemClick(MenuItem menuItem) {
    final handler = _handlers[menuItem.key];
    handler?.call();
  }
}