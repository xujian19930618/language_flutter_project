// import 'package:tray_manager/tray_manager.dart';
//
// class WindowsTray implements AppTray {
//   @override
//   Future<void> init() async {
//     await trayManager.setIcon('assets/tray_icon.ico');
//     await trayManager.setToolTip('My Flutter App');
//   }
//
//   @override
//   Future<void> setMenu(List<TrayMenuItem> items) async {
//     final menu = items
//         .map((item) => MenuItem(label: item.label, onClick: item.onClick))
//         .toList();
//     await trayManager.setContextMenu(menu);
//   }
//
//   @override
//   Future<void> showWindow() => trayManager.showWindow();
//
//   @override
//   Future<void> hideWindow() => trayManager.hideWindow();
//
//   @override
//   Future<void> dispose() => trayManager.destroy();
// }