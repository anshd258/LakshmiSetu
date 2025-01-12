import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lakshmi_setu/app_routes.dart';
import 'package:lakshmi_setu/core/bloc/auth/cubit.dart';
import 'package:lakshmi_setu/core/bloc/bank-comparison/cubit.dart';
import 'package:lakshmi_setu/core/bloc/cubit/banking_suggestions_cubit.dart';
import 'package:lakshmi_setu/core/bloc/learning_content/cubit.dart';
import 'package:lakshmi_setu/core/bloc/micro-investments.dart/cubit.dart';
import 'package:lakshmi_setu/core/theme/apptheme.dart';
import 'package:lakshmi_setu/data/apis/auth_repository.dart';
import 'package:lakshmi_setu/data/apis/groq_service.dart';
import 'package:provider/provider.dart';

ValueKey<int> providerScopeKey = ValueKey<int>(0);

class AppEntrypoint extends StatelessWidget {
  const AppEntrypoint({super.key});

  @override
  Widget build(context) {
    return MultiBlocProvider(
      providers: [
        Provider<GroqApiService>(create: (_) => GroqApiService()),
        BlocProvider<AuthCubit>(
          create: (context) => AuthCubit(AuthRepository()),
        ),
        BlocProvider<LearningContentCubit>(
          create: (context) => LearningContentCubit(GroqApiService()),
        ),
        BlocProvider<MicroInvestmentsCubit>(
          create: (context) => MicroInvestmentsCubit(GroqApiService()),
        ),
        BlocProvider<BankingSuggestionsCubit>(
          create: (context) => BankingSuggestionsCubit(GroqApiService()),
        ),
        BlocProvider<BankComparisonCubit>(
          create: (context) => BankComparisonCubit(GroqApiService()),
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
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            routerConfig: routes,
          );
        },
      ),
    );
  }
}
