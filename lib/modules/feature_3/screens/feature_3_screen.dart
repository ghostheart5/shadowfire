import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/widgets/feature_screen_template.dart';
import '../controllers/feature_3_controller.dart';
import '../widgets/feature_highlight_card.dart';

class Feature3Screen extends ConsumerWidget {
  const Feature3Screen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final items = ref.watch(feature3ItemsProvider);

    return Scaffold(
      body: SafeArea(
        child: FeatureScreenTemplate(
          title: 'Feature 3',
          subtitle: 'A top-level premium destination for deep links that bypass the shell but not the guards.',
          children: items
              .map(
                (item) => Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Feature3HighlightCard(label: item.label),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}