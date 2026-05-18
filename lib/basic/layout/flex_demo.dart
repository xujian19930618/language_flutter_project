import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FlexDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("头部区域")),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Flex(
          direction: Axis.vertical,
          children: [
            Expanded(
              flex: 2, // 分配空间比例
              child: Container(color: Colors.red, height: 100, width: 100),
            ),
            Expanded(
              flex: 1, // 分配空间比例
              child: Container(color: Colors.blue, height: 100, width: 100),
            ),
          ],
        )
      )
    );
  }
}
