import 'dart:convert';
import 'dart:io';

class Kubectl {
  Future<String> run(List<String> args) async {
    final result = await Process.run('kubectl', args);

    if (result.exitCode != 0) {
      throw Exception(result.stderr);
    }

    return result.stdout;
  }

  /// 通用 JSON 命令
  Future<dynamic> runJson(List<String> args) async {
    final out = await run(args);
    return jsonDecode(out);
  }
}