import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lakshmi_setu/core/bloc/bank-comparison/cubit.dart';
import 'package:lakshmi_setu/core/bloc/bank-comparison/states.dart';
import 'package:lakshmi_setu/core/theme/theme_extensions.dart';
import 'package:lakshmi_setu/presentation/screens/banking/widgets/comparison_chart.dart';
import 'package:lakshmi_setu/user.dart';

class BankingOptionsScreen extends StatefulWidget {
  static const route = '/bankingOptionsScreen';
  static const routeName = 'BankingOptionsScreen';
  const BankingOptionsScreen({super.key});

  @override
  State<BankingOptionsScreen> createState() => _BankingOptionsScreenState();
}

class _BankingOptionsScreenState extends State<BankingOptionsScreen> {
  List<bool> isSelected = [true, false];

  @override
  void initState() {
    super.initState();
    context.read<BankComparisonCubit>().loadBankComparisons(user);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Banking Options', style: context.textTheme.headlineSmall),
        elevation: 0,
        automaticallyImplyLeading: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: BlocBuilder<BankComparisonCubit, BankComparisonState>(
            builder: (context, state) {
              if (state.isLoading) {
                return Center(child: CircularProgressIndicator());
              }

              if (state.error.isNotEmpty) {
                return Center(child: Text(state.error));
              }

              if (state.bankComparisons.isEmpty) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'No bank recommendations available',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {
                          context
                              .read<BankComparisonCubit>()
                              .loadBankComparisons(user);
                        },
                        child: const Text('Try Again'),
                      ),
                    ],
                  ),
                );
              }

              return SingleChildScrollView(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Overall Comparison",
                      style: context.textTheme.bodyLarge!
                          .copyWith(fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: 10),
                    BankComparisonChart(banks: state.bankComparisons),
                    SizedBox(height: 40),
                    ...state.bankComparisons.asMap().entries.map((entry) {
                      final index = entry.key;
                      final bank = entry.value;
                      final colors = [
                        Color.fromARGB(180, 170, 217, 205),
                        Color.fromARGB(192, 248, 201, 130),
                        Color.fromARGB(187, 233, 187, 181),
                      ];
                      final color = colors[index % colors.length];
                      return SizedBox(
                        width: double.infinity,
                        child: Container(
                          decoration: BoxDecoration(
                            color: color,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          margin: EdgeInsets.only(bottom: 16),
                          child: Padding(
                            padding: EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  bank.bankName,
                                  style: context.textTheme.bodyLarge!
                                      .copyWith(fontWeight: FontWeight.w600),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  'Interest Rate: ${(bank.interestRate).toStringAsFixed(2)}%',
                                  style: context.textTheme.bodyMedium,
                                ),
                                Text(
                                  'Minimum Balance: ₹${bank.minimumBalance}',
                                  style: context.textTheme.bodyMedium,
                                ),
                                Text(
                                  'Monthly Fee: ₹${bank.monthlyFee}',
                                  style: context.textTheme.bodyMedium,
                                ),
                                SizedBox(height: 8),
                                Text(
                                  'Key Features:',
                                  style: context.textTheme.bodyLarge!
                                      .copyWith(fontWeight: FontWeight.w600),
                                ),
                                ...bank.features.map((f) => Text(
                                      '• $f',
                                      style: context.textTheme.bodyMedium,
                                    )),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}