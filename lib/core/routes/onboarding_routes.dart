import 'package:go_router/go_router.dart';
import 'package:lakshmi_setu/presentation/screens/authentication/page.dart';

List<GoRoute> onboardingRoutes = [
  GoRoute(path: AuthenticationScreen.route, builder: (context, state) => AuthenticationScreen()),
];
