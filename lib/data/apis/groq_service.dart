import 'dart:convert';

import 'package:groq/groq.dart';
import 'package:lakshmi_setu/data/models/user_model.dart.dart';

class GroqApiService {
  GroqApiService._privateConstructor();

  static final GroqApiService _instance = GroqApiService._privateConstructor();

  factory GroqApiService() {
    return _instance;
  }

  final Groq _groq = Groq(
    apiKey: "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",
    model: "llama3-8b-8192",
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
  Future<String> recommendBankingOptions(UserModel user) async {
    try {
      String prompt = """
    IMPORTANT: You must respond with ONLY a JSON array and NO other text.
    DO NOT include any introduction, explanation, or other text.
    START YOUR RESPONSE WITH [ AND END WITH ].

    Based on this user profile: $user
    Generate a comparison of exactly 3 recommended banks in this format:
    [
      {
        "bankName": "Bank 1",
        "interestRate": 4.5,
        "minimumBalance": 1000,
        "monthlyFee": 100,
        "features": ["Feature 1", "Feature 2", "Feature 3"],
        "overallScore": 8.5
      }
    ]

    RULES:
    1. Start response with [ and end with ]
    2. No text before or after the JSON
    3. Interest rates: 3-7%
    4. Scores: 1-10
    5. All numbers must be numeric values, not strings
    """;

      GroqResponse response = await _groq.sendMessage(prompt);
      String content = response.choices.first.message.content.trim();

      if (!content.startsWith('[')) {
        print("API returned invalid format, using default data");
        return defaultBankData;
      }

      try {
        jsonDecode(content);
        return content;
      } catch (e) {
        print("Invalid JSON in response, using default data");
        return defaultBankData;
      }
    } catch (error) {
      print("Error in banking recommendations: $error");
      return defaultBankData;
    }
  }

  static const String defaultBankData = '''
[
  {
    "bankName": "SBI Bank",
    "interestRate": 4.5,
    "minimumBalance": 1000.0,
    "monthlyFee": 100.0,
    "features": ["Zero Balance Account", "Mobile Banking", "Free ATM Card"],
    "overallScore": 8.5
  },
  {
    "bankName": "HDFC Bank",
    "interestRate": 4.0,
    "minimumBalance": 2000.0,
    "monthlyFee": 150.0,
    "features": ["High Interest Savings", "Net Banking", "Reward Points"],
    "overallScore": 7.5
  },
  {
    "bankName": "ICICI Bank",
    "interestRate": 3.8,
    "minimumBalance": 500.0,
    "monthlyFee": 50.0,
    "features": ["Low Minimum Balance", "UPI Payments", "24/7 Support"],
    "overallScore": 6.5
  }
]''';

  // Personalized micro-investment options
  Future<String> recommendMicroInvestments(UserModel user) async {
    try {
      String prompt = """
    Based on this user profile: $user, provide 4-5 key investment recommendations. 
    Format each recommendation as a simple numbered point without any markdown.
    Each point should be a recommendation title and should be brief only 1-2 lines.
    Also just give the recommendation points and no text other than that
    Example format:
    1. Invest in lorem ipsum government scheme
    2. Your recommendation here
    etc
    """;
      GroqResponse response = await _groq.sendMessage(prompt);
      return response.choices.first.message.content;
    } catch (error) {
      print("Error recommending micro-investments: $error");
      return "Error in micro-investment recommendations";
    }
  }

  // Budgeting strategies
  Future<String> recommendBudgetingStrategies(UserModel user) async {
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
