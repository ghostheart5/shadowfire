import 'package:flutter/material.dart';

import '../widgets/paragraph_text.dart';
import '../widgets/section_title.dart';

class TermsScreen extends StatelessWidget {
  const TermsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Terms')),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Terms', style: TextStyle(fontSize: 34, fontWeight: FontWeight.w800)),
            SectionTitle('Usage'),
            ParagraphText('Use this template as a starting point for enterprise Flutter applications and adapt the placeholders to your business requirements.'),
            SectionTitle('Mock services'),
            ParagraphText('Authentication, premium upgrades, and AI flows are mock implementations designed to be replaced by production services.'),
          ],
        ),
      ),
    );
  }
}