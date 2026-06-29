import '../../services/ai/ai_service.dart';
import '../../services/firebase/firebase_service.dart';
import '../../services/storage/local_storage_service.dart';
import '../config/app_config.dart';

class AppBootstrap {
  const AppBootstrap({
    required this.config,
    required this.localStorageService,
    required this.firebaseService,
    required this.aiService,
  });

  final AppConfig config;
  final LocalStorageService localStorageService;
  final FirebaseService firebaseService;
  final AiService aiService;
}