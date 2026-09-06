import 'package:flutter/material.dart';
import 'routes/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: '首页'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () => _navigateTo(context, '/settings'),
            tooltip: '设置',
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              '欢迎使用 Flutter Demo',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            const Text(
              '点击按钮跳转到不同页面',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Card(
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      _buildRouteItem(
                        context,
                        icon: Icons.info_outline,
                        title: '详情页',
                        subtitle: '查看详细信息',
                        onTap: () => _navigateTo(context, '/detail'),
                      ),
                      const Divider(),
                      _buildRouteItem(
                        context,
                        icon: Icons.person,
                        title: '个人中心',
                        subtitle: '查看个人资料',
                        onTap: () => _navigateTo(context, '/profile'),
                      ),
                      const Divider(),
                      _buildRouteItem(
                        context,
                        icon: Icons.settings_applications,
                        title: '设置',
                        subtitle: '应用设置',
                        onTap: () => _navigateTo(context, '/settings'),
                      ),
                      const Divider(),
                      _buildRouteItem(
                        context,
                        icon: Icons.search,
                        title: '搜索',
                        subtitle: '搜索内容',
                        onTap: () => _navigateTo(context, '/search'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRouteItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: Row(
          children: [
            Icon(icon, size: 32),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
            const Icon(
              Icons.chevron_right,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }

  void _navigateTo(BuildContext context, String route) {
    // 检查路由是否存在
    final routes = AppRoutes.routes;
    if (routes.contains(route)) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => AppRoutes.getPageWidget(route)),
      );
    }
  }
}
