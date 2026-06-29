import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../modules/auth/screens/login_screen.dart';
import '../../modules/feature_1/screens/feature_1_screen.dart';
import '../../modules/feature_2/screens/feature_2_screen.dart';
import '../../modules/feature_3/screens/feature_3_screen.dart';
import '../../modules/home/screens/home_screen.dart';
import '../../modules/legal/screens/about_screen.dart';
import '../../modules/legal/screens/privacy_policy_screen.dart';
import '../../modules/legal/screens/support_screen.dart';
import '../../modules/legal/screens/terms_screen.dart';
import '../../modules/onboarding/screens/onboarding_screen.dart';
import '../../modules/paywall/screens/paywall_screen.dart';
import '../../modules/settings/screens/settings_screen.dart';
import '../../providers/app_providers.dart';
import '../../shared/widgets/app_scaffold_shell.dart';
import '../../state/auth/auth_state.dart';
import '../../state/onboarding/onboarding_state.dart';
import '../../state/paywall/paywall_state.dart';
import 'app_routes.dart';

final routerRefreshListenableProvider = Provider<RouterRefreshListenable>((ref) {
  final notifier = RouterRefreshListenable(ref);
  ref.onDispose(notifier.dispose);
  return notifier;
});

class RouterRefreshListenable extends ChangeNotifier {
  RouterRefreshListenable(this.ref) {
    ref.listen<AuthState>(authControllerProvider, (_, _) => notifyListeners());
    ref.listen<OnboardingState>(
      onboardingControllerProvider,
      (_, _) => notifyListeners(),
    );
    ref.listen<PaywallState>(
      paywallControllerProvider,
      (_, _) => notifyListeners(),
    );
  }

  final Ref ref;
}

class AppRouter {
  static final Set<String> _legalRoutes = <String>{
    AppRoutes.privacy,
    AppRoutes.terms,
    AppRoutes.support,
    AppRoutes.about,
  };

  static final Set<String> _signedOutRoutes = <String>{
    AppRoutes.login,
    ..._legalRoutes,
  };

  static final Set<String> _premiumRoutes = <String>{
    AppRoutes.feature2,
    AppRoutes.feature3,
  };

  static GoRouter create(Ref ref) {
    return GoRouter(
      initialLocation: AppRoutes.home,
      refreshListenable: ref.watch(routerRefreshListenableProvider),
      redirect: (context, state) {
        final authState = ref.read(authControllerProvider);
        final onboardingState = ref.read(onboardingControllerProvider);
        final location = state.matchedLocation;

        if (!onboardingState.isCompleted &&
            location != AppRoutes.onboarding &&
            !_legalRoutes.contains(location)) {
          return AppRoutes.onboarding;
        }

        if (onboardingState.isCompleted && location == AppRoutes.onboarding) {
          return authState.isLoggedIn ? AppRoutes.home : AppRoutes.login;
        }

        if (!authState.isLoggedIn && !_signedOutRoutes.contains(location)) {
          return AppRoutes.login;
        }

        if (authState.isLoggedIn && location == AppRoutes.login) {
          return AppRoutes.home;
        }

        if (_premiumRoutes.contains(location) && !authState.isPremium) {
          return AppRoutes.paywall;
        }

        if (location == AppRoutes.paywall && authState.isPremium) {
          return AppRoutes.home;
        }

        return null;
      },
      routes: [
        GoRoute(
          path: AppRoutes.onboarding,
          builder: (context, state) => const OnboardingScreen(),
        ),
        GoRoute(
          path: AppRoutes.login,
          builder: (context, state) => const LoginScreen(),
        ),
        ShellRoute(
          builder: (context, state, child) => AppScaffoldShell(child: child),
          routes: [
            GoRoute(
              path: AppRoutes.home,
              builder: (context, state) => const HomeScreen(),
            ),
            GoRoute(
              path: AppRoutes.feature1,
              builder: (context, state) => const Feature1Screen(),
            ),
            GoRoute(
              path: AppRoutes.feature2,
              builder: (context, state) => const Feature2Screen(),
            ),
            GoRoute(
              path: AppRoutes.settings,
              builder: (context, state) => const SettingsScreen(),
            ),
          ],
        ),
        GoRoute(
          path: AppRoutes.feature3,
          builder: (context, state) => const Feature3Screen(),
        ),
        GoRoute(
          path: AppRoutes.paywall,
          builder: (context, state) => const PaywallScreen(),
        ),
        GoRoute(
          path: AppRoutes.privacy,
          builder: (context, state) => const PrivacyPolicyScreen(),
        ),
        GoRoute(
          path: AppRoutes.terms,
          builder: (context, state) => const TermsScreen(),
        ),
        GoRoute(
          path: AppRoutes.support,
          builder: (context, state) => const SupportScreen(),
        ),
        GoRoute(
          path: AppRoutes.about,
          builder: (context, state) => const AboutScreen(),
        ),
      ],
    );
  }
}