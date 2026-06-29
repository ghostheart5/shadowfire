import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/app_providers.dart';
import 'paywall_state.dart';

class PaywallController extends Notifier<PaywallState> {
  @override
  PaywallState build() {
    final authState = ref.watch(authControllerProvider);
    return PaywallState(isPremium: authState.isPremium);
  }

  Future<void> upgrade() async {
    state = state.copyWith(isUpgrading: true);
    await Future<void>.delayed(const Duration(milliseconds: 250));
    await ref.read(authControllerProvider.notifier).setPremium(true);
    state = state.copyWith(isPremium: true, isUpgrading: false);
  }
}