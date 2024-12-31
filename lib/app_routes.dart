import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lakshmi_setu/core/routes/home_routes.dart';
import 'package:lakshmi_setu/core/routes/onboarding_routes.dart';
import 'package:lakshmi_setu/presentation/screens/authentication/page.dart';
import 'package:lakshmi_setu/presentation/screens/home/page.dart';

final rootNavigatoinKey = GlobalKey<NavigatorState>(debugLabel: "root");
void resetShellRouter(BuildContext context) {
  // Set a new unique key
  rootNavigatoinKey.currentState?.popUntil((route) => route.isFirst);
  //context.go(HomePage.route);
}

// void openAppLink(Uri uri) {
//   final context = rootNavigatoinKey.currentState!.context;
//   if (SharedPreferencesUtil.getString(LocalstorageKeys.accessToken.token) !=
//       null) {
//     GoRouter.of(context).go(
//         Uri(path: uri.path, queryParameters: uri.queryParameters).toString());
//   } else {
//     GoRouter.of(context).go(LoginScreen.route);
//   }
// }

GoRouter routes = GoRouter(
  navigatorKey: rootNavigatoinKey,
  initialLocation: AuthenticationScreen.route,
  routes: [
    ...onboardingRoutes,
    ...homeRoutes,
  ],
);
