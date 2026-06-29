import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../providers/app_providers.dart';
import '../models/paywall_state.dart';

final paywallPresentationProvider = Provider<PaywallPresentationState>((ref) {
  final state = ref.watch(paywallControllerProvider);
  return PaywallPresentationState(
    isPremium: state.isPremium,
    isUpgrading: state.isUpgrading,
  );
});