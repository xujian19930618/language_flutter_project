import 'package:flutter/cupertino.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<StatefulWidget> createState() {
    print("创建阶段: createState");
    return _MainPageState();
  }
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    print("创建阶段: initState");
    super.initState();
  }

  @override
  void didChangeDependencies() {
    print("创建阶段: didChangeDependencies");
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    print("构建: build");
    throw UnimplementedError();
  }

  @override
  void didUpdateWidget(covariant MainPage oldWidget) {
    print("更新阶段: didUpdateWidget");
    super.didUpdateWidget(oldWidget);
  }

  @override
  void deactivate() {
    print("销毁阶段: deactivate");
    super.deactivate();
  }

  @override
  void dispose() {
    print("销毁阶段: dispose");
    super.dispose();
  }
}
