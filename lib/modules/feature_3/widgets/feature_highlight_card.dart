import 'package:flutter/material.dart';

class Feature3HighlightCard extends StatelessWidget {
  const Feature3HighlightCard({required this.label, super.key});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Row(
          children: [
            const Icon(Icons.rocket_launch_outlined),
            const SizedBox(width: 12),
            Expanded(child: Text(label)),
          ],
        ),
      ),
    );
  }
}