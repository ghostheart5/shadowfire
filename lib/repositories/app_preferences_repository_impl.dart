import '../core/constants/storage_keys.dart';
import '../domain/repositories/app_preferences_repository.dart';
import '../services/storage/local_storage_service.dart';

class AppPreferencesRepositoryImpl implements AppPreferencesRepository {
  const AppPreferencesRepositoryImpl(this._localStorageService);

  final LocalStorageService _localStorageService;

  @override
  bool isOnboardingComplete() {
    return _localStorageService.getBool(StorageKeys.onboardingComplete);
  }

  @override
  Future<void> setOnboardingComplete(bool value) async {
    await _localStorageService.setBool(StorageKeys.onboardingComplete, value);
  }
}