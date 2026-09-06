import 'package:flutter/material.dart';

/// 详情页
class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('详情页'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.info_outline, size: 80),
            const SizedBox(height: 20),
            const Text(
              '这是详情页内容',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('返回'),
            ),
          ],
        ),
      ),
    );
  }
}
