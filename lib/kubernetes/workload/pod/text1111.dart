import 'package:flutter/material.dart';
import 'package:language_flutter_project/kubernetes/workload/pod/pod.dart';
import 'package:language_flutter_project/kubernetes/workload/pod/pod_service.dart';

class PodNotifier extends ChangeNotifier {
  final PodService service;
  List<Pod> pods = [];

  PodNotifier(this.service);

  Future<void> load(String ns) async {
    pods = await service.listPods(ns);
    for (final p in pods) {
      debugPrint("Loaded: ${p.toString()}");
    }
    notifyListeners();
  }

  Future<void> create(Pod pod) async {
    await service.createPod(pod);
    await load(pod.namespace);
  }

  Future<void> delete(String ns, String name) async {
    await service.deletePod(ns, name);
    await load(ns);
  }
}

class PodPage extends StatefulWidget {
  final PodService service;
  final String namespace;

  const PodPage({super.key, required this.service, required this.namespace});

  @override
  State<PodPage> createState() => _PodPageState();
}

class _PodPageState extends State<PodPage> {
  late final PodNotifier notifier;

  @override
  void initState() {
    super.initState();
    notifier = PodNotifier(widget.service);
    notifier.load(widget.namespace);
  }

  @override
  void dispose() {
    notifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    notifier.pods
        .map((p) => debugPrint(p.toString()))
        .toList();
    return AnimatedBuilder(
      animation: notifier,
      builder: (context, _) {
        return ListView(
          children: notifier.pods.map((p) {
            return ListTile(
              title: Text(p.name),
              subtitle: Text(p.spec.image),
              trailing: IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {
                  notifier.delete(p.namespace, p.name);
                },
              ),
            );
          }).toList(),
        );
      },
    );
  }
}
