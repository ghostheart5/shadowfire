import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:enterprise_template/app/app.dart';
import 'package:enterprise_template/core/bootstrap/app_bootstrap.dart';
import 'package:enterprise_template/core/config/app_config.dart';
import 'package:enterprise_template/providers/app_providers.dart';
import 'package:enterprise_template/services/ai/ai_service.dart';
import 'package:enterprise_template/services/firebase/firebase_service.dart';
import 'package:enterprise_template/services/storage/local_storage_service.dart';

void main() {
  testWidgets('shows onboarding when onboarding is incomplete', (
    WidgetTester tester,
  ) async {
    SharedPreferences.setMockInitialValues(<String, Object>{});
    final sharedPreferences = await SharedPreferences.getInstance();
    final bootstrap = AppBootstrap(
      config: const AppConfig(
        appName: 'Enterprise Template',
        firebaseEnabled: false,
        aiEnabled: true,
        supportEmail: 'support@example.com',
      ),
      localStorageService: LocalStorageService(sharedPreferences),
      firebaseService: FirebaseService(),
      aiService: AiService(),
    );

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          appBootstrapProvider.overrideWithValue(bootstrap),
        ],
        child: const EnterpriseTemplateApp(),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Welcome'), findsOneWidget);
    expect(find.text('Continue'), findsOneWidget);
  });
}
