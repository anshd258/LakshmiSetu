import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
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
    model: "llama-3.3-70b-versatile",
  );

  Future<void> startChat() async {
    try {
      _groq.startChat();
      print("Chat session started.");
    } catch (error) {
      print("Error starting chat: $error");
    }
  }

  String _cleanContent(String content) {
    content = content.replaceAllMapped(
      RegExp(r'\*\*([^*]+)\*\*:'),
      (match) => '${match.group(1)}:',
    );
    content = content.replaceAll('**', '');
    return content;
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
  Future<Map<String, dynamic>> generateStory(
      String prompt, String language) async {
    try {
      // Modify the fullPrompt to correctly insert dynamic values
      String fullPrompt =
          """Create an engaging, culturally relevant short story-based learning content on the topic "$prompt" in "$language" language
           in JSON format keeping in mind that the user is from a rural place in India and translate the tip in Hindi language 
           (ISO 639-1 language code for Hindi is "hi") and set it in 'translation' key. 
           The JSON structure should have the following fields: 'title', 'story', , 
           'cultural_relevance', 'real_scenario', and 'translation'. 
            dont send your message send jsut the json no other content dont write any of your here is your 
            json or anything just give me json no your messga 
             shuld be in the message other then json with no other characters other then json 
            and keep in mind no (here isthe json content) mesasge should be there jus pure json whcih i can directly decode 
           and generate the complete json
           dont ven put the ``` charcters
           The translation should be in ISO 639-1 language code for Hindi "hi".

           The format should be as follows:

           {
              "title": "for reference will be in english ",
              "story": "for reference will be in english ",
          
              "cultural_relevance":  "for reference will be in english ",
             
              "real_scenario": {
                "title":   "for reference will be in english ",
                "scenario":  "for reference will be in english ",
                "answers": [
                  "for reference will be in english ",
                  "for reference will be in english ",
               "for reference will be in english ",
                  "for reference will be in english ",
                ]
              },
              "translation": {
                "story": "translation in Hindi",
                
                "cultural_relevance": "translation in Hindi",
               
                "real_scenario": {
                  "title": "translation in Hindi",
                  "scenario": "translation in Hindi",
                  "answers": [
                    "translation in Hindi",
                    "translation in Hindi",
                    "translation in Hindi",
                    "translation in Hindi"
                  ]
                }
              }
            }
        """;

      // Call the Groq API to generate content based on the fullPrompt
      GroqResponse response = await _groq.sendMessage(fullPrompt);

      // Decode and return the response content as JSON
      String content = response.choices.first.message.content;
      return jsonDecode(utf8.decode(content.runes.toList()));
    } catch (error) {
      print("Error generating story: $error");
      throw error;
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
    Generate a comparison of exactly 3 recommended banks in india in this format:
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

  Future<List<Map<String, dynamic>>> recommendBudgetingStrategies(
      UserModel user) async {
    try {
      String prompt =
          """Provide budgeting strategies for user $user in JSON format keeping in mind that the user is from rural place
           in india and translate the tip in hindi langage also ISO 639-1 language code for Hindi is "hi" and set it in 
           'translation' key 
           . Each strategy should have the following fields: 'title', 'tip' and 'translation'(transaltion of the tip you
            generated in ISO 639-1 language code for Hindi  "hi") . dont send your message send jsut the json no other content
             shuld be in the message other then json with no other characters other then json 
          . The format should be as follows:

[
  {
    'title': 'Example Title',
    'tip': 'Example Tip',
    'translation': 'Please provide a correct Hindi translation for the tip.',

  },
  {
    'title': 'Another Title',
    'tip': 'Another Tip',
    'translation': 'Please provide a correct Hindi translation for the tip.',
  
  }
]
""";

      GroqResponse response = await _groq.sendMessage(prompt);

      String content = response.choices.first.message.content;

      List<dynamic> strategies = jsonDecode(content);

      return strategies
          .map((strategy) => {
                'title': strategy['title'] ?? 'No Title',
                'tip': strategy['tip'] ?? 'No Tip',
                'translation': strategy['translation'] ?? "No Translation",
              })
          .toList();
    } catch (error) {
      print("Error recommending budgeting strategies: $error");

      return [
        {
          'title': 'Error',
          'tip': 'Error in budgeting strategies',
          'icon': Icons.error_outline
        }
      ];
    }
  }
}
