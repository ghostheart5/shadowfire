import 'dart:convert';

import 'package:flutter/services.dart';

class AppConfig {
  const AppConfig({
    required this.appName,
    required this.firebaseEnabled,
    required this.aiEnabled,
    required this.supportEmail,
  });

  final String appName;
  final bool firebaseEnabled;
  final bool aiEnabled;
  final String supportEmail;

  factory AppConfig.fromJson(Map<String, dynamic> json) {
    return AppConfig(
      appName: json['appName'] as String? ?? 'Enterprise Template',
      firebaseEnabled: json['firebaseEnabled'] as bool? ?? false,
      aiEnabled: json['aiEnabled'] as bool? ?? true,
      supportEmail: json['supportEmail'] as String? ?? 'support@example.com',
    );
  }
}

class AppConfigLoader {
  static Future<AppConfig> load() async {
    final raw = await rootBundle.loadString('assets/config/app_config.json');
    return AppConfig.fromJson(jsonDecode(raw) as Map<String, dynamic>);
  }
}