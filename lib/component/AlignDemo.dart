import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AlignDemo extends StatelessWidget {
  const AlignDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            border: Border.all(
              width: 10,
              color: Colors.black
            )
          ),
          child: Align(

            // alignment: Alignment.topRight,
            // alignment: Alignment.topLeft,
            alignment: Alignment.topCenter,
            // alignment: Alignment.centerLeft,
            // alignment: Alignment.center,
            // alignment: Alignment.centerRight,
            // alignment: Alignment.bottomLeft,
            // alignment: Alignment.bottomCenter,
            // alignment: Alignment.bottomRight,
            widthFactor: 3,
            heightFactor: 3,
            child: Icon(
              Icons.star,
              size: 150,
              color: Colors.amber,
              // style: TextStyle(color: Colors.amber, fontSize: 20),
            ),

          ),
        )

      ),
    );
  }
}
