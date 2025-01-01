import 'package:flutter/material.dart';
import 'package:lakshmi_setu/core/theme/theme_extensions.dart';
import 'package:lakshmi_setu/presentation/screens/banking/widgets/bar_chart.dart';

class BankingOptionsScreen extends StatefulWidget {
  static const route = '/bankingOptionsScreen';
  static const routeName = 'BankingOptionsScreen';
  const BankingOptionsScreen({super.key});

  @override
  State<BankingOptionsScreen> createState() => _BankingOptionsScreenState();
}

class _BankingOptionsScreenState extends State<BankingOptionsScreen> {
  List<bool> isSelected = [
    true,
    false
  ]; // Toggle state for "Savings" and "Loan"

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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ToggleButtons(
                isSelected: isSelected,
                onPressed: (index) {
                  setState(() {
                    for (int i = 0; i < isSelected.length; i++) {
                      isSelected[i] = i == index;
                    }
                  });
                },
                borderRadius: BorderRadius.circular(8),
                selectedColor: Colors.white,
                fillColor: context.colorScheme.primary,
                color: context.colorScheme.onSurface,
                textStyle: context.textTheme.labelSmall,
                constraints: const BoxConstraints(
                  minHeight: 36,
                  minWidth: 80,
                ),
                children: const [
                  Text('Savings'),
                  Text('Loan'),
                ],
              ),
              const SizedBox(height: 20),
              Text(
                'Suggested Banks',
                style: context.textTheme.bodyLarge!
                    .copyWith(fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(3, (index) {
                  return Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.account_balance, size: 40),
                          const SizedBox(height: 8),
                          Text(
                            'Bank Name',
                            style: context.textTheme.bodySmall,
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              ),
              const SizedBox(height: 25),
              Text(
                'Interest Rates',
                style: context.textTheme.bodyLarge!
                    .copyWith(fontWeight: FontWeight.w600),
              ),
              BarChartWidget(),
              const SizedBox(height: 30),
              Text(
                'Minimum Balance Requirement',
                style: context.textTheme.bodyLarge!
                    .copyWith(fontWeight: FontWeight.w600),
              ),
              BarChartWidget(),
              const SizedBox(height: 30),
              Text(
                'Account Maintenance Charges',
                style: context.textTheme.bodyLarge!
                    .copyWith(fontWeight: FontWeight.w600),
              ),
              BarChartWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
