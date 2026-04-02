import 'package:flutter/material.dart';

class StatefulW extends StatefulWidget {
  const StatefulW({super.key});

  // @override
  // State<StatefulWidget> createState() {
  //   return _StatefulWState();
  // }
  @override
  State<StatefulWidget> createState() => _StatefulWState();
}

class _StatefulWState extends State<StatefulW> {
  int count = 0;

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
}
