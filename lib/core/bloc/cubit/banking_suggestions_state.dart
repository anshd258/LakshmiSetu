class BankingSuggestionsState {
  final bool isLoading;
  final String error;
  final List<Map<String,dynamic>> investmentRecommendations;

  BankingSuggestionsState({
    this.isLoading = false,
    this.error = '',
    this.investmentRecommendations = const [],
  });

  BankingSuggestionsState copyWith({
    bool? isLoading,
    String? error,
    List<Map<String,dynamic>>? investmentRecommendations,
  }) {
    return BankingSuggestionsState(
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      investmentRecommendations:
          investmentRecommendations ?? this.investmentRecommendations,
    );
  }
}