import 'package:go_router/go_router.dart';
import 'package:lakshmi_setu/presentation/screens/home/page.dart';

List<GoRoute> homeRoutes = [
  GoRoute(path: HomePage.route, builder: (context, state) => HomePage()),
];
