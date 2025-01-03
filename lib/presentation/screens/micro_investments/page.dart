import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lakshmi_setu/core/bloc/micro-investments.dart/cubit.dart';
import 'package:lakshmi_setu/core/bloc/micro-investments.dart/states.dart';
import 'package:lakshmi_setu/core/theme/theme_extensions.dart';
import 'package:lakshmi_setu/data/apis/groq_service.dart';
import 'package:lakshmi_setu/data/models/user_model.dart.dart';
import 'package:lakshmi_setu/presentation/screens/micro_investments/page_calculator.dart';

class MicroInvestmentsScreen extends StatefulWidget {
  static const route = '/microInvestmentsScreen';
  static const routeName = 'MicroInvestmentsScreen';
  const MicroInvestmentsScreen({super.key});

  @override
  State<MicroInvestmentsScreen> createState() => _MicroInvestmentsScreenState();
}

class _MicroInvestmentsScreenState extends State<MicroInvestmentsScreen> {
  UserModel user = UserModel(
    name: "Lorem Ipsum",
    mobileNumber: "9XXXXXXXXXX",
    dateOfBirth: "29th Feb 2003",
    gender: "Female",
    location: "New Delhi",
    language: "English",
    maritalStatus: "Unmarried",
    children: 0,
    job: "Farmer",
    monthlySalaryRange: 20000,
    monthlyExpensesRange: 10000,
    monthlySavingsRange: 10000,
    totalSavingsRange: 300000,
    monthlySavingGoal: 5000,
    totalSavingGoal: 400000,
    longTermGoals: "Buy land",
    shortTermGoals: "Education fee",
  );

  @override
  void initState() {
    super.initState();
    context.read<MicroInvestmentsCubit>().loadRecommendations(user);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text(
          'Micro Investments',
          style: context.textTheme.headlineSmall,
        ),
      ),
      body: BlocProvider(
        create: (context) =>
            MicroInvestmentsCubit(context.read<GroqApiService>())
              ..loadRecommendations(user),
        child: BlocBuilder<MicroInvestmentsCubit, MicroInvestmentsState>(
            builder: (context, state) {
          if (state.isLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state.error.isNotEmpty) {
            return Center(child: Text('Error: ${state.error}'));
          } else if (state.investmentRecommendations.isNotEmpty) {
            return Column(
              children: [
                Expanded(
                  child: ListView(
                    children: state.investmentRecommendations
                        .map((rec) => InvestmentOption(
                              title: rec,
                              subtitle: 'Details about this investment',
                            ))
                        .toList(),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    context.push(CalculatorScreen.route);
                  },
                  child: Text(
                    'Calculator',
                    style: context.textTheme.labelSmall,
                  ),
                ),
                const SizedBox(height: 20),
              ],
            );
          } else {
            return Center(child: Text('No recommendations available.'));
          }
        }),
      ),
    );
  }
}

class InvestmentOption extends StatelessWidget {
  final String title;
  final String subtitle;

  const InvestmentOption({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      title: Text(
        title,
        style:
            context.textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w600),
      ),
      subtitle: Text(
        subtitle,
        style: context.textTheme.bodySmall,
      ),
      trailing: const Icon(
        Icons.chevron_right,
      ),
      onTap: () {},
    );
  }
}
