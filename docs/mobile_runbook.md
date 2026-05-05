# Ada Is Akademi Mobile Runbook

## Local Setup
1. `flutter pub get`
2. `flutter gen-l10n`
3. `flutter run --dart-define-from-file=env/dev.json`

## Quality Gates
- `dart format --set-exit-if-changed .`
- `flutter analyze`
- `flutter test`
- `flutter test integration_test`

## Build
- Android debug: `flutter run --dart-define-from-file=env/dev.json`
- Android release: `flutter build apk --release --dart-define-from-file=env/prod.json`
- iOS release: `flutter build ios --release --dart-define-from-file=env/prod.json`

## Notes
- Auth interceptor refreshes token after `401`.
- Session is restored from secure storage on app start.
- Theme and locale are restored from shared preferences.

## Next Steps
- Replace mocked job and application screens with live Dio repositories.
- Add full screen-level semantic labels and minimum 44dp touch target audits.
- Add golden tests for dark/light and Arabic RTL mirrored layouts.
- Add offline/retry UX and richer domain-level error mapping.
