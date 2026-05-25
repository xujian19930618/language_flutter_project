import 'dart:io';

import 'package:flutter/material.dart';
import 'package:language_flutter_project/basic/routes/ListAaa.dart';
import 'package:language_flutter_project/basic/routes/ListBbb.dart';
import 'package:language_flutter_project/basic/tray/app_tray_factory.dart';
import 'package:language_flutter_project/basic/tray/tray_controller.dart';
import 'package:language_flutter_project/register/register_demo.dart';
import 'package:window_manager/window_manager.dart';

import 'ai_chat/my_app.dart';
import 'kubernetes/k8s_app.dart';


void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  // 初始化桌面窗口控制
  await windowManager.ensureInitialized();

  // 延迟初始化托盘
  final tray = AppTrayFactory.create();
  final controller = TrayController(tray);
  await controller.init();

  // runApp(K8sApp());

  // runApp(K8sApp());
  runApp(const RegisterDemo());

  // runApp(
  //   MaterialApp(
  //     title: "标题",
  //     initialRoute: "/aaa",
  //     routes: {
  //       "/aaa": (context) => ListAaa(),
  //       "/bbb":  (context) => ListBbb(),
  //     },
  //   )
  // );
}
