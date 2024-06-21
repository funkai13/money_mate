import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:money_mate/feature/auth/domain/provider/auth_provider.dart';
import 'package:money_mate/feature/auth/presenter/screen/auth_screen.dart';
import 'package:money_mate/feature/auth/presenter/screen/sign_in_screen.dart';
import 'package:money_mate/feature/auth/presenter/screen/sign_up_screen.dart';
import 'package:money_mate/feature/balance/presenter/screens/account_balance_screen.dart';
import 'package:money_mate/feature/home/presenter/screen/home_screen.dart';
import 'package:money_mate/feature/planning/presenter/screen/planning_screen.dart';
import 'package:money_mate/feature/splash_screen/presenter/splash_screen.dart';
import 'package:money_mate/feature/statistics/presenter/screen/statistics_screen.dart';
import 'package:money_mate/feature/users/presenter/screen/user_profile_register_screen.dart';
import 'package:money_mate/routes.dart';

import '../../feature/Transactions/presenter/screen/widgets/prueba_income_screen.dart';
import '../../feature/Transactions/presenter/screen/widgets/select_account.dart';
import '../../feature/Transactions/presenter/screen/widgets/select_category.dart';

final routerProvider = Provider((ref) {
  return _routeConfig(redirect: (context, state) {
    final authState = ref.read(authStateChangesProvider);
    if (authState.isLoading || authState.hasError) return null;

    // final isAuthenticated = authState.valueOrNull != null;
    // final isAuthenticating = state.matchedLocation == Routes.auth;

    // if (!isAuthenticated) {
    //   return Routes.auth;
    // }

    // if (isAuthenticating) {
    //   return Routes.home;
    // }

    return null;
  });
});

GoRouter _routeConfig({GoRouterRedirect? redirect}) => GoRouter(
      redirect: redirect,
      routes: [
        // routes..
        GoRoute(
          path: Routes.home,
          builder: (context, state) => HomeScreen(),
        ),
        GoRoute(
          path: Routes.splashScreen,
          builder: (context, state) => SplashScreen(),
        ),
        GoRoute(
          path: Routes.login,
          builder: (context, state) => SignInScreen(),
        ),
        GoRoute(
          path: Routes.auth,
          builder: (context, state) => AuthScreen(),
        ),
        GoRoute(
          path: Routes.signUp,
          builder: (context, state) => SignUpScreen(),
        ),
        GoRoute(
          path: Routes.statistics,
          builder: (context, state) => StatisticsScreen(),
        ),
        GoRoute(
          path: Routes.planning,
          builder: (context, state) => PlanningScreen(),
        ),
        GoRoute(
          path: Routes.incomes,
          builder: (context, state) => const IncomeScreen(),
        ),
        GoRoute(
            path: Routes.profileRegister,
            builder: (context, state) => const ProfileRegisterScreen()),
        GoRoute(
          path: Routes.balanceDetail,
          builder: (context, state) => AccountBalanceScreen(
            title: (state.extra as Map<String, dynamic>)['title'] as String,
            balance: (state.extra as Map<String, dynamic>)['balance'] as double,
          ),
        ),

        GoRoute(
          path: Routes.selectAccount,
          builder: (context, state) => const SelectAccount(),
        ),
        GoRoute(
          path: Routes.selectCategory,
          builder: (context, state) => const SelectCategory(),
        ),
      ],
    );
