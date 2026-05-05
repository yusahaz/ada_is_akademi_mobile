# Architecture

## Core Principles
- Preserve existing structure; avoid unnecessary refactors.
- Keep responsibilities isolated by feature and layer.
- Prefer composition over deep inheritance.
- Keep each screen and component predictable and testable.

## Layering Guidance
- `app`: app bootstrap, routing, theme, localization configuration.
- `presentation`: screens, layouts, and widgets.
- `application`: state orchestration (Bloc/Cubit, Riverpod, or project standard).
- `domain`: business rules and contracts.
- `data`: API clients, repositories, local persistence.

## Change Safety
- Any new feature must integrate without breaking existing pages.
- Reuse existing contracts where possible.
- If a breaking change is unavoidable, document migration steps before implementation.
