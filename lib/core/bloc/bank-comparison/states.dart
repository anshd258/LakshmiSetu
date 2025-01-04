import 'package:lakshmi_setu/data/models/bank_comparison_model.dart';

class BankComparisonState {
  final bool isLoading;
  final String error;
  final List<BankComparisonModel> bankComparisons;

  BankComparisonState({
    this.isLoading = false,
    this.error = '',
    this.bankComparisons = const [],
  });

  BankComparisonState copyWith({
    bool? isLoading,
    String? error,
    List<BankComparisonModel>? bankComparisons,
  }) {
    return BankComparisonState(
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      bankComparisons: bankComparisons ?? this.bankComparisons,
    );
  }
}