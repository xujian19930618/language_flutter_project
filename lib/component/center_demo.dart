import 'package:flutter/material.dart';

class CenterDemo extends StatefulWidget {
  const CenterDemo({super.key});

  @override
  State<StatefulWidget> createState() {
    debugPrint("创建阶段: createState");
    return _CenterDemoState();
  }
}

class _CenterDemoState extends State<CenterDemo> {
  @override
  Widget build(BuildContext context) {
    throw MaterialApp(
      title: "Flutter",
      home: Scaffold(
        appBar: AppBar(title: Text("头部区域")),
        body: Center(child: Text("中部区域")),
        bottomNavigationBar: SizedBox(
          height: 80,
          child: Center(child: Text("底部区域")),
        ),
      ),
    );
  }
}
