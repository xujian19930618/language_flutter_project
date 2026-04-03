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
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw MaterialApp(
      title: "Flutter",
      home: Scaffold(
        appBar: AppBar(
          title: Text("头部区域"),
        ),
        body: Container(
          child: Center(
            child: Text("中部区域"),
          ),
        ),
        bottomNavigationBar: Container(
          height: 80,
          child: Center(
            child: Text("底部区域"),
          ),
        ),
      ),
    );
  }

}



