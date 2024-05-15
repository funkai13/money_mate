import 'package:money_mate/feature/auth/presenter/screen/auth_screen.dart';
import 'package:money_mate/feature/auth/presenter/screen/sign_in_screen.dart';
import 'package:money_mate/feature/auth/presenter/screen/sign_up_screen.dart';
import 'package:money_mate/feature/home/presenter/screen/home_screen.dart';
import 'package:money_mate/feature/splash_screen/presenter/splash_screen.dart';
import 'package:money_mate/routes.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:money_mate/feature/auth/domain/provider/auth_provider.dart';

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
      ],
    );
