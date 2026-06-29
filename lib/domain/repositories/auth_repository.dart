import '../entities/app_user.dart';
import '../entities/login_credentials.dart';

abstract class AuthRepository {
  AppUser? getCurrentUser();

  Future<AppUser> signIn(LoginCredentials credentials);

  Future<void> signOut();

  Future<void> updatePremium(bool isPremium);
}