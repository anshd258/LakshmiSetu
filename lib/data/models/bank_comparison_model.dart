class BankComparisonModel {
  final String bankName;
  final double interestRate;
  final double minimumBalance;
  final double monthlyFee;
  final List<String> features;
  final double overallScore;

  BankComparisonModel({
    required this.bankName,
    required this.interestRate,
    required this.minimumBalance,
    required this.monthlyFee,
    required this.features,
    required this.overallScore,
  });

  factory BankComparisonModel.fromJson(Map<String, dynamic> json) {
    return BankComparisonModel(
      bankName: json['bankName'] as String,
      interestRate: json['interestRate'] as double,
      minimumBalance: json['minimumBalance'] as double,
      monthlyFee: json['monthlyFee'] as double,
      features: List<String>.from(json['features'] as List),
      overallScore: json['overallScore'] as double,
    );
  }
}