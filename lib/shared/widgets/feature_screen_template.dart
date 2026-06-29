import 'package:flutter/material.dart';

class FeatureScreenTemplate extends StatelessWidget {
  const FeatureScreenTemplate({
    required this.title,
    required this.subtitle,
    required this.children,
    this.actions = const <Widget>[],
    super.key,
  });

  final String title;
  final String subtitle;
  final List<Widget> children;
  final List<Widget> actions;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return CustomScrollView(
      slivers: [
        SliverAppBar(
          pinned: true,
          automaticallyImplyLeading: false,
          title: Text(title),
          actions: actions,
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: theme.textTheme.headlineLarge),
                const SizedBox(height: 10),
                Text(subtitle, style: theme.textTheme.bodyLarge),
                const SizedBox(height: 24),
                ...children,
              ],
            ),
          ),
        ),
      ],
    );
  }
}