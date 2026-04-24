import 'dart:convert';
import 'package:http/http.dart' as http;

class LlmService {
  final String baseUrl;

  LlmService({this.baseUrl = "http://localhost:11434"});

  Future<String> chat(String prompt) async {
    final url = Uri.parse("$baseUrl/api/chat");

    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "model": "qwen3-small:latest",
        "messages": [
          {"role": "user", "content": prompt}
        ],
        "stream": false
      }),
    );

    if (response.statusCode != 200) {
      return "HTTP错误: ${response.statusCode}";
    }

    final data = jsonDecode(response.body);

    // 🧨 防 null crash（关键）
    if (data == null) {
      return "返回为空";
    }

    if (data["message"] == null) {
      return "结构异常: ${response.body}";
    }

    if (data["message"]["content"] == null) {
      return "content为空: ${response.body}";
    }

    return data["message"]["content"];
  }
}