class PaywallState {
  const PaywallState({
    required this.isPremium,
    this.isUpgrading = false,
  });

  final bool isPremium;
  final bool isUpgrading;

  PaywallState copyWith({
    bool? isPremium,
    bool? isUpgrading,
  }) {
    return PaywallState(
      isPremium: isPremium ?? this.isPremium,
      isUpgrading: isUpgrading ?? this.isUpgrading,
    );
  }
}