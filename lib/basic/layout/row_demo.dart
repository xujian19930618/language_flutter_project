import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RowDemo extends StatefulWidget {
  const RowDemo({super.key});

  @override
  State<RowDemo> createState() => _RowDemoState();
}

class _RowDemoState extends State<RowDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("头部区域")),
      body: Container(
        width: double.infinity,
        // 最大值
        height: double.infinity,
        // 最大值
        decoration: BoxDecoration(color: Colors.amber),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween, // 两头对齐
          // mainAxisAlignment: MainAxisAlignment.spaceAround, // 环绕模式
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly, // 均分模式
          // mainAxisAlignment: MainAxisAlignment.start, // 从头排列
          mainAxisAlignment: MainAxisAlignment.end, // 从尾排列
          // mainAxisAlignment: MainAxisAlignment.center, // 中间
          //
          // crossAxisAlignment: CrossAxisAlignment.start, // 交叉轴start
          // crossAxisAlignment: CrossAxisAlignment.end, // 交叉轴end
          // crossAxisAlignment: CrossAxisAlignment.center, // 交叉轴center
          // crossAxisAlignment: CrossAxisAlignment.spaceBetween,
          // crossAxisAlignment: CrossAxisAlignment.spaceAround,
          // crossAxisAlignment: CrossAxisAlignment.spaceEvenly,
          children: [
            Container(width: 100, height: 100, color: Colors.blue),
            const SizedBox(height: 10),
            Container(width: 100, height: 100, color: Colors.blue),
            const SizedBox(height: 10),
            Container(width: 100, height: 100, color: Colors.blue),
            const SizedBox(height: 10),
            Container(width: 100, height: 100, color: Colors.blue),
          ],
        ),
      ),
    );
  }
}
