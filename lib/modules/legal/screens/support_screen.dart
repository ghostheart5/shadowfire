import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../providers/app_providers.dart';
import '../widgets/paragraph_text.dart';
import '../widgets/section_title.dart';

class SupportScreen extends ConsumerWidget {
  const SupportScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final config = ref.watch(appConfigProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Support')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Support', style: Theme.of(context).textTheme.headlineLarge),
            const SectionTitle('Contact'),
            ParagraphText('Primary support contact: ${config.supportEmail}'),
            const SectionTitle('Deep links'),
            const ParagraphText('This screen is reachable directly at /support and remains accessible before login for guard-safe public access.'),
            const SectionTitle('Next integration points'),
            const ParagraphText('Replace this placeholder page with help center content, issue intake, and diagnostic export workflows.'),
          ],
        ),
      ),
    );
  }
}