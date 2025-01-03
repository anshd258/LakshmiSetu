class MicroInvestmentsState {
  final bool isLoading;
  final String error;
  final List<String> investmentRecommendations;

  MicroInvestmentsState({
    this.isLoading = false,
    this.error = '',
    this.investmentRecommendations = const [],
  });

  MicroInvestmentsState copyWith({
    bool? isLoading,
    String? error,
    List<String>? investmentRecommendations,
  }) {
    return MicroInvestmentsState(
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      investmentRecommendations:
          investmentRecommendations ?? this.investmentRecommendations,
    );
  }
}