import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        // body: Align(
        //   alignment: Alignment.bottomRight,
        //   child: Text(
        //     "Hello Container",
        //     style: TextStyle(color: Colors.amber, fontSize: 20),
        //   ),
        // )
        body: Container(
          transform: Matrix4.rotationZ(0.05),
          // 弧度
          margin: EdgeInsets.all(20),
          // 外边距
          alignment: Alignment.center,
          width: 200,
          height: 200,
          // color: Colors.blue,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(width: 3, color: Colors.amber),
          ),
        ),
      ),
    );
  }
}
