import 'dart:convert';
import 'package:http/http.dart' as http;

class ChatGptApi {
  String token = 'YOUR_TOKEN_HERE';
  String apiUrl = 'https://api.openai.com/v1/completions';

  // Funcao que faz a requisicao para a API do chatGPT e retorna a resposta

  Future<String> getGptResponse(String message) async {
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(
        {
          "model": "text-davinci-003",
          'messages': [
            {"role": "user", "content": message}
          ],
          "max_tokens": 50,
        },
      ),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      if (data.containsKey('choices') && data['choices'].isNotEmpty) {
        final responseTxt = data['choices'][0]['text'];
        return responseTxt;
      } else {
        return "Resposta vazia";
      }
    } else {
      throw Exception('Erro na requisição à API');
    }
  }

}
