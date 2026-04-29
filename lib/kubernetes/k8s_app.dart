import 'dart:io';

import 'package:flutter/material.dart';
import 'k8s_kubectl.dart';
import 'k8s_service.dart';

class K8sApp extends StatelessWidget {
  final K8sService service = K8sService(Kubectl());

  // ✅ 关键：缓存 Future，避免 build 重复请求
  late final Future<List<dynamic>> podsFuture;

  K8sApp({super.key}) {
    podsFuture = service.getPods();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'xujian',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.blue.shade50,
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('K8s Pods'),
        ),

        body: FutureBuilder<List<dynamic>>(
          future: podsFuture,
          builder: (context, snapshot) {
            // debug（只建议保留在开发阶段）
            // print(Directory.current.path);

            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            if (snapshot.hasError) {
              return Center(
                child: Text(
                  "Error: ${snapshot.error}",
                  style: const TextStyle(color: Colors.red),
                ),
              );
            }

            final pods = snapshot.data ?? [];

            if (pods.isEmpty) {
              return const Center(
                child: Text("No Pods Found"),
              );
            }

            return ListView.builder(
              itemCount: pods.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: const Icon(Icons.storage),
                  title: Text(pods[index].toString()),
                );
              },
            );
          },
        ),

        bottomNavigationBar: const SizedBox(
          height: 60,
          child: Center(
            child: Text('K8s Dashboard Footer'),
          ),
        ),
      ),
    );
  }
}