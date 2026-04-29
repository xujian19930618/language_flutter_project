import 'dart:convert';
import 'dart:io';

import 'kubectl.dart';

class K8sService {
  final Kubectl kubectl;

  K8sService(this.kubectl);

  Future<List<dynamic>> getPods({String? namespace}) async {
    final args = ['get', 'pods' , '-A', '-o', 'json'];

    if (namespace != null) {
      args.insertAll(2, ['-n', namespace]);
    }

    final data = await kubectl.runJson(args);
    return data['items'];
  }

  Future<void> deletePod(String pod, {String? namespace}) async {
    final args = ['delete', 'pod', pod];

    if (namespace != null) {
      args.insertAll(2, ['-n', namespace]);
    }

    await kubectl.run(args);
  }

  Stream<String> logs(String pod, {String? namespace}) async* {
    final args = ['logs', '-f', pod];

    if (namespace != null) {
      args.insertAll(1, ['-n', namespace]);
    }

    final process = await Process.start('kubectl', args);

    yield* process.stdout
        .transform(utf8.decoder)
        .transform(const LineSplitter());
  }

  Stream<String> config() async* {
    final args = ['config', 'current-context'];

    final process = await Process.start('kubectl', args);

    yield* process.stdout
        .transform(utf8.decoder)
        .transform(const LineSplitter());
  }
}
