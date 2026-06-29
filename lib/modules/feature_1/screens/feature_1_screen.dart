import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/widgets/feature_screen_template.dart';
import '../controllers/feature_1_controller.dart';
import '../widgets/feature_highlight_card.dart';

class Feature1Screen extends ConsumerWidget {
  const Feature1Screen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final items = ref.watch(feature1ItemsProvider);

    return FeatureScreenTemplate(
      title: 'Feature 1',
      subtitle: 'An unlocked generic module wired for extension without touching the domain core.',
      children: items
          .map(
            (item) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: FeatureHighlightCard(label: item.label),
            ),
          )
          .toList(),
    );
  }
}