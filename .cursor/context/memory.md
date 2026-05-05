# Memory

## Persistent Project Rules
- Expert-level UI/UX and Flutter engineering behavior is required.
- Mobile-first, responsive design is mandatory.
- Existing structure must be preserved while adding new features.

## Stable Decisions
- Use 8pt grid and safe-area-aware layouts.
- Keep Android/iOS visual consistency by default.
- Use vector icon assets.
- Project baseline is Flutter `3.41.7` on stable channel.
- Localization-first development is required (`en` and `tr`).
- Screens must support both light and dark themes.
- Active locales are `tr`, `en`, `es`, `it`, `ru`, and `ar`.
- Arabic locale must be validated in RTL mode.
- State management standard is Riverpod.
- App navigation and guards are handled with go_router.
- Network stack is Dio + interceptor with refresh-token retry.
- Secure credentials are stored in flutter_secure_storage.
- Theme and locale preferences are stored in shared_preferences.

## Current Architecture Snapshot
- Feature-first skeleton is active: `auth`, `landing`, `dashboard`, `jobs`, `settings`.
- App boot path is `/splash` -> `/landing` or role-based dashboard.
- Role resolution: admin type list > corporate audience > worker fallback.
- Response envelope parser is centralized in `core/network/api_envelope.dart`.

## Known Risks
- Changing shared components can create cross-screen regressions.
- Hard-coded styles can reduce consistency and maintainability.

## Open Questions
- Which breakpoints and device classes are officially supported?
- Is there an existing token source of truth (theme file, design tokens, etc.)?
