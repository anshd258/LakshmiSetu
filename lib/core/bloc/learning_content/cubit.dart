import 'package:bloc/bloc.dart';
import 'package:lakshmi_setu/core/bloc/learning_content/states.dart';
import 'package:lakshmi_setu/data/apis/groq_service.dart';
import 'package:lakshmi_setu/data/models/story_model.dart';

class LearningContentCubit extends Cubit<LearningContentState> {
  final GroqApiService groqApiService;

  LearningContentCubit(this.groqApiService) : super(LearningContentState());

  Future<void> generateContent(String topic, String language) async {
    emit(state.copyWith(isLoading: true));
    try {
      await groqApiService.startChat();
      final content = await groqApiService.generateStory(topic, language);

      emit(state.copyWith(
        isLoading: false,
        content: ReferenceData.fromJson(content),
        error: '',
      ));
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e.toString()));
    
    }
  }
}
