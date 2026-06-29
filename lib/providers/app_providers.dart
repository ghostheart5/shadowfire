import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../app/router/app_router.dart';
import '../core/bootstrap/app_bootstrap.dart';
import '../core/config/app_config.dart';
import '../domain/repositories/app_preferences_repository.dart';
import '../domain/repositories/auth_repository.dart';
import '../repositories/app_preferences_repository_impl.dart';
import '../repositories/auth_repository_impl.dart';
import '../services/ai/ai_service.dart';
import '../services/auth/mock_auth_service.dart';
import '../services/firebase/firebase_service.dart';
import '../services/storage/local_storage_service.dart';
import '../state/auth/auth_controller.dart';
import '../state/auth/auth_state.dart';
import '../state/onboarding/onboarding_controller.dart';
import '../state/onboarding/onboarding_state.dart';
import '../state/paywall/paywall_controller.dart';
import '../state/paywall/paywall_state.dart';

final appBootstrapProvider = Provider<AppBootstrap>((ref) {
  throw UnimplementedError('AppBootstrap must be overridden in main.dart.');
});

final appConfigProvider = Provider<AppConfig>((ref) {
  return ref.watch(appBootstrapProvider).config;
});

final localStorageServiceProvider = Provider<LocalStorageService>((ref) {
  return ref.watch(appBootstrapProvider).localStorageService;
});

final firebaseServiceProvider = Provider<FirebaseService>((ref) {
  return ref.watch(appBootstrapProvider).firebaseService;
});

final aiServiceProvider = Provider<AiService>((ref) {
  return ref.watch(appBootstrapProvider).aiService;
});

final mockAuthServiceProvider = Provider<MockAuthService>((ref) {
  return MockAuthService();
});

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepositoryImpl(
    authService: ref.watch(mockAuthServiceProvider),
    localStorageService: ref.watch(localStorageServiceProvider),
  );
});

final appPreferencesRepositoryProvider = Provider<AppPreferencesRepository>((ref) {
  return AppPreferencesRepositoryImpl(ref.watch(localStorageServiceProvider));
});

final authControllerProvider = NotifierProvider<AuthController, AuthState>(
  AuthController.new,
);

final onboardingControllerProvider =
    NotifierProvider<OnboardingController, OnboardingState>(
      OnboardingController.new,
    );

final paywallControllerProvider =
    NotifierProvider<PaywallController, PaywallState>(PaywallController.new);

final aiWorkspaceBriefProvider = FutureProvider<String>((ref) async {
  final response = await ref.watch(aiServiceProvider).generateWorkspaceBrief(
        'Summarize the current enterprise dashboard state and next steps.',
      );
  return response.text;
});

final appRouterProvider = Provider<GoRouter>((ref) {
  return AppRouter.create(ref);
});