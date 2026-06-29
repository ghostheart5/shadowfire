class LoginFormState {
  const LoginFormState({
    this.email = 'test@test.com',
    this.password = '123456',
  });

  final String email;
  final String password;

  LoginFormState copyWith({
    String? email,
    String? password,
  }) {
    return LoginFormState(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }
}