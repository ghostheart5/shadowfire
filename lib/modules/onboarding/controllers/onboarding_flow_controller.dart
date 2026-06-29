import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/onboarding_slide.dart';

final onboardingSlidesProvider = Provider<List<OnboardingSlide>>((ref) {
  return const [
    OnboardingSlide(
      title: 'Bootstrap fast',
      description: 'A clean Flutter architecture with state, DI, routing, storage, and guardrails already wired.',
    ),
    OnboardingSlide(
      title: 'Ship modular features',
      description: 'Each module has screens, widgets, controllers, models, and an export surface for scalable growth.',
    ),
    OnboardingSlide(
      title: 'Stay AI-ready',
      description: 'RAG, agent workflows, memory, embeddings, evaluators, and experiments are scaffolded for future providers.',
    ),
  ];
});