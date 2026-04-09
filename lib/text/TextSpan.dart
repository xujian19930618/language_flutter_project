import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextSpanDemo extends StatefulWidget {
  const TextSpanDemo({super.key});

  @override
  State<TextSpanDemo> createState() => _TextSpanDemoState();
}

class _TextSpanDemoState extends State<TextSpanDemo> {
  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
          text: "Hello", // 默认样式的文本
          style: TextStyle(fontSize: 36.0),
          children: [
            TextSpan(
                text: "Flutter", // 特殊样式的子文本
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.green
                )
            ),
            TextSpan(text: '!'), // 继续默认样式
          ]
      )
    );
  }
}
