import 'package:flutter/material.dart';

class LifecycleStatefulW extends StatefulWidget {
  const LifecycleStatefulW({super.key});

  @override
  State<StatefulWidget> createState() {
    debugPrint("创建阶段: createState");
    return _LifecycleDemoState();
  }
}

class _LifecycleDemoState extends State<LifecycleStatefulW> {
  int count = 0;

  @override
  void initState() {
    debugPrint("创建阶段: initState");
    super.initState();
  }

  @override
  void didChangeDependencies() {
    debugPrint("创建阶段: didChangeDependencies");
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("构建: build");
    return
    // 为应用提供 Material Design 风格和全局配置
    MaterialApp(
      // 用于展示窗口的标题内容(可以不设置)
      title: 'xujian',
      // 用于设置整个应用的主题
      theme: ThemeData(scaffoldBackgroundColor: Colors.blue),
      // 快速搭建页面骨架, 用于展示窗口的主题内容
      home: Scaffold(
        appBar: AppBar(title: const Text('有状态组件')),
        body: Center(child: Text("${count}")),
        bottomNavigationBar: SizedBox(
          height: 80,
          child: Center(child: Text("底部区域")),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              count++;
            });
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }

  @override
  void didUpdateWidget(covariant LifecycleStatefulW oldWidget) {
    debugPrint("更新阶段: didUpdateWidget");
    super.didUpdateWidget(oldWidget);
  }

  @override
  void deactivate() {
    debugPrint("销毁阶段: deactivate");
    super.deactivate();
  }

  @override
  void dispose() {
    debugPrint("销毁阶段: dispose");
    super.dispose();
  }
}
