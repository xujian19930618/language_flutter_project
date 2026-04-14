import 'package:flutter/material.dart';
import 'package:language_flutter_project/component/AlignDemo.dart';
import 'package:language_flutter_project/component/ContainerDemo.dart';
import 'package:language_flutter_project/layout/ColumnDemo.dart';
import 'package:language_flutter_project/layout/FlexDemo.dart';
import 'package:language_flutter_project/layout/RowDemo.dart';
import 'package:language_flutter_project/layout/StackDemo.dart';
import 'package:language_flutter_project/layout/WrapDemo.dart';
import 'package:language_flutter_project/text/ImageDemo.dart';
import 'package:language_flutter_project/text/TextDemo.dart';
import 'package:language_flutter_project/text/TextSpan.dart';
import 'package:language_flutter_project/tray/AppTray.dart';
import 'package:language_flutter_project/tray/AppTrayFactory.dart';
import 'package:language_flutter_project/tray/MacTray.dart';
import 'package:language_flutter_project/tray/TrayController.dart';
import 'package:language_flutter_project/widget/GestureDetectorDemo.dart';
import 'package:language_flutter_project/widget/LifecycleStatefulW.dart';
import 'package:language_flutter_project/widget/LifecycleStatelessW.dart';
import 'package:language_flutter_project/widget/TextButtonDemo.dart';
import 'package:window_manager/window_manager.dart';
import 'animation/FadeInWidget.dart';
import 'component/PaddingDemo.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  // 初始化桌面窗口控制
  await windowManager.ensureInitialized();

  // 延迟初始化托盘
  final tray = AppTrayFactory.create();
  final controller = TrayController(tray);
  await controller.init();

  runApp(const MainDemo());

}

class MainDemo extends StatelessWidget {
  const MainDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      // home: const ColumnDemo(),
      // home: const RowDemo(),
      // home: FlexDemo(),
      // home: WrapDemo(),
      // home: StackDemo(),
      // home: TextDemo(),
      // home: TextSpanDemo(),
      // home: ImageDemo(),
      home: Column(
        children: [
          FadeInWidget(child: Text("Fade In")),
          ScaleWidget(child: Text("Scale In")),
          SlideWidget(child: Text("Slide Up")),
          AnimatedBox(child: Container(width: 100, height: 100, color: Colors.blue)),
          HeroWidget(tag: "avatar", child: CircleAvatar(radius: 30)),
          BounceWidget(child: Icon(Icons.favorite, color: Colors.red, size: 40)),
        ],
      ),

    );
  }
}