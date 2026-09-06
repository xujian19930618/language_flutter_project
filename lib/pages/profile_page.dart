import 'package:flutter/material.dart';

/// 个人中心页
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('个人中心'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              child: const Icon(Icons.person, size: 50),
            ),
            const SizedBox(height: 20),
            const Text('用户姓名', style: TextStyle(fontSize: 20)),
            const SizedBox(height: 10),
            const Text('ID: 123456', style: TextStyle(fontSize: 16)),
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
