import 'package:language_flutter_project/kubernetes/workload/pod/pod.dart';
import 'package:language_flutter_project/kubernetes/workload/pod/pod_repository.dart';

class PodService {
  final PodRepository repo;

  PodService(this.repo);

  Future<void> createPod(Pod pod) {
    return repo.create(pod);
  }

  Future<Pod> getPod(String ns, String name) {
    return repo.get(ns, name);
  }

  Future<List<Pod>> listPods(String ns) {
    return repo.list(ns);
  }

  Future<void> updatePod(Pod pod) {
    return repo.update(pod);
  }

  Future<void> deletePod(String ns, String name) {
    return repo.delete(ns, name);
  }
}
