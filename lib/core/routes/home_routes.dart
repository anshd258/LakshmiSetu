import 'package:go_router/go_router.dart';
import 'package:lakshmi_setu/presentation/screens/community/community_page.dart';
import 'package:lakshmi_setu/presentation/screens/learn/content_page.dart';
import 'package:lakshmi_setu/presentation/screens/learn/page.dart';
import 'package:lakshmi_setu/presentation/screens/banking/page.dart';
import 'package:lakshmi_setu/presentation/screens/budgeting/page_budgeting.dart';
import 'package:lakshmi_setu/presentation/screens/budgeting/page_expenses.dart';
import 'package:lakshmi_setu/presentation/screens/profile/page.dart';
import 'package:lakshmi_setu/presentation/screens/home/page.dart';
import 'package:lakshmi_setu/presentation/screens/micro_investments/page.dart';
import 'package:lakshmi_setu/presentation/screens/micro_investments/page_calculator.dart';

List<GoRoute> homeRoutes = [
  GoRoute(
    path: HomePage.route,
    builder: (context, state) => HomePage(),
  ),
  GoRoute(
    path: LearnScreen.route,
    builder: (context, state) => LearnScreen(),
  ),
  GoRoute(
    path: LearningContentScreen.route,
    builder: (context, state) {
      final topic = state.uri.queryParameters['topic'];
      return LearningContentScreen(topic: topic);
    },
  ),
  GoRoute(
    path: ProfileScreen.route,
    builder: (context, state) => ProfileScreen(),
  ),
  GoRoute(
    path: BudgetingScreen.route,
    builder: (context, state) => BudgetingScreen(),
  ),
  GoRoute(
    path: AddExpensePage.route,
    builder: (context, state) => AddExpensePage(),
  ),
  GoRoute(
    path: BankingOptionsScreen.route,
    builder: (context, state) => BankingOptionsScreen(),
  ),
  GoRoute(
    path: CalculatorScreen.route,
    builder: (context, state) => CalculatorScreen(),
  ),
  GoRoute(
    path: MicroInvestmentsScreen.route,
    builder: (context, state) => MicroInvestmentsScreen(),
  ),
  GoRoute(
    path: AnimatedDiscordPage.route,
    builder: (context, state) => AnimatedDiscordPage(),
  ),
];
