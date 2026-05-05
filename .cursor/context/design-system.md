# Design System

## Responsive and Platform Consistency
- Mobile-first by default.
- Keep Android and iOS visuals consistent unless platform-specific behavior is intentional.
- Use safe-area-aware layouts.

## Spacing and Sizing
- Use 8pt grid for spacing rhythm.
- Prefer density-independent units (dp/sp equivalents).
- Avoid hard-coded magic numbers when tokens can be used.

## Visual Language
- Use vector icons (SVG or icon font) for scalable assets.
- Apply semantic color and typography tokens.
- Keep contrast and readability high for accessibility.

## Component Rules
- Components must support responsive constraints.
- Variants (size/state/theme) should be explicit and documented.
- New components should not break existing layout behavior.
- Light and dark themes must be supported for every new screen.

## Localization Rules
- User-facing text must come from localization keys, not hard-coded strings.
- Keep English (`en`) and Turkish (`tr`) translations aligned.
