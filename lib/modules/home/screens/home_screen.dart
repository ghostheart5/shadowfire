import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../providers/app_providers.dart';
import '../../../shared/widgets/feature_screen_template.dart';
import '../controllers/home_controller.dart';
import '../widgets/quick_action_card.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authControllerProvider);
    final items = ref.watch(homeItemsProvider);
    final aiBrief = ref.watch(aiWorkspaceBriefProvider);

    return FeatureScreenTemplate(
      title: 'Home',
      subtitle:
          'Session persistence, premium routing, deep links, and service wiring all start here.',
      children: [
        Card(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  authState.isLoggedIn
                      ? 'Signed in as ${authState.user!.email}'
                      : 'Signed out',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 8),
                Text(
                  authState.isPremium
                      ? 'Premium is active on this device.'
                      : 'Premium is inactive. Premium routes redirect to /paywall.',
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('AI workspace brief', style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(height: 10),
                aiBrief.when(
                  data: (value) => Text(value),
                  loading: () => const Text('Generating mock brief...'),
                  error: (_, _) => const Text('AI preview unavailable.'),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
        ...items.map(
          (item) => Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: QuickActionCard(
              item: item,
              onTap: () => context.go(item.route),
            ),
          ),
        ),
      ],
    );
  }
}