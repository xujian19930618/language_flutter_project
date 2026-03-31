import 'package:flutter/material.dart';

import 'container.dart';

void main() {
  runApp(MainPage());
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
}

// class MainPage extends StatelessWidget {
//   const MainPage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return MaterialApp(
//
//       home: Scaffold(
//           body: Align(
//             alignment: Alignment.bottomRight,
//             child: Text(
//               "Hello Container",
//               style: TextStyle(color: Colors.amber, fontSize: 20),
//             ),
//           )
//         // body: Container(
//         //   transform: Matrix4.rotationZ(0.05), // 弧度
//         //   margin: EdgeInsets.all(20), // 外边距
//         //   alignment: Alignment.center,
//         //   width: 200,
//         //   height: 200,
//         //   // color: Colors.blue,
//         //   decoration: BoxDecoration(
//         //     color: Colors.blue,
//         //     borderRadius: BorderRadius.circular(15),
//         //     border: Border.all(width: 3, color: Colors.amber)
//         //   ),
//         //
//         // ),
//       ),
//     );
//   }
// }

// class MainPage extends StatefulWidget {
//   const MainPage({super.key});
//
//   @override
//   State<StatefulWidget> createState() {
//     print("创建阶段: createState");
//     return _MainPageState();
//   }
// }
// class _MainPageState extends State<MainPage> {
//   int count = 0;
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         body: Center(
//           child: Row(
//             children: [
//               TextButton(
//                 onPressed: () {
//                   setState(() {
//                     count++;
//                   });
//                 },
//                 child: Text("减"),
//               ),
//               Text(count.toString()),
//               TextButton(
//                 onPressed: () {
//                   setState(() {
//                     count--;
//                   });
//                 },
//                 child: Text("加"),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

//
// class _MainPageState extends State<MainPage> {
//
//   @override
//   void initState() {
//     print("创建阶段: initState");
//     super.initState();
//   }
//   @override
//   void didChangeDependencies() {
//     print("创建阶段: didChangeDependencies");
//     super.didChangeDependencies();
//   }
//   @override
//   Widget build(BuildContext context) {
//     print("构建: build");
//     throw UnimplementedError();
//   }
//   @override
//   void didUpdateWidget(covariant MainPage oldWidget) {
//     print("更新阶段: didUpdateWidget");
//     super.didUpdateWidget(oldWidget);
//   }
//   @override
//   void deactivate() {
//     print("销毁阶段: deactivate");
//     super.deactivate();
//   }
//   @override
//   void dispose() {
//     print("销毁阶段: dispose");
//     super.dispose();
//   }
// }

// class _MainPageState extends State<MainPage> {
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     throw MaterialApp(
//       title: "Flutter",
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
//
// }

// class MainPage extends StatelessWidget {
//   const MainPage({super.key});
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

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: .center,
          children: [
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
