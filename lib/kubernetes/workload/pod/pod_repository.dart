import 'dart:convert';
import 'dart:io';

import 'package:language_flutter_project/kubernetes/workload/pod/pod.dart';
import 'package:language_flutter_project/kubernetes/workload/pod/pod_spec.dart';

class PodRepository {
  final HttpClient client;
  final Uri baseUri;

  PodRepository(this.client, {Uri? baseUri})
    : baseUri = baseUri ?? Uri.parse('http://localhost:8001');

  // CREATE
  Future<void> create(Pod pod) async {
    await _send(
      'POST',
      '/api/v1/namespaces/${pod.namespace}/pods',
      body: {
        'kind': 'Pod',
        'metadata': {'name': pod.name},
        'spec': {'image': pod.spec.image, 'replicas': pod.spec.replicas},
      },
    );
  }

  // GET ONE
  Future<Pod> get(String namespace, String name) async {
    final res = await _send('GET', '/api/v1/namespaces/$namespace/pods/$name');

    return Pod(
      name: res['metadata']['name'],
      namespace: namespace,
      spec: PodSpec(
        image: res['spec']['image'],
        replicas: res['spec']['replicas'],
      ),
    );
  }

  // LIST
  Future<List<Pod>> list(String namespace) async {
    final res = await _send('GET', '/api/v1/namespaces/$namespace/pods');

    return (res['items'] as List).map((e) {
      return Pod(
        name: e['metadata']['name'],
        namespace: namespace,
        spec: PodSpec(
          image: e['spec']['image'],
          replicas: e['spec']['replicas'],
        ),
      );
    }).toList();
  }

  // UPDATE
  Future<void> update(Pod pod) async {
    await _send(
      'PUT',
      '/api/v1/namespaces/${pod.namespace}/pods/${pod.name}',
      body: {
        'spec': {'image': pod.spec.image, 'replicas': pod.spec.replicas},
      },
    );
  }

  // DELETE
  Future<void> delete(String namespace, String name) async {
    await _send('DELETE', '/api/v1/namespaces/$namespace/pods/$name');
  }

  Future<dynamic> _send(
    String method,
    String path, {
    Map<String, dynamic>? body,
  }) async {
    final request = await client.openUrl(method, baseUri.resolve(path));
    request.headers.contentType = ContentType.json;

    if (body != null) {
      request.write(jsonEncode(body));
    }

    final response = await request.close();
    final responseBody = await response.transform(utf8.decoder).join();

    if (response.statusCode < HttpStatus.ok ||
        response.statusCode >= HttpStatus.multipleChoices) {
      throw HttpException(
        'Kubernetes API request failed: ${response.statusCode} $responseBody',
        uri: baseUri.resolve(path),
      );
    }

    if (responseBody.isEmpty) {
      return null;
    }

    return jsonDecode(responseBody);
  }
}
