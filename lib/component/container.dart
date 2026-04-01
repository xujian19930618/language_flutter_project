import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "标题",
      home: Scaffold(
        appBar: AppBar(
          title: Text("头部区域"),
        ),
        body: Container(
          child: Center(
            child: Text("中部区域"),
          ),
        ),
      ),
      
    );
  }
  
}