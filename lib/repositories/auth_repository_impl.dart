import '../core/constants/storage_keys.dart';
import '../domain/entities/app_user.dart';
import '../domain/entities/login_credentials.dart';
import '../domain/repositories/auth_repository.dart';
import '../services/auth/mock_auth_service.dart';
import '../services/storage/local_storage_service.dart';

class AuthRepositoryImpl implements AuthRepository {
  const AuthRepositoryImpl({
    required this._authService,
    required this._localStorageService,
  });

  final MockAuthService _authService;
  final LocalStorageService _localStorageService;

  @override
  AppUser? getCurrentUser() {
    final email = _localStorageService.getString(StorageKeys.sessionEmail);
    if (email == null || email.isEmpty) {
      return null;
    }

    return AppUser(
      email: email,
      isPremium: _localStorageService.getBool(StorageKeys.premiumEnabled),
    );
  }

  @override
  Future<AppUser> signIn(LoginCredentials credentials) async {
    final user = await _authService.signIn(
      credentials: credentials,
      isPremium: _localStorageService.getBool(StorageKeys.premiumEnabled),
    );

    await _localStorageService.setString(StorageKeys.sessionEmail, user.email);
    return user;
  }

  @override
  Future<void> signOut() async {
    await _localStorageService.remove(StorageKeys.sessionEmail);
  }

  @override
  Future<void> updatePremium(bool isPremium) async {
    await _localStorageService.setBool(StorageKeys.premiumEnabled, isPremium);
  }
}