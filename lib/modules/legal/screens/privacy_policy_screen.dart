import 'package:flutter/material.dart';

import '../widgets/paragraph_text.dart';
import '../widgets/section_title.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const _LegalPage(
      title: 'Privacy Policy',
      sections: [
        _LegalSection(
          title: 'Data handling',
          paragraphs: [
            'This template stores only onboarding, session, and premium flags locally via SharedPreferences.',
            'Firebase services remain optional and disabled by default until you provide platform configuration.',
          ],
        ),
        _LegalSection(
          title: 'AI readiness',
          paragraphs: [
            'AI service classes are scaffolds only. No remote model provider is connected and no API keys are included.',
          ],
        ),
      ],
    );
  }
}

class _LegalPage extends StatelessWidget {
  const _LegalPage({required this.title, required this.sections});

  final String title;
  final List<_LegalSection> sections;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: Theme.of(context).textTheme.headlineLarge),
            const SizedBox(height: 12),
            ...sections.expand(
              (section) => [
                SectionTitle(section.title),
                ...section.paragraphs.map(ParagraphText.new),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _LegalSection {
  const _LegalSection({required this.title, required this.paragraphs});

  final String title;
  final List<String> paragraphs;
}