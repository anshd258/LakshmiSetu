import 'package:lakshmi_setu/data/models/story_model.dart';

class LearningContentState {
  final bool isLoading;
  final String error;
  final ReferenceData? content;

  LearningContentState({
    this.isLoading = false,
    this.error = '',
    this.content ,
  });

  LearningContentState copyWith({
    bool? isLoading,
    String? error,
    ReferenceData? content,
  }) {
    return LearningContentState(
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      content: content ?? this.content,
    );
  }
}
