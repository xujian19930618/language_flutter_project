import 'dart:io';

import 'package:flutter/material.dart';
import 'package:language_flutter_project/tray/app_tray_factory.dart';
import 'package:language_flutter_project/tray/tray_controller.dart';
import 'package:window_manager/window_manager.dart';

import 'kubernetes/K8sService.dart';
import 'kubernetes/Kubectl.dart';
void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  // 初始化桌面窗口控制
  await windowManager.ensureInitialized();

  // 延迟初始化托盘
  final tray = AppTrayFactory.create();
  final controller = TrayController(tray);
  await controller.init();

  final kubectl = Kubectl();
  final service = K8sService(kubectl);
  runApp(Demo(service: service));

}
class Demo extends StatelessWidget {
  final K8sService service;
  const Demo({super.key, required this.service});
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
          body: FutureBuilder<List<dynamic>>(
              future: service.getPods(),
              builder: (context, snapshot) {
                // print(service.config());
                print(Directory.current.path);
                print("${snapshot.error}");
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (snapshot.hasError) {
                  return Center(child: Text("Error: ${snapshot.error}"));
                }

                final pods = snapshot.data ?? [];

                return ListView.builder(
                  itemCount: pods.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(pods[index].toString()),
                    );
                  },
                );
              }
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
