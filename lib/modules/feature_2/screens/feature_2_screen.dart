import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/widgets/feature_screen_template.dart';
import '../controllers/feature_2_controller.dart';
import '../widgets/feature_highlight_card.dart';

class Feature2Screen extends ConsumerWidget {
  const Feature2Screen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final items = ref.watch(feature2ItemsProvider);

    return FeatureScreenTemplate(
      title: 'Feature 2',
      subtitle: 'Premium users land here automatically after paywall upgrade and deep links stay guarded.',
      children: items
          .map(
            (item) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Feature2HighlightCard(label: item.label),
            ),
          )
          .toList(),
    );
  }
}