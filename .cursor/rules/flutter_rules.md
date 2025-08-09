# Rosetta Flutter Project - Cursor Rules

You are an expert Flutter/Dart developer working on the Rosetta project. Follow these guidelines:

## Project Information
- **Project**: Rosetta
- **Organization**: dev.ikorolev
- **Platforms**: iOS, Android, macOS, Windows, Linux (Desktop-focused)
- **Flutter Version**: 3.32.8+
- **Dart Version**: 3.8.1+
- **Purpose**: ARB (Application Resource Bundle) translation management tool

## Architecture Guidelines

### Clean Architecture & Organization
- Follow Clean Architecture: `core/`, `data/`, `domain/`, `presentation/` layers
- **Feature-first** structure within each layer
- **Mandatory barrel exports** in every folder for clean imports
- **Top-level imports only**: `import 'package:rosetta/core.dart';` (never deep imports)

### State Management & DI
- Use **Bloc** + **flutter_bloc** for state management
- Use **get_it** for dependency injection (not BlocProvider)
- Use **dart_mappable** for events/states (auto-generates copyWith, ==, hashCode)
- Create `injection_container.dart` in core for DI setup
- Follow naming: `FeatureEvent`, `FeatureState`, `FeatureBloc`
- Use **bloc_test** for testing
### Features Structure
- **arb_management**: ARB file operations (parsing, saving, validation)
- **translation_editor**: Translation editing interface and widgets
- **project_management**: Project/workspace management
- **validation**: Translation validation and quality checks
- **export_import**: File export/import operations (CSV, etc.)
- **analytics**: Translation statistics and analytics

### Shared vs Feature-Specific
- **Use Shared** when component is used in 2+ features or provides app-wide functionality
- **Keep Feature-Specific** when tightly coupled to one feature or has specific behavior
- Place shared components in `shared/` directory structure

### Naming Conventions
- **snake_case**: file names and directories
- **camelCase**: variables and methods  
- **PascalCase**: classes and widgets
- **_prefix**: private members

## Coding Standards

### Core Practices
- Use `const` constructors, composition over inheritance
- Use **dart_mappable** for data classes (auto-generates copyWith, ==, hashCode)
- Create small, focused widgets; prefer `StatelessWidget`
- Follow **very_good_analysis** lint rules
- Keep functions small (max 20-30 lines)

### Desktop-First Design
- Design for larger screens with keyboard shortcuts
- Support mouse interactions (hover, right-click)
- Optimize for file operations and large datasets
- Consider multi-window support

### Performance
- Use `ListView.builder()` for large lists
- Implement proper resource disposal (controllers, streams, blocs)
- Use `const` constructors extensively
- Cache parsed ARB data

### Testing
- Write unit/widget/bloc tests using **bloc_test** and **mocktail**
- Mock get_it dependencies in tests
- Aim for >80% code coverage
- Test error scenarios and edge cases

### Documentation
- Document public APIs, business logic, ARB format specifics
- Use `///` for public members, focus on "why" not "what"
- Keep documentation current with code changes

## Localization (l10n) Guidelines

### Setup
- Use **flutter_localizations** and **intl** packages
- Enable l10n in `pubspec.yaml` with `generate: true`
- Create ARB files in `lib/l10n/` (app_en.arb, app_es.arb, etc.)
- Support: English, Spanish, French, German, Russian, Chinese, Japanese, Arabic

### Translation Key Naming
Use structured naming: `<feature><component><descriptor>`
- Examples: `arbManagementFileButtonOpen`, `translationEditorTableHeaderKey`, `commonButtonSave`
- Feature prefixes: `arbManagement`, `translationEditor`, `projectManagement`, `validation`, `exportImport`, `analytics`, `common`

### Implementation  
- Access via `context.l10n` extension method
- Include `@@locale` metadata and translator descriptions in ARB files
- Use placeholders for dynamic content: `{fileName}`
- Handle missing translations with fallbacks

## Theming Guidelines

