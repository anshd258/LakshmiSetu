import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lakshmi_setu/core/bloc/cubit/banking_suggestions_cubit.dart';
import 'package:lakshmi_setu/core/bloc/cubit/banking_suggestions_state.dart';
import 'package:lakshmi_setu/core/theme/theme_extensions.dart';
import 'package:lakshmi_setu/data/models/user_model.dart.dart';
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

  final List<Map<String, dynamic>> suggestions = [
    {
      'title': 'Track Weekly Expenses',
      'tip': 'Set aside 30 minutes every Sunday',
      'icon': Icons.calendar_today_outlined
    },
    {
      'title': 'Start Emergency Fund',
      'tip': 'Save ₹100 daily for future',
      'icon': Icons.savings_outlined
    },
    {
      'title': 'Join Local Market',
      'tip': 'Connect with nearby vendors',
      'icon': Icons.store_outlined
    },
    {
      'title': 'Digital Payment Skills',
      'tip': 'Learn secure banking methods',
      'icon': Icons.phone_android_outlined
    }
  ];
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
    context.read<BankingSuggestionsCubit>().loadRecommendations(user);
  }

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
                      valueColor: AlwaysStoppedAnimation<Color>(
                          context.colorScheme.primary),
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
                      color: context.colorScheme.primary,
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
                        Color(0xFF8DA47E),
                        Color(0xFFAAD9CD),
                        Color(0xFFF8C882),
                        Color(0xFFE9BBB5),
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
                        Color(0xFF8DA47E),
                        Color(0xFFAAD9CD),
                        Color(0xFFF8C882),
                        Color(0xFFE9BBB5),
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
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, bottom: 12),
                child: Text(
                  'Tailored Tips for you',
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(fontWeight: FontWeight.w600),
                ),
              ),
              BlocConsumer<BankingSuggestionsCubit, BankingSuggestionsState>(
                listener: (context, state) {
                  // TODO: implement listener
                },
                builder: (context, state) {
                  if (state.isLoading) {
                    return CircularProgressIndicator();
                  }
                  final suggestionList = state.investmentRecommendations;
                  return ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    itemCount: suggestionList.length,
                    itemBuilder: (context, index) {
                      final item = suggestionList[index];
                      return StaticSuggestionCard(
                        title: item['title']!, translation: item["translation"],
                        tip: item['tip']!,
                        icon: Icons.monetization_on_rounded,
                        colorIndex: index,
                        // Stagger the animation delay based on index
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class StaticSuggestionCard extends StatefulWidget {
  final String title;
  final String tip;
  final String translation;
  final IconData icon;
  final int colorIndex;

  const StaticSuggestionCard({
    Key? key,
    required this.title,
    required this.tip,
    required this.translation,
    required this.icon,
    required this.colorIndex,
  }) : super(key: key);

  @override
  State<StaticSuggestionCard> createState() => _StaticSuggestionCardState();
}

class _StaticSuggestionCardState extends State<StaticSuggestionCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeInAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );

    _fadeInAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    ));

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0.0, 0.2),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    ));

    // Delay the animation based on card position

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // Function to decode Unicode escape sequences
  String decodeUnicode(String encodedString) {
    // Decode the string using UTF-8 decoding to get readable characters
    return utf8.decode(encodedString.runes.toList());
  }

  Color _generatePastelColor(int index, {bool isDark = false}) {
    final hue = (index * 137.508) % 360;
    final saturation = 0.65;
    final lightness = isDark ? 0.70 : 0.85;

    final h = hue / 360;
    final s = saturation;
    final l = lightness;

    double _hue2rgb(double p, double q, double t) {
      if (t < 0) t += 1;
      if (t > 1) t -= 1;
      if (t < 1 / 6) return p + (q - p) * 6 * t;
      if (t < 1 / 2) return q;
      if (t < 2 / 3) return p + (q - p) * (2 / 3 - t) * 6;
      return p;
    }

    final q = l < 0.5 ? l * (1 + s) : l + s - l * s;
    final p = 2 * l - q;

    final r = _hue2rgb(p, q, h + 1 / 3);
    final g = _hue2rgb(p, q, h);
    final b = _hue2rgb(p, q, h - 1 / 3);

    return Color.fromRGBO(
      (r * 255).round(),
      (g * 255).round(),
      (b * 255).round(),
      1,
    );
  }

  @override
  Widget build(BuildContext context) {
    final lightColor = _generatePastelColor(widget.colorIndex);
    final darkColor = _generatePastelColor(widget.colorIndex, isDark: true);

    return FadeTransition(
      opacity: _fadeInAnimation,
      child: SlideTransition(
        position: _slideAnimation,
        child: Container(
          width: 200,
          margin: const EdgeInsets.all(4),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: lightColor,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: darkColor,
              width: 2,
            ),
            boxShadow: [
              BoxShadow(
                color: darkColor.withOpacity(0.5),
                offset: const Offset(0, 4),
                blurRadius: 0,
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Icon(
                    widget.icon,
                    size: 20,
                    color: Colors.black87,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      widget.title,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                widget.tip,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.black.withOpacity(0.75),
                ),
                maxLines: 7,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 8),
              Text(
                decodeUnicode(widget.translation),
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.black.withOpacity(0.75),
                ),
                maxLines: 7,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
