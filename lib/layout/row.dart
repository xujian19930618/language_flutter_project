import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<StatefulWidget> createState() {
    debugPrint("创建阶段: createState");
    return _MainPageState();
  }
}

class _MainPageState extends State<MainPage> {
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
                  setState(() {
                    count++;
                  });
                },
                child: Text("减"),
              ),
              Text(count.toString()),
              TextButton(
                onPressed: () {
                  setState(() {
                    count--;
                  });
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
