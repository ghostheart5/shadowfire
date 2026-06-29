import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/settings_item.dart';

final settingsItemsProvider = Provider<List<SettingsItem>>((ref) {
  return const [
    SettingsItem(
      title: 'Reset onboarding',
      description: 'Send the next launch flow back through /onboarding.',
    ),
    SettingsItem(
      title: 'Upgrade on device',
      description: 'Persist premium locally and unlock premium-protected routes.',
    ),
    SettingsItem(
      title: 'Logout',
      description: 'Clear the stored session while keeping the premium flag on device.',
    ),
  ];
});