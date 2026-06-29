class OnboardingState {
  const OnboardingState({required this.isCompleted});

  final bool isCompleted;

  OnboardingState copyWith({bool? isCompleted}) {
    return OnboardingState(isCompleted: isCompleted ?? this.isCompleted);
  }
}