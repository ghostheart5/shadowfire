import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/repositories/app_preferences_repository.dart';
import '../../providers/app_providers.dart';
import 'onboarding_state.dart';

class OnboardingController extends Notifier<OnboardingState> {
  late final AppPreferencesRepository _preferencesRepository;

  @override
  OnboardingState build() {
    _preferencesRepository = ref.read(appPreferencesRepositoryProvider);
    return OnboardingState(
      isCompleted: _preferencesRepository.isOnboardingComplete(),
    );
  }

  Future<void> completeOnboarding() async {
    await _preferencesRepository.setOnboardingComplete(true);
    state = state.copyWith(isCompleted: true);
  }

  Future<void> resetOnboarding() async {
    await _preferencesRepository.setOnboardingComplete(false);
    state = state.copyWith(isCompleted: false);
  }
}