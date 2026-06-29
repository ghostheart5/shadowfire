import 'package:flutter/material.dart';

class SettingsTileCard extends StatelessWidget {
  const SettingsTileCard({
    required this.title,
    required this.description,
    required this.trailing,
    super.key,
  });

  final String title;
  final String description;
  final Widget trailing;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(title),
        subtitle: Text(description),
        trailing: trailing,
      ),
    );
  }
}