import 'package:flutter/material.dart';

import '../models/home_item.dart';

class QuickActionCard extends StatelessWidget {
  const QuickActionCard({
    required this.item,
    required this.onTap,
    super.key,
  });

  final HomeItem item;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      child: InkWell(
        borderRadius: BorderRadius.circular(24),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Row(
            children: [
              Container(
                width: 52,
                height: 52,
                decoration: BoxDecoration(
                  color: item.isPremium
                      ? const Color(0xFFFFF2EB)
                      : const Color(0xFFEAF0FF),
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Icon(
                  item.isPremium ? Icons.lock_open : Icons.bolt,
                  color: item.isPremium
                      ? const Color(0xFFFF6B35)
                      : theme.colorScheme.primary,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(item.title, style: theme.textTheme.titleLarge),
                    const SizedBox(height: 6),
                    Text(item.description, style: theme.textTheme.bodyMedium),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}