import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:language_flutter_project/component/align_demo.dart';
import 'package:language_flutter_project/component/container_demo.dart';
import 'package:language_flutter_project/demo.dart';
import 'package:language_flutter_project/layout/column_demo.dart';
import 'package:language_flutter_project/layout/flex_demo.dart';
import 'package:language_flutter_project/layout/row_demo.dart';
import 'package:language_flutter_project/layout/stack_demo.dart';
import 'package:language_flutter_project/layout/wrap_demo.dart';
import 'package:language_flutter_project/text/image_demo.dart';
import 'package:language_flutter_project/text/text_demo.dart';
import 'package:language_flutter_project/text/text_span.dart';
import 'package:language_flutter_project/tray/app_tray.dart';
import 'package:language_flutter_project/tray/mac_tray.dart';
import 'package:language_flutter_project/widget/gesture_detector_demo.dart';
import 'package:language_flutter_project/widget/lifecycle_stateful_w.dart';
import 'package:language_flutter_project/widget/lifecycle_stateless_w.dart';
import 'package:language_flutter_project/widget/text_button_demo.dart';
import 'animation/fade_in_widget.dart';
import 'component/padding_demo.dart';



class MainDemo extends StatelessWidget {
  const MainDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      // home: const ColumnDemo(),
      // home: const RowDemo(),
      // home: FlexDemo(),
      // home: WrapDemo(),
      // home: StackDemo(),
      // home: TextDemo(),
      // home: TextSpanDemo(),
      // home: ImageDemo(),
      home: Column(
        children: [
          FadeInWidget(child: Text("Fade In")),
          ScaleWidget(child: Text("Scale In")),
          SlideWidget(child: Text("Slide Up")),
          AnimatedBox(child: Container(width: 100, height: 100, color: Colors.blue)),
          HeroWidget(tag: "avatar", child: CircleAvatar(radius: 30)),
          BounceWidget(child: Icon(Icons.favorite, color: Colors.red, size: 40)),
        ],
      ),

    );
  }
}