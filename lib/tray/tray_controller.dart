import 'dart:io';

import 'app_tray.dart';

class TrayController {
  final AppTray tray;

  TrayController(this.tray);

  Future<void> init() async {
    await tray.init();

    await tray.setMenu([
      TrayMenuItem(
        label: "显示窗口",
        onClick: () => tray.showWindow(),
      ),
      TrayMenuItem(
        label: "隐藏窗口",
        onClick: () => tray.hideWindow(),
      ),
      TrayMenuItem(
        label: "退出",
        onClick: () => exit(0),
      ),
    ]);
  }
}