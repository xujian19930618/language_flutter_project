import 'package:flutter/material.dart';
import 'package:language_flutter_project/tray/app_tray_factory.dart';
import 'package:language_flutter_project/tray/tray_controller.dart';
import 'package:window_manager/window_manager.dart';
void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  // 初始化桌面窗口控制
  await windowManager.ensureInitialized();

  // 延迟初始化托盘
  final tray = AppTrayFactory.create();
  final controller = TrayController(tray);
  await controller.init();

  runApp(const Demo());

}
class Demo extends StatelessWidget {
  const Demo({super.key});

  @override
  Widget build(BuildContext context) {
    return
      // 为应用提供 Material Design 风格和全局配置
      MaterialApp(
        // 用于展示窗口的标题内容(可以不设置)
        title: 'xujian',
        // 用于设置整个应用的主题
        theme: ThemeData(scaffoldBackgroundColor: Colors.blue),
        // 快速搭建页面骨架, 用于展示窗口的主题内容
        home: Scaffold(
          appBar: AppBar(
            title: const Text('头部区域'),
          ),
          body: Center(
            child: Text('中部区域'),
          ),
          bottomNavigationBar: SizedBox(
            height: 80,
            child: Center(
              child: Text('底部区域'),
            ),
          ),
        ),
      );
  }

}
