import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../app/router/app_routes.dart';
import '../../../providers/app_providers.dart';
import '../controllers/paywall_controller.dart';

class PaywallScreen extends ConsumerWidget {
  const PaywallScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final paywallState = ref.watch(paywallPresentationProvider);

    ref.listen(paywallControllerProvider, (previous, next) {
      if (previous?.isPremium == false && next.isPremium) {
        context.go(AppRoutes.feature2);
      }
    });

    return Scaffold(
      appBar: AppBar(title: const Text('Paywall')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Unlock premium', style: Theme.of(context).textTheme.headlineLarge),
            const SizedBox(height: 12),
            Text(
              'Premium unlocks /feature2 and /feature3. The flag persists in SharedPreferences and is enforced by the router.',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 24),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Premium plan', style: Theme.of(context).textTheme.titleLarge),
                    const SizedBox(height: 8),
                    const Text('Mock purchase flow for route-level access control.'),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: paywallState.isPremium || paywallState.isUpgrading
                            ? null
                            : () => ref.read(paywallControllerProvider.notifier).upgrade(),
                        child: Text(
                          paywallState.isUpgrading
                              ? 'Upgrading...'
                              : paywallState.ctaLabel,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}