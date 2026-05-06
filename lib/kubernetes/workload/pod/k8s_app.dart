import 'dart:io';

import 'package:flutter/material.dart';
import 'package:language_flutter_project/kubernetes/workload/pod/pod_repository.dart';
import 'package:language_flutter_project/kubernetes/workload/pod/pod_service.dart';
import 'package:language_flutter_project/kubernetes/workload/pod/text1111.dart';

class K8sApp extends StatelessWidget {
  K8sApp({super.key});

  final PodService service = PodService(PodRepository(HttpClient()));

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'K8s Pods',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      home: Scaffold(
        appBar: AppBar(title: const Text('K8s Pods')),
        body: PodPage(service: service, namespace: 'default'),
      ),
    );
  }
}
