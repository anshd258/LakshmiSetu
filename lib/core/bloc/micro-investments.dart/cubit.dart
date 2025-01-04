import 'package:bloc/bloc.dart';
import 'package:lakshmi_setu/core/bloc/micro-investments.dart/states.dart';
import 'package:lakshmi_setu/data/apis/groq_service.dart';
import 'package:lakshmi_setu/data/models/user_model.dart.dart';

class MicroInvestmentsCubit extends Cubit<MicroInvestmentsState> {
  final GroqApiService groqApiService;

  MicroInvestmentsCubit(this.groqApiService) : super(MicroInvestmentsState());

  Future<void> loadRecommendations(UserModel user) async {
    emit(state.copyWith(isLoading: true));
    try {
      await groqApiService.startChat();
      final recommendations =
          await groqApiService.recommendMicroInvestments(user);

      final cleanedRecommendations = recommendations
          .split('\n')
          .where((line) => line.trim().isNotEmpty)
          .map((line) => line.replaceAll('*', '').replaceAll('#', '').trim())
          .toList();

      emit(state.copyWith(
        isLoading: false,
        investmentRecommendations: cleanedRecommendations,
        error: '',
      ));
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e.toString()));
    }
  }
}
