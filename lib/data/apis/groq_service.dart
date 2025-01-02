import 'package:groq/groq.dart';
import 'package:lakshmi_setu/data/models/temp_user.dart';

class GroqApiService {
  GroqApiService._privateConstructor();

  static final GroqApiService _instance = GroqApiService._privateConstructor();

  factory GroqApiService() {
    return _instance;
  }

  final Groq _groq = Groq(
    apiKey: "YOUR_API_KEY_HERE",
    model: "gemma-7b-it",
  );

  Future<void> startChat() async {
    try {
      _groq.startChat();
      print("Chat session started.");
    } catch (error) {
      print("Error starting chat: $error");
    }
  }

  // Language Translation
  Future<String> translate(String text, String targetLanguage) async {
    try {
      String prompt = "Translate the following text to $targetLanguage: $text";
      GroqResponse response = await _groq.sendMessage(prompt);
      return response.choices.first.message.content;
    } catch (error) {
      print("Error translating text: $error");
      return "Translation error";
    }
  }

  // Story-based content generation
  Future<String> generateStory(String prompt, String language) async {
    try {
      String fullPrompt =
          "Generate a story in $language for this prompt: $prompt";
      GroqResponse response = await _groq.sendMessage(fullPrompt);
      return response.choices.first.message.content;
    } catch (error) {
      print("Error generating story: $error");
      return "Story generation error";
    }
  }

  // Banking options recommendations
  Future<String> recommendBankingOptions(TempUser user) async {
    try {
      String prompt =
          "Based on this user's profile, recommend banking options: $user";
      GroqResponse response = await _groq.sendMessage(prompt);
      return response.choices.first.message.content;
    } catch (error) {
      print("Error recommending banking options: $error");
      return "Error in banking recommendations";
    }
  }

  // Personalized micro-investment options
  Future<String> recommendMicroInvestments(TempUser user) async {
    try {
      String prompt =
          "Based on this user, recommend personalized micro-investment options: $user";
      GroqResponse response = await _groq.sendMessage(prompt);
      return response.choices.first.message.content;
    } catch (error) {
      print("Error recommending micro-investments: $error");
      return "Error in micro-investment recommendations";
    }
  }

  // Budgeting strategies
  Future<String> recommendBudgetingStrategies(TempUser user) async {
    try {
      String prompt =
          "Based on this user, recommend budget management strategies: $user";
      GroqResponse response = await _groq.sendMessage(prompt);
      return response.choices.first.message.content;
    } catch (error) {
      print("Error recommending budgeting strategies: $error");
      return "Error in budgeting strategies";
    }
  }
}
