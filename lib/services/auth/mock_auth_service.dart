import '../../domain/entities/app_user.dart';
import '../../domain/entities/login_credentials.dart';

class AuthException implements Exception {
  const AuthException(this.message);

  final String message;
}

class MockAuthService {
  static const demoEmail = 'test@test.com';
  static const demoPassword = '123456';

  Future<AppUser> signIn({
    required LoginCredentials credentials,
    required bool isPremium,
  }) async {
    await Future<void>.delayed(const Duration(milliseconds: 350));

    if (credentials.email == demoEmail && credentials.password == demoPassword) {
      return AppUser(email: credentials.email, isPremium: isPremium);
    }

    throw const AuthException('Invalid credentials. Use test@test.com / 123456.');
  }
}