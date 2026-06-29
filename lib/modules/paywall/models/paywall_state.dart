class PaywallPresentationState {
  const PaywallPresentationState({
    required this.isPremium,
    required this.isUpgrading,
  });

  final bool isPremium;
  final bool isUpgrading;

  String get ctaLabel => isPremium ? 'Premium active' : 'Upgrade now';
}