import 'package:flutter/material.dart';

class GestureDetectorDemo extends StatelessWidget {
  const GestureDetectorDemo({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint("构建阶段");
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('头部区域')),
        body: GestureDetector(
            onTap: (){
              debugPrint("点击事件");
            },
            child: Center(child: Text('中部区域'))),
        bottomNavigationBar: const SizedBox(
          height: 80,
          child: Center(child: Text('底部区域')),
        ),
      ),
    );
  }
}
