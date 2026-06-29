import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/login_form_state.dart';

final loginFormControllerProvider =
    NotifierProvider<LoginFormController, LoginFormState>(
      LoginFormController.new,
    );

class LoginFormController extends Notifier<LoginFormState> {
  @override
  LoginFormState build() => const LoginFormState();

  void updateEmail(String value) {
    state = state.copyWith(email: value);
  }

  void updatePassword(String value) {
    state = state.copyWith(password: value);
  }
}