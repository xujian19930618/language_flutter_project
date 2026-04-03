import 'package:flutter/material.dart';

class TextButtonDemo1 extends StatelessWidget {
  const TextButtonDemo1({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint("构建阶段");
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('头部区域')),
        body: TextButton(
          onPressed: () {
            debugPrint("点击事件");
          },
          child: Center(child: Text('中部区域')),
        ),
        bottomNavigationBar: const SizedBox(
          height: 80,
          child: Center(child: Text('底部区域')),
        ),
      ),
    );
  }
}

class Textbuttondemo2 extends StatefulWidget {
  const Textbuttondemo2({super.key});

  @override
  State<Textbuttondemo2> createState() => _TextbuttondemoState();
}

class _TextbuttondemoState extends State<Textbuttondemo2> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Row(
            children: [
              TextButton(
                onPressed: () {
                  count -= 1;
                  setState(() {});
                },
                child: Text("减"),
              ),
              Text(count.toString()),
              TextButton(
                onPressed: () {
                  count += 1;
                  setState(() {});
                },
                child: Text("加"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
