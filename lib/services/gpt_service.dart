
import 'dart:convert';
import 'package:http/http.dart' as http;

class GPTService {
  static Future<String> ask(String prompt) async {
    final res = await http.post(
      Uri.parse('https://api.openai.com/v1/chat/completions'),
      headers: {
        'Authorization': 'Bearer your-openai-api-key',
        'Content-Type': 'application/json',
      },
      body: json.encode({
        "model": "gpt-3.5-turbo",
        "messages": [
          {"role": "user", "content": prompt}
        ]
      }),
    );

    final data = json.decode(res.body);
    return data['choices'][0]['message']['content'];
  }
}
