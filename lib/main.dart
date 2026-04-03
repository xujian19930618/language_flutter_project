import 'package:flutter/material.dart';
// import 'package:language_flutter_project/widget/LifecycleStatefulW.dart';
import 'package:language_flutter_project/widget/LifecycleStatelessW.dart';

void main() {
  // 将根组件挂载到屏幕上
  runApp(LifecycleStatelessW());
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
