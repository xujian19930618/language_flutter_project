import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextDemo extends StatefulWidget {
  const TextDemo({super.key});

  @override
  State<TextDemo> createState() => _TextDemoState();
}

class _TextDemoState extends State<TextDemo> {
  @override
  Widget build(BuildContext context) {
    return Text(
      "Hello World!Hello World!Hello World!Hello World!Hello World!Hello World!Hello World!Hello World!Hello World!Hello World!",
      // maxLines: 2, // 限制为2行
      softWrap: true, // 允许换行,默认
      textAlign: TextAlign.center,    // 居中
      style: TextStyle(
        color: Colors.amber,    // 颜色
        fontSize: 30,       // 文字大小
        fontStyle: FontStyle.italic,    // 字体样式
        fontWeight: FontWeight.w800,    // 字重(粗细)
        decoration: TextDecoration.lineThrough, // 装饰(下划线)
        // decoration: TextDecoration.underline,	// 装饰(下划线)
        decorationColor: Colors.red,// 装饰颜色
      ),
    );
  }
}
