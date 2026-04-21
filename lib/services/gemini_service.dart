import 'package:google_generative_ai/google_generative_ai.dart';
import '../core/constants/app_constants.dart';

class GeminiService {
  late final GenerativeModel _model;

  GeminiService() {
    _model = GenerativeModel(
      model: 'gemini-1.5-flash',
      apiKey: AppConstants.geminiApiKey,
    );
  }

  Future<String?> generateResponse(String prompt) async {
    final content = [Content.text(prompt)];
    final response = await _model.generateContent(content);
    return response.text;
  }

  Future<String?> summarizeChat(List<String> messages) async {
    final prompt = "Summarize the following chat messages:\n${messages.join('\n')}";
    return generateResponse(prompt);
  }
}
