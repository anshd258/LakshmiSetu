import 'package:go_router/go_router.dart';
import 'package:lakshmi_setu/presentation/screens/budgeting/page_budgeting.dart';
import 'package:lakshmi_setu/presentation/screens/budgeting/page_expenses.dart';
import 'package:lakshmi_setu/presentation/screens/home/page.dart';

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
];
