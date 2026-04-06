import 'package:flutter/material.dart';
import 'package:language_flutter_project/component/AlignDemo.dart';
import 'package:language_flutter_project/component/ContainerDemo.dart';
import 'package:language_flutter_project/layout/ColumnDemo.dart';
import 'package:language_flutter_project/layout/FlexDemo.dart';
import 'package:language_flutter_project/layout/RowDemo.dart';
import 'package:language_flutter_project/layout/StackDemo.dart';
import 'package:language_flutter_project/layout/WrapDemo.dart';
import 'package:language_flutter_project/widget/GestureDetectorDemo.dart';
import 'package:language_flutter_project/widget/LifecycleStatefulW.dart';
import 'package:language_flutter_project/widget/LifecycleStatelessW.dart';
import 'package:language_flutter_project/widget/TextButtonDemo.dart';
import 'component/PaddingDemo.dart';

void main() {
  // 将根组件挂载到屏幕上
  runApp(MainDemo());
}

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
      home: StackDemo(),
    );
  }
}


// class MainPage1 extends StatelessWidget {
//   const MainPage1({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return MaterialApp(
//       title: "标题",
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text("头部区域"),
//         ),
//         body: Container(
//           child: Center(
//             child: Text("中部区域"),
//           ),
//         ),
//         bottomNavigationBar: Container(
//           height: 80,
//           child: Center(
//             child: Text("底部区域"),
//           ),
//         ),
//       ),
//     );
//   }
// }

// runApp(const MyApp());
// runApp(MaterialApp(
//   title: "xujian",
//   theme: ThemeData(
//     scaffoldBackgroundColor: Colors.blue
//   ),
//
//   home: Scaffold(
//     appBar: AppBar(
//       title: Text("头部区域"),
//     ),
//     body: Container(
//       child: Center(
//         child: Text("中部区域"),
//       ),
//     ),
//     bottomNavigationBar: Container(
//       height: 80,
//       child: Center(
//         child: Text("底部区域"),
//       ),
//     ),
//   ),
// ));
