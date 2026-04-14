// class AppTrayFactory {
//   static AppTray create() {
//     if (Platform.isWindows) {
//       return WindowsTray();
//     } else if (Platform.isMacOS) {
//       return MacOSTray(); // 你自己实现
//     } else if (Platform.isLinux) {
//       return LinuxTray(); // 你自己实现
//     } else {
//       throw UnsupportedError('This platform is not supported');
//     }
//   }
// }