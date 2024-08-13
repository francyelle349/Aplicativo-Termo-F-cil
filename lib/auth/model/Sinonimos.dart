import 'package:app/core/secrets/app_secrets.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class Sinonimos {
  final String input;

  Sinonimos({required this.input});

  // Método para obter uma lista de sinônimos
  Future<List<String>> listaSinonimos() async {
    final model = GenerativeModel(
      model: 'gemini-1.5-flash-latest',
      apiKey: AppSecrets.apiKey,
    );

    final prompt = input;
    final content = [Content.text(
      "Me dê uma lista de 5 sinônimos de uma palavra para \"$prompt\", organizados por números, um embaixo do outro, sem descrição, apenas a lista. Exemplo: 1. Sinônimo1\n2. Sinônimo2\n3. Sinônimo3\n4. Sinônimo4\n5. Sinônimo5"
    )];
    final response = await model.generateContent(content);

    //verifica se a resposta contém texto ou não.
      if (response.text != null) {
      final synonymsList = response.text!
        .split(RegExp(r'\d+\.\s+')) // Split by number followed by a dot and space
        .map((s) => s.trim()) // Remove extra whitespace
        .where((s) => s.isNotEmpty) // Filter out empty strings
        .toList();
      
      return synonymsList;
    } else {
      return [];
    }



  }
}
