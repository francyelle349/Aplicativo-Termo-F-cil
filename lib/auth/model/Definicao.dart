// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:google_generative_ai/google_generative_ai.dart';

import 'package:app/core/secrets/app_secrets.dart';

class Definicao {
  String? input;
  Definicao({
    required this.input,
  });
  
  // classe para devolver uma definição
  Future<String> getDefinicao() async {
    final model = GenerativeModel(
      model: 'gemini-1.5-flash-latest',
      apiKey: AppSecrets.apiKey,
  );

  final prompt = input;
  final content = [Content.text("me dê uma definição desta palavra: $prompt, em 500 caracteres de acordo com o dicionário. Ademais: não coloque o texto em negrito" )];
  final response = await model.generateContent(content);

  return response.text.toString();
  }

  
 
}
