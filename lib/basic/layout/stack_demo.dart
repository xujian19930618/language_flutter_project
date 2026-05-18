import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StackDemo extends StatelessWidget {
  const StackDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("头部区域")),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          // alignment: AlignmentGeometry.bottomCenter,
          // fit: StackFit.passthrough,
          // clipBehavior: Clip.antiAlias,
          children: [
            Positioned(
              left: 20,
              top: 20,
              child: Container(width: 220, height: 220, color: Colors.black),
            ),
            Positioned(
              left: 20,
              top: 20,
              child: Container(width: 60, height: 60, color: Colors.red),
            ),
            Positioned(
              right: 20,
              bottom: 20,
              child: Container(width: 60, height: 60, color: Colors.blue),
            ),
          ],
        ),
      ),
    );
  }
}
