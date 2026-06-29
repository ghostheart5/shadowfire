import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../app/router/app_routes.dart';
import '../../../providers/app_providers.dart';
import '../controllers/onboarding_flow_controller.dart';
import '../widgets/onboarding_page_card.dart';

class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({super.key});

  @override
  ConsumerState<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _pageIndex = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final slides = ref.watch(onboardingSlidesProvider);
    final isLastPage = _pageIndex == slides.length - 1;
    final theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Welcome', style: theme.textTheme.headlineLarge),
              const SizedBox(height: 12),
              Text(
                'Complete onboarding before login. Legal pages remain reachable from here and through deep links.',
                style: theme.textTheme.bodyLarge,
              ),
              const SizedBox(height: 24),
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: slides.length,
                  onPageChanged: (value) => setState(() => _pageIndex = value),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: OnboardingPageCard(slide: slides[index]),
                    );
                  },
                ),
              ),
              const SizedBox(height: 12),
              Row(
                children: List<Widget>.generate(
                  slides.length,
                  (index) => AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    margin: const EdgeInsets.only(right: 8),
                    height: 8,
                    width: _pageIndex == index ? 28 : 8,
                    decoration: BoxDecoration(
                      color: _pageIndex == index
                          ? theme.colorScheme.primary
                          : const Color(0xFFD6DEED),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    if (!isLastPage) {
                      await _pageController.nextPage(
                        duration: const Duration(milliseconds: 250),
                        curve: Curves.easeOut,
                      );
                      return;
                    }

                    await ref
                        .read(onboardingControllerProvider.notifier)
                        .completeOnboarding();
                    if (!context.mounted) {
                      return;
                    }
                    context.go(AppRoutes.login);
                  },
                  child: Text(isLastPage ? 'Start onboarding' : 'Continue'),
                ),
              ),
              TextButton(
                onPressed: () => context.go(AppRoutes.privacy),
                child: const Text('View privacy policy'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}