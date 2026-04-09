import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImageDemo extends StatefulWidget {
  const ImageDemo({super.key});

  @override
  State<ImageDemo> createState() => _ImageDemoState();
}

class _ImageDemoState extends State<ImageDemo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      height: double.infinity,
      color: Colors.amber,
      child: Image.asset(
        "images/1.jpg",
        width: 200,
        height: 200,
        // fit: BoxFit.contain,
        // fit: BoxFit.cover,
        fit: BoxFit.fill,
        repeat: ImageRepeat.repeat,
      ),
    );
  }
}
