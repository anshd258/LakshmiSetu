class ReferenceData {
  final String title;
  final String story;

  final String culturalRelevance;
  final RealScenario realScenario;
  final Translation translation;

  ReferenceData({
    required this.title,
    required this.story,

    required this.culturalRelevance,
    required this.realScenario,
    required this.translation,
  });

  factory ReferenceData.fromJson(Map<String, dynamic> json) {
    return ReferenceData(
      title: json['title'],
      story: json['story'],
      culturalRelevance: json['cultural_relevance'],
      realScenario: RealScenario.fromJson(json['real_scenario']),
      translation: Translation.fromJson(json['translation']),
    );
  }
}

class RealScenario {
  final String title;
  final String scenario;
  final List<String> answers;

  RealScenario({
    required this.title,
    required this.scenario,
    required this.answers,
  });

  factory RealScenario.fromJson(Map<String, dynamic> json) {
    return RealScenario(
      title: json['title'],
      scenario: json['scenario'],
      answers: List<String>.from(json['answers']),
    );
  }
}

class Translation {
  final String story;

  final String culturalRelevance;
  final RealScenario realScenario;

  Translation({
    required this.story,

    required this.culturalRelevance,
    required this.realScenario,
  });

  factory Translation.fromJson(Map<String, dynamic> json) {
    return Translation(
      story: json['story'],

      culturalRelevance: json['cultural_relevance'],
      realScenario: RealScenario.fromJson(json['real_scenario']),
    );
  }
}
