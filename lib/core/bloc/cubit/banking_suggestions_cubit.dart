import 'package:bloc/bloc.dart';
import 'package:lakshmi_setu/core/bloc/cubit/banking_suggestions_state.dart';
import 'package:lakshmi_setu/data/apis/groq_service.dart';
import 'package:lakshmi_setu/data/models/user_model.dart.dart';

class BankingSuggestionsCubit extends Cubit<BankingSuggestionsState> {
  final GroqApiService groqApiService;

  BankingSuggestionsCubit(this.groqApiService) : super(BankingSuggestionsState());

  Future<void> loadRecommendations(UserModel user) async {
    emit(state.copyWith(isLoading: true));
    try {
      await groqApiService.startChat();
      final recommendations =
          await groqApiService.recommendBudgetingStrategies(user);

     

      emit(state.copyWith(
        isLoading: false,
        investmentRecommendations: recommendations,
        error: '',
      ));
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e.toString()));
    }
  }
}
