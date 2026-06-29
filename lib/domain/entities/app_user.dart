class AppUser {
  const AppUser({
    required this.email,
    required this.isPremium,
  });

  final String email;
  final bool isPremium;

  AppUser copyWith({
    String? email,
    bool? isPremium,
  }) {
    return AppUser(
      email: email ?? this.email,
      isPremium: isPremium ?? this.isPremium,
    );
  }
}