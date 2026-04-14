import 'dart:io';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:system_tray/system_tray.dart';
import 'package:window_manager/window_manager.dart';

class MacOSTray {
  final SystemTray _systemTray = SystemTray();


  Future<String> _generateIcon() async {
    // 创建一个 64x64 的图标画布
    final ui.PictureRecorder recorder = ui.PictureRecorder();
    final ui.Canvas canvas = ui.Canvas(recorder);
    final Paint paint = Paint()..color = Colors.blue;
    const double size = 64;

    // 背景圆形
    canvas.drawCircle(Offset(size / 2, size / 2), size / 2, paint);

    // 绘制一个 Icon（使用 emoji）
    final textPainter = TextPainter(
      text: const TextSpan(
        text: '🏠', // 可以换成其他 emoji
        style: TextStyle(fontSize: 32),
      ),
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();
    textPainter.paint(
      canvas,
      Offset((size - textPainter.width) / 2, (size - textPainter.height) / 2),
    );

    final ui.Image image = await recorder
        .endRecording()
        .toImage(size.toInt(), size.toInt());

    final byteData =
    await image.toByteData(format: ui.ImageByteFormat.png);

    // 使用系统临时目录
    final tempDir = Directory.systemTemp;
    final file = File('${tempDir.path}/tray_icon.png');
    await file.writeAsBytes(byteData!.buffer.asUint8List());
    return file.path;
  }
  Future<void> init() async {
    // 初始化 window_manager
    await windowManager.ensureInitialized();

    // 托盘图标路径
    // final iconPath = 'assets/icon.png';

    final iconPath = await _generateIcon();
    // 初始化托盘
    await _systemTray.initSystemTray(
      title: "我的 macOS 托盘",
      iconPath: iconPath,
    );

    // 绑定事件
    _systemTray.registerSystemTrayEventHandler((eventName) async {
      debugPrint("托盘事件: $eventName");
      // 左键点击 → 弹出菜单
      if (eventName == kSystemTrayEventClick) {
        _systemTray.popUpContextMenu();
      }
    });

    // 创建菜单
    final menu = Menu();
    await menu.buildFrom([
      MenuItemLabel(
        label: '显示窗口',
        onClicked: (menuItem) async {
          await windowManager.show();
          await windowManager.focus();
        },
      ),
      MenuItemLabel(
        label: '隐藏窗口',
        onClicked: (menuItem) async {
          await windowManager.hide();
        },
      ),
      MenuSeparator(),
      MenuItemLabel(
        label: '退出',
        onClicked: (menuItem) async {
          exit(0);
        },
      ),
    ]);

    await _systemTray.setContextMenu(menu);
  }
}