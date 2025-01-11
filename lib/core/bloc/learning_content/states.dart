class LearningContentState {
  final bool isLoading;
  final String error;
  final String content;

  LearningContentState({
    this.isLoading = false,
    this.error = '',
    this.content = '',
  });

  LearningContentState copyWith({
    bool? isLoading,
    String? error,
    String? content,
  }) {
    return LearningContentState(
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      content: content ?? this.content,
    );
  }
}
