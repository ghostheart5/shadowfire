import 'package:flutter/material.dart';

import '../models/onboarding_slide.dart';

class OnboardingPageCard extends StatelessWidget {
  const OnboardingPageCard({required this.slide, super.key});

  final OnboardingSlide slide;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 64,
              height: 64,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: const LinearGradient(
                  colors: [Color(0xFF0A4FFF), Color(0xFF11C9A7)],
                ),
              ),
              child: const Icon(Icons.auto_awesome, color: Colors.white),
            ),
            const SizedBox(height: 20),
            Text(slide.title, style: theme.textTheme.headlineMedium),
            const SizedBox(height: 12),
            Text(slide.description, style: theme.textTheme.bodyLarge),
          ],
        ),
      ),
    );
  }
}