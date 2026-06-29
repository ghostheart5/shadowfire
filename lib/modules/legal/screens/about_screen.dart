import 'package:flutter/material.dart';

import '../widgets/paragraph_text.dart';
import '../widgets/section_title.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('About')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('About', style: Theme.of(context).textTheme.headlineLarge),
            const SectionTitle('Project intent'),
            const ParagraphText('Enterprise Template is a modular Flutter starter designed for authenticated, route-guarded, future AI-enhanced applications.'),
            const SectionTitle('Architecture'),
            const ParagraphText('The dependency chain follows UI to state to services to repositories to domain, while the domain layer remains pure Dart.'),
          ],
        ),
      ),
    );
  }
}