import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../app/router/app_routes.dart';
import '../../../providers/app_providers.dart';
import '../../../shared/widgets/feature_screen_template.dart';
import '../controllers/settings_controller.dart';
import '../widgets/settings_tile_card.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final items = ref.watch(settingsItemsProvider);
    final authState = ref.watch(authControllerProvider);

    return FeatureScreenTemplate(
      title: 'Settings',
      subtitle: 'Toggle premium behavior, reset onboarding, and manage the mock session.',
      children: [
        SettingsTileCard(
          title: items[0].title,
          description: items[0].description,
          trailing: TextButton(
            onPressed: () async {
              await ref.read(onboardingControllerProvider.notifier).resetOnboarding();
              if (!context.mounted) {
                return;
              }
              context.go(AppRoutes.onboarding);
            },
            child: const Text('Reset'),
          ),
        ),
        const SizedBox(height: 12),
        SettingsTileCard(
          title: items[1].title,
          description: items[1].description,
          trailing: Switch(
            value: authState.isPremium,
            onChanged: (value) {
              ref.read(authControllerProvider.notifier).setPremium(value);
            },
          ),
        ),
        const SizedBox(height: 12),
        SettingsTileCard(
          title: items[2].title,
          description: items[2].description,
          trailing: TextButton(
            onPressed: () async {
              await ref.read(authControllerProvider.notifier).logout();
              if (!context.mounted) {
                return;
              }
              context.go(AppRoutes.login);
            },
            child: const Text('Logout'),
          ),
        ),
      ],
    );
  }
}