import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/login_credentials.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../services/auth/mock_auth_service.dart';
import '../../providers/app_providers.dart';
import 'auth_state.dart';

class AuthController extends Notifier<AuthState> {
  late final AuthRepository _authRepository;

  @override
  AuthState build() {
    _authRepository = ref.read(authRepositoryProvider);
    return AuthState(user: _authRepository.getCurrentUser());
  }

  Future<bool> login({required String email, required String password}) async {
    state = state.copyWith(isLoading: true, clearError: true);

    try {
      final user = await _authRepository.signIn(
        LoginCredentials(email: email.trim(), password: password),
      );
      state = AuthState(user: user);
      return true;
    } on AuthException catch (error) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: error.message,
      );
      return false;
    }
  }

  Future<void> logout() async {
    state = state.copyWith(isLoading: true, clearError: true);
    await _authRepository.signOut();
    state = const AuthState();
  }

  Future<void> setPremium(bool isPremium) async {
    await _authRepository.updatePremium(isPremium);
    final currentUser = state.user;
    if (currentUser == null) {
      state = state.copyWith(clearError: true);
      return;
    }

    state = AuthState(user: currentUser.copyWith(isPremium: isPremium));
  }
}