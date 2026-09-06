import 'package:flutter/material.dart';

/// 设置页
class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('设置'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          const ListTile(
            title: Text('深色模式'),
            subtitle: Text('正在使用浅色模式'),
          ),
          const Divider(),
          const ListTile(
            title: Text('通知设置'),
            subtitle: Text('通知已开启'),
          ),
          const Divider(),
          const ListTile(
            title: Text('关于'),
            subtitle: Text('版本 1.0.0'),
          ),
        ],
      ),
    );
  }
}
