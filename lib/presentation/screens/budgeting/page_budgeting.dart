import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lakshmi_setu/core/theme/theme_extensions.dart';
import 'package:lakshmi_setu/presentation/screens/budgeting/page_expenses.dart';
import 'package:pie_chart/pie_chart.dart';

class BudgetingScreen extends StatefulWidget {
  static const route = '/budgetingScreen';
  static const routeName = 'BudgetingScreen';
  const BudgetingScreen({super.key});

  @override
  State<BudgetingScreen> createState() => _BudgetingScreenState();
}

class _BudgetingScreenState extends State<BudgetingScreen> {
  final Map<String, double> spendingData = {
    "Housing": 2000,
    "Biils/Rent": 1500,
    "Clothing": 500,
    "Education": 1000,
  };

  @override
  Widget build(BuildContext context) {
    final totalSpent = spendingData.values.reduce((a, b) => a + b);

    return Scaffold(
      appBar: AppBar(
        title: Text('Budgeting', style: context.textTheme.headlineSmall),
        elevation: 0,
        automaticallyImplyLeading: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Spent this month',
                style: context.textTheme.bodyLarge,
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: LinearProgressIndicator(
                      value: 3000 / 5000,
                      backgroundColor: Colors.grey[300],
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      minHeight: 8,
                    ),
                  ),
                  SizedBox(width: 8),
                ],
              ),
              Text('₹ 3000 of ₹ 5000', style: context.textTheme.bodySmall),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'You are on track to save ₹5000!',
                          style: context.textTheme.bodyLarge!
                              .copyWith(fontWeight: FontWeight.w600),
                        ),
                        Text(
                          "Keep it up! You’ll be able to achieve your goals with a little more effort.",
                          style: context.textTheme.bodySmall,
                          maxLines: 2,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 20),
                  const Icon(Icons.check_circle, color: Colors.green),
                ],
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Monthly Spending by Category',
                    style: context.textTheme.bodyLarge!
                        .copyWith(fontWeight: FontWeight.w600),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.add_circle,
                      color: Colors.blue,
                      size: 30,
                    ),
                    onPressed: () {
                      context.push(AddExpensePage.route);
                    },
                  ),
                ],
              ),
              SizedBox(height: 16),
              Center(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    PieChart(
                      dataMap: spendingData,
                      animationDuration: Duration(milliseconds: 800),
                      chartType: ChartType.ring,
                      ringStrokeWidth: 32,
                      centerText: "₹$totalSpent",
                      chartLegendSpacing: 32,
                      chartRadius: MediaQuery.of(context).size.width / 2.2,
                      colorList: [
                        Colors.blue,
                        Colors.green,
                        Colors.orange,
                        Colors.purple,
                      ],
                      legendOptions: LegendOptions(
                        showLegends: true,
                        legendPosition: LegendPosition.bottom,
                        showLegendsInRow: true,
                      ),
                      chartValuesOptions: ChartValuesOptions(
                        showChartValueBackground: true,
                        showChartValues: true,
                        chartValueStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24),
              Text(
                'Yearly Spending by Category',
                style: context.textTheme.bodyLarge!
                    .copyWith(fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 24),
              Center(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    PieChart(
                      dataMap: spendingData,
                      animationDuration: Duration(milliseconds: 800),
                      chartType: ChartType.ring,
                      ringStrokeWidth: 32,
                      centerText: "₹$totalSpent",
                      chartLegendSpacing: 32,
                      chartRadius: MediaQuery.of(context).size.width / 2.2,
                      colorList: [
                        Colors.blue,
                        Colors.green,
                        Colors.orange,
                        Colors.purple,
                      ],
                      legendOptions: LegendOptions(
                        showLegends: true,
                        legendPosition: LegendPosition.bottom,
                        showLegendsInRow: true,
                      ),
                      chartValuesOptions: ChartValuesOptions(
                        showChartValueBackground: true,
                        showChartValues: true,
                        chartValueStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24),
              Text(
                'Tailored Tips for you',
                style: context.textTheme.bodyLarge!
                    .copyWith(fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 8),
              Text(
                'Lorem ipsum Lorem ipsum\nLorem ipsum Lorem ipsum\nLorem ipsum Lorem ipsum',
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
