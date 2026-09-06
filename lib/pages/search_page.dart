import 'package:flutter/material.dart';

/// 搜索页
class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('搜索'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        leading: IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          const TextField(
            decoration: InputDecoration(
              hintText: '搜索关键词...',
              prefixIcon: Icon(Icons.search),
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.search_off, size: 80),
                  const SizedBox(height: 20),
                  const Text(
                    '暂无搜索结果',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
