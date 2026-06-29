# Enterprise Template

Download-ready Flutter project template with Riverpod, GoRouter, mock auth, paywall routing, local persistence, clean architecture boundaries, and AI service scaffolding.

## Stack

- Flutter stable
- Riverpod for state and dependency injection
- GoRouter with guards, shell navigation, and deep-link-friendly paths
- SharedPreferences wrapped in a storage service
- Firebase bootstrap service with optional initialization
- Clean architecture with pure Dart domain layer
- AI service scaffolding for RAG, agents, memory, embeddings, evaluators, and experiments

## Demo Credentials

- Email: test@test.com
- Password: 123456

## Run

```bash
flutter pub get
flutter run
```

## Routes

- /onboarding
- /login
- /home
- /settings
- /paywall
- /privacy
- /terms
- /support
- /about
- /feature1
- /feature2
- /feature3

## Notes

- Firebase is disabled by default in assets/config/app_config.json.
- Premium access is persisted locally.
- Onboarding completion is persisted locally.
- Session auto-login is enabled through SharedPreferences.
