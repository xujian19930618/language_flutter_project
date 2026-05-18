import 'dart:io';

import 'package:language_flutter_project/basic/tray/mac_tray.dart';

import 'app_tray.dart';
import 'windows_tray.dart';

class AppTrayFactory {
  static AppTray create() {
    if (Platform.isWindows) {
      return WindowsTray();
    } else if (Platform.isMacOS) {
      return MacOSTray(); // 你自己实现
    } else if (Platform.isLinux) {
      // return LinuxTray(); // 你自己实现
      // return AppTray();
      throw UnsupportedError('This platform is not supported');
    } else {
      throw UnsupportedError('This platform is not supported');
    }
  }
}