AGENTS: TrustLink quick guide for agentic tools
- Setup: `flutter pub get`
- Build: `flutter build apk --release` (Android) | `flutter build ios` (macOS only)
- Run: `flutter run`
- Lint: `flutter analyze` (uses `flutter_lints` v4 via `analysis_options.yaml`)
- Format: `dart format .` (add trailing commas to help formatter)
- Test all: `flutter test`
- Single file: `flutter test test/widget_test.dart`
- Single by name: `flutter test -n "description of test"`
- Coverage: `flutter test --coverage`

Code style (Dart/Flutter)
- Imports: group and order `dart:`, `package:`, then project; sort; prefer relative imports within `lib/`.
- Types: use explicit types for public APIs; prefer `final`/`const`; avoid `dynamic` and untyped `var` for fields.
- Naming: files `snake_case.dart`; classes `UpperCamelCase`; methods/vars `lowerCamelCase`; private members `_prefixed`; constants `lowerCamelCase` `const`.
- Widgets: keep small and pure; pass data via constructors; avoid singletons for state.
- Error handling: use `AppExceptions` (see `lib/network/app_exception.dart`); throw/propagate typed errors; don’t return `null` silently.
- Networking: use `ApiServices` (Dio); map `DioException` to `AppExceptions`; log via `dart:developer` `log`, never `print`.
- Null safety: avoid nullable types unless required; prefer early returns/guards over nested `if`s.
- Tests: avoid real network; mock Dio/interceptors; follow arrange/act/assert; place tests under `test/`.
- Tools: no project-specific formatter beyond defaults; VS Code settings minimal.
- Cursor/Copilot: no `.cursor/` or Copilot rules found; none to enforce.