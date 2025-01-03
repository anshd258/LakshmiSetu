class UserModel {
  // Personal Info
  final String name;
  final String mobileNumber;
  final String dateOfBirth;
  final String gender;
  final String location;
  final String language;
  final String maritalStatus;
  final int children;

  // Financial Info
  final String job;
  final int monthlySalaryRange;
  final int monthlyExpensesRange;
  final int monthlySavingsRange;
  final int totalSavingsRange;

  // Goals
  final int monthlySavingGoal;
  final int totalSavingGoal;
  final String longTermGoals;
  final String shortTermGoals;

  UserModel({
    required this.name,
    required this.mobileNumber,
    required this.dateOfBirth,
    required this.gender,
    required this.location,
    required this.language,
    required this.maritalStatus,
    required this.children,
    required this.job,
    required this.monthlySalaryRange,
    required this.monthlyExpensesRange,
    required this.monthlySavingsRange,
    required this.totalSavingsRange,
    required this.monthlySavingGoal,
    required this.totalSavingGoal,
    required this.longTermGoals,
    required this.shortTermGoals,
  });

  // Convert UserModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'mobileNumber': mobileNumber,
      'dateOfBirth': dateOfBirth,
      'gender': gender,
      'location': location,
      'language': language,
      'maritalStatus': maritalStatus,
      'children': children,
      'job': job,
      'monthlySalaryRange': monthlySalaryRange,
      'monthlyExpensesRange': monthlyExpensesRange,
      'monthlySavingsRange': monthlySavingsRange,
      'totalSavingsRange': totalSavingsRange,
      'monthlySavingGoal': monthlySavingGoal,
      'totalSavingGoal': totalSavingGoal,
      'longTermGoals': longTermGoals,
      'shortTermGoals': shortTermGoals,
    };
  }

  // Create UserModel from JSON
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'] as String,
      mobileNumber: json['mobileNumber'] as String,
      dateOfBirth: json['dateOfBirth'] as String,
      gender: json['gender'] as String,
      location: json['location'] as String,
      language: json['language'] as String,
      maritalStatus: json['maritalStatus'] as String,
      children: json['children'] as int,
      job: json['job'] as String,
      monthlySalaryRange: json['monthlySalaryRange'] as int,
      monthlyExpensesRange: json['monthlyExpensesRange'] as int,
      monthlySavingsRange: json['monthlySavingsRange'] as int,
      totalSavingsRange: json['totalSavingsRange'] as int,
      monthlySavingGoal: json['monthlySavingGoal'] as int,
      totalSavingGoal: json['totalSavingGoal'] as int,
      longTermGoals: json['longTermGoals'] as String,
      shortTermGoals: json['shortTermGoals'] as String,
    );
  }
}
