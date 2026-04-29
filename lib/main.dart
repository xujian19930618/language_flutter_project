import 'dart:io';

import 'package:flutter/material.dart';
import 'package:language_flutter_project/tray/app_tray_factory.dart';
import 'package:language_flutter_project/tray/tray_controller.dart';
import 'package:window_manager/window_manager.dart';

import 'kubernetes/k8s_app.dart';


void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  // 初始化桌面窗口控制
  await windowManager.ensureInitialized();

  // 延迟初始化托盘
  final tray = AppTrayFactory.create();
  final controller = TrayController(tray);
  await controller.init();

  runApp(K8sApp());

}