- Support **light and dark themes** using Material 3 `ThemeData`
- Create **ThemeExtensions** for spacing, radiuses, sizes, durations
- Access via context extensions: `context.spacing`, `context.radiuses`, etc.
- Adapt spacing and typography for desktop interfaces
- Support high contrast themes for accessibility

## Routing Guidelines

- Use **go_router** for declarative routing with type-safe navigation
- Support nested routing, deep linking, and desktop patterns (tabs, multiple windows)
- Access via context extensions: `context.goTo(path)`, `context.pushTo(path)`, `context.pop()`

## File Operations & Dependencies

### ARB File Operations
- Parse ARB files with error handling and syntax validation
- Support large files with efficient parsing and file watching
- Handle UTF-8 encoding, backup/recovery, drag-and-drop
- Implement auto-save and recent files functionality

### Required Dependencies
- **State/DI**: `flutter_bloc`, `bloc`, `get_it`
- **Data**: `dart_mappable`, `dart_mappable_builder` (dev)
- **Routing**: `go_router`
- **L10n**: `flutter_localizations`, `intl` 
- **Files**: `file_picker`, `path_provider`, `path`, `watcher`, `csv`
- **Testing**: `bloc_test`, `mocktail` (dev)

## Platform-Specific & Quality Guidelines

### Desktop Platforms (Primary Focus)
- **macOS**: Follow HIG, native menu bars, file dialogs, keyboard shortcuts, file associations
- **Windows**: Follow Fluent Design, Windows-style operations, accessibility features
- **Linux**: Support various desktop environments, file managers, distributions

### Mobile (Secondary Support)  
- **iOS**: Adapt UI for mobile, use Cupertino widgets, handle file sharing limitations
- **Android**: Follow Material Design, handle file system access and storage permissions

### Quality Assurance
- **ARB Validation**: Check missing keys, placeholder consistency, ICU syntax, duplicates, JSON syntax
- **Translation Quality**: Check empty translations, placeholder usage, length constraints
- **Error Handling**: Graceful file operation errors, meaningful messages, retry mechanisms, user-friendly recovery
- **Security**: Validate file inputs, handle untrusted ARB files safely, sanitize user inputs
- **Performance**: Lazy loading, efficient data structures, pagination, caching, background processing
- **Accessibility**: Screen reader support, keyboard navigation, high contrast themes, font scaling

## Git Commit Guidelines

Follow **Conventional Commits** specification: `<type>[scope]: <description>`

### Commit Types
- **feat**: New feature
- **fix**: Bug fix  
- **docs**: Documentation changes
- **refactor**: Code restructuring without feature/bug changes
- **perf**: Performance improvements
- **test**: Test additions/corrections
- **chore**: Maintenance tasks

### Scopes (Rosetta-specific)
- **arb**: ARB file operations
- **editor**: Translation editing interface
- **project**: Project/workspace management
- **validation**: Translation validation
- **export**: File export/import
- **core**: Core utilities, theme, routing
- **deps**: Dependency updates

### Examples
```
feat(arb): add ARB file parsing with validation
fix(editor): resolve translation table scrolling issue
refactor(core): migrate to get_it dependency injection
docs(validation): add ARB validation rules documentation
```

### Best Practices
- Keep subject line under 50 characters
- Use imperative mood ("Add" not "Added")
- Include body for complex changes explaining what and why
- Reference issues: `Closes #123`, `Fixes #456`
- Use `BREAKING CHANGE:` for breaking changes

When suggesting code changes or new features, always consider:
1. How it fits into the clean architecture
2. Bloc pattern implementation with get_it dependency injection
3. Performance implications for large translation files
4. Desktop-first design principles
5. Cross-platform compatibility
6. File operation safety and error handling
7. Testing requirements with mocktail mocking
8. Security implications for file operations
9. Accessibility for translation professionals
10. Code maintainability and extensibility

Remember: Write code that is readable, testable, and maintainable. Prioritize user experience for translation professionals. Design for desktop-first usage while maintaining mobile compatibility. Use Bloc for state management, get_it for dependency injection, dart_mappable for data classes, and mocktail for testing.
