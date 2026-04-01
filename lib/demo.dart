import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '徐剑',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.blue
      ),
      home: const Scaffold(),
    );
  }

}