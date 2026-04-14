import 'dart:io';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:system_tray/system_tray.dart';
import 'package:window_manager/window_manager.dart';

import 'AppTray.dart';

/// macOS / Linux 系统托盘实现（基于 system_tray）
class MacOSTray implements AppTray {
  final SystemTray _systemTray = SystemTray();

  /// key -> 回调映射（统一 Windows 设计）
  final Map<String, VoidCallback> _handlers = {};

  /// 初始化托盘
  @override
  Future<void> init() async {
    await windowManager.ensureInitialized();

    final iconPath = await _generateIcon();

    await _systemTray.initSystemTray(
      title: "My Flutter App",
      iconPath: iconPath,
    );

    /// 监听托盘事件
    _systemTray.registerSystemTrayEventHandler((eventName) async {
      debugPrint("Tray event: $eventName");

      /// 左键点击：弹出菜单
      if (eventName == kSystemTrayEventClick) {
        _systemTray.popUpContextMenu();
      }
    });
  }

  /// 设置菜单（统一 AppTray 接口）
  @override
  Future<void> setMenu(List<TrayMenuItem> items) async {
    _handlers.clear();

    final menu = Menu();

    final menuList = <MenuItemBase>[];

    for (int i = 0; i < items.length; i++) {
      final key = 'menu_$i';

      _handlers[key] = items[i].onClick;

      menuList.add(
        MenuItemLabel(
          label: items[i].label,
          onClicked: (menuItem) {
            _handlers[key]?.call();
          },
        ),
      );
    }

    menuList.add(MenuSeparator());

    await menu.buildFrom(menuList);

    await _systemTray.setContextMenu(menu);
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
    // system_tray 没有 destroy API（安全忽略）
  }

  /// 生成托盘图标（runtime PNG）
  Future<String> _generateIcon() async {
    final recorder = ui.PictureRecorder();
    final canvas = ui.Canvas(recorder);
    const size = 64.0;

    final paint = Paint()..color = Colors.blue;
    canvas.drawCircle(const Offset(size / 2, size / 2), size / 2, paint);

    final textPainter = TextPainter(
      text: const TextSpan(
        text: '🏠',
        style: TextStyle(fontSize: 32),
      ),
      textDirection: TextDirection.ltr,
    );

    textPainter.layout();
    textPainter.paint(
      canvas,
      Offset(
        (size - textPainter.width) / 2,
        (size - textPainter.height) / 2,
      ),
    );

    final image = await recorder.endRecording().toImage(64, 64);
    final byteData = await image.toByteData(format: ui.ImageByteFormat.png);

    final file = File('${Directory.systemTemp.path}/tray_icon.png');
    await file.writeAsBytes(byteData!.buffer.asUint8List());

    return file.path;
  }
}