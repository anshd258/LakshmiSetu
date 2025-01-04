import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lakshmi_setu/core/bloc/bank-comparison/states.dart';
import 'package:lakshmi_setu/data/apis/groq_service.dart';
import 'package:lakshmi_setu/data/models/bank_comparison_model.dart';
import 'package:lakshmi_setu/data/models/user_model.dart.dart';

class BankComparisonCubit extends Cubit<BankComparisonState> {
  final GroqApiService groqApiService;

  BankComparisonCubit(this.groqApiService) : super(BankComparisonState());

  Future<void> loadBankComparisons(UserModel user) async {
    emit(state.copyWith(isLoading: true));
    try {
      await groqApiService.startChat();
      final response = await groqApiService.recommendBankingOptions(user);

      List<BankComparisonModel> comparisons = [];
      try {
        final List<dynamic> bankData = jsonDecode(response);
        comparisons = bankData
            .map((data) => BankComparisonModel(
                  bankName: data['bankName'].toString(),
                  interestRate: (data['interestRate'] is num)
                      ? data['interestRate'].toDouble()
                      : double.tryParse(data['interestRate'].toString()) ?? 4.0,
                  minimumBalance: (data['minimumBalance'] is num)
                      ? data['minimumBalance'].toDouble()
                      : double.tryParse(data['minimumBalance'].toString()) ??
                          1000.0,
                  monthlyFee: (data['monthlyFee'] is num)
                      ? data['monthlyFee'].toDouble()
                      : double.tryParse(data['monthlyFee'].toString()) ?? 100.0,
                  features: List<String>.from(data['features'] ?? []),
                  overallScore: (data['overallScore'] is num)
                      ? data['overallScore'].toDouble()
                      : double.tryParse(data['overallScore'].toString()) ?? 5.0,
                ))
            .toList();
      } catch (e) {
        print("Error parsing bank data: $e");
      }
      emit(state.copyWith(
        isLoading: false,
        bankComparisons: comparisons,
        error: '',
      ));
    } catch (e) {
      print("Error loading bank comparisons: $e");
      emit(state.copyWith(
        isLoading: false,
        error: 'Unable to load bank recommendations. Please try again.',
      ));
    }
  }
}
