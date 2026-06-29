abstract class AppPreferencesRepository {
  bool isOnboardingComplete();

  Future<void> setOnboardingComplete(bool value);
}