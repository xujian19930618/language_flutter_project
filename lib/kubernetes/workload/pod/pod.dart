import 'package:language_flutter_project/kubernetes/workload/pod/pod_spec.dart';

class Pod {
  final String name;
  final String namespace;
  final PodSpec spec;

  Pod({required this.name, required this.namespace, required this.spec});
}
