import 'package:flutter/material.dart';

class AuthHeader extends StatelessWidget {
  const AuthHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Sign in', style: theme.textTheme.headlineLarge),
        const SizedBox(height: 12),
        Text(
          'Use the mock account below to test auth guards, premium routing, and session persistence.',
          style: theme.textTheme.bodyLarge,
        ),
      ],
    );
  }
}