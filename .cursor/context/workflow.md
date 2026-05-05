# Workflow

## 1) Analyze Before Coding (Required)
- Clarify goal, constraints, and acceptance criteria.
- Identify impacted files, dependencies, and regression risks.
- Choose the safest approach that fits current architecture.

## 2) Plan as Tasks
- Split work into small tasks.
- Track each item with statuses: `todo`, `in_progress`, `done`, `blocked`.
- Keep exactly one active `in_progress` task when possible.

## 3) Implement Safely
- Apply minimal-impact changes.
- Add new features without breaking existing behavior.
- Avoid unrelated refactors during scoped feature work.

## 4) Validate and Document
- Validate key UI states and responsive behavior.
- Validate both light and dark themes.
- Validate localization flow for `en` and `tr`.
- Record what changed and why in `memory.md`.
- Update task progress in `tasks.md`.
