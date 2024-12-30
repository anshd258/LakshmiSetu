import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lakshmi_setu/app_routes.dart';
import 'package:lakshmi_setu/presentation/provider/bloc/auth_provider_bloc.dart';

ValueKey<int> providerScopeKey = ValueKey<int>(0);

class AppEntrypoint extends StatelessWidget {
  const AppEntrypoint({super.key});

  @override
  Widget build(context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthProviderBloc>(
          create: (context) => AuthProviderBloc(),
        ),
      ],
      key: providerScopeKey,
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        builder: (context, child) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            themeMode: ThemeMode.system,
            theme: ThemeData(),
            routerConfig: routes,
          );
        },
      ),
    );
  }
}
