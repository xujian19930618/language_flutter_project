import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PaddingDemo extends StatelessWidget {
  const PaddingDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("头部区域")),
        body: Padding(
          // padding: EdgeInsets.all(20),
          padding: EdgeInsets.only(top: 10, right: 10, left: 10, bottom: 10),
          // 设置某几个个内边距
          child: Container(color: Colors.amber, child: Text('带内边距的内容')),
        ),
      )
    );
  }
}
