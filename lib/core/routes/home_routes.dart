import 'package:go_router/go_router.dart';
import 'package:lakshmi_setu/presentation/screens/banking/page.dart';
import 'package:lakshmi_setu/presentation/screens/budgeting/page_budgeting.dart';
import 'package:lakshmi_setu/presentation/screens/budgeting/page_expenses.dart';
import 'package:lakshmi_setu/presentation/screens/home/page.dart';
import 'package:lakshmi_setu/presentation/screens/micro_investments/page.dart';
import 'package:lakshmi_setu/presentation/screens/micro_investments/page_calculator.dart';

List<GoRoute> homeRoutes = [
  GoRoute(path: HomePage.route, builder: (context, state) => HomePage()),
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
];
