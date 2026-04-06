import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WrapDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _WrapDemoState();
}

class _WrapDemoState extends State<WrapDemo> {
  List<Widget> getList() {
    return List.generate(10, (index) {
      return Container(
        width: 100,
        height: 60,
        alignment: Alignment.center,
        color: Colors.blue,
        child: Text('标签 $index', style: const TextStyle(color: Colors.white)),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("头部区域")),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Wrap(
            spacing: 10,
            runSpacing: 10,
            direction: Axis.horizontal,
            children: getList(),
        ),
      ),
    );
  }
}
