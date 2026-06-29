import 'package:firebase_core/firebase_core.dart';

class FirebaseService {
  bool _initialized = false;

  bool get isInitialized => _initialized;

  Future<void> initialize({required bool enabled}) async {
    if (!enabled || _initialized) {
      return;
    }

    try {
      if (Firebase.apps.isEmpty) {
        await Firebase.initializeApp();
      }
      _initialized = true;
    } catch (_) {
      _initialized = false;
    }
  }
}