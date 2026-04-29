import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContainerDemo extends StatelessWidget {
  const ContainerDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "标题",
      home: Scaffold(
        appBar: AppBar(title: Text("头部区域")),
        body: Container(
          transform: Matrix4.rotationZ(0.1),
          // 旋转
          // 布局定位
          // alignment: Alignment.topRight,
          // alignment: Alignment.topLeft,
          // alignment: Alignment.topCenter,
          // alignment: Alignment.centerLeft,
          // alignment: Alignment.center,
          // alignment: Alignment.centerRight,
          // alignment: Alignment.bottomLeft,
          // alignment: Alignment.bottomCenter,
          alignment: Alignment.bottomRight,
          // 设置宽度/高度
          width: double.infinity,
          height: double.infinity,
          // podding 和 margin
          padding: EdgeInsets.all(100),
          margin: EdgeInsets.all(100),
          // color: Colors.red,
          decoration: BoxDecoration(
            // 装饰效果
            borderRadius: BorderRadius.circular(50), // 设置圆角
            color: Colors.blue,
            border: Border.all(
              // 设置边框
              width: 10,
              color: Colors.amber,
            ),
          ),
          child: Text(
            "中部区域",
            style: TextStyle(color: Colors.black, fontSize: 20),
          ),
        ),
      ),
    );
  }
}
