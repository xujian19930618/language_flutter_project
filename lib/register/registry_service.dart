import 'package:dio/dio.dart';

class RegistryService {
  final Dio dio = Dio();

  Future<List<String>> catalog(String baseUrl) async {
    final response = await dio.get('$baseUrl/v2/_catalog');

    final data = response.data;

    final repositories = List<String>.from(data['repositories'] ?? []);

    return repositories;
  }
}
