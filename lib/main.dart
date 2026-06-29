import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app/app.dart';
import 'core/bootstrap/app_bootstrap.dart';
import 'core/config/app_config.dart';
import 'services/ai/ai_service.dart';
import 'services/firebase/firebase_service.dart';
import 'services/storage/local_storage_service.dart';
import 'providers/app_providers.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final sharedPreferences = await SharedPreferences.getInstance();
  final localStorageService = LocalStorageService(sharedPreferences);
  final config = await AppConfigLoader.load();
  final firebaseService = FirebaseService();
  await firebaseService.initialize(enabled: config.firebaseEnabled);
  final aiService = AiService();
  await aiService.initialize(enabled: config.aiEnabled);

  final bootstrap = AppBootstrap(
    config: config,
    localStorageService: localStorageService,
    firebaseService: firebaseService,
    aiService: aiService,
  );

  runApp(
    ProviderScope(
      overrides: [
        appBootstrapProvider.overrideWithValue(bootstrap),
      ],
      child: const EnterpriseTemplateApp(),
    ),
  );
}
