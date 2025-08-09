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

### Clean Architecture
- Follow Clean Architecture principles with clear separation of concerns
- Use the following layer structure:
  ```
  lib/
  ├── core/           # Core utilities, constants, errors
  ├── data/           # Data sources, repositories implementation
  ├── domain/         # Business logic, entities, use cases
  ├── presentation/   # UI layer (pages, widgets, state management)
  └── main.dart
  ```

### State Management
- Use **Bloc** as the primary state management solution
- Use **flutter_bloc** and **bloc** packages
- Follow Bloc pattern with Events, States, and Blocs
- Use **Cubit** for simpler state management scenarios
- Organize blocs in the presentation layer by feature
- Use **get_it** for dependency injection instead of BlocProvider for complex scenarios
- Use **BlocBuilder**, **BlocListener**, and **BlocConsumer** for UI updates
- Implement proper bloc disposal and memory management

### Dependency Injection
- Use **get_it** as the primary dependency injection solution
- Register all dependencies (repositories, services, blocs) in get_it
- Create a dedicated `injection_container.dart` file for DI setup
- Use **get_it** to provide dependencies to blocs and repositories
- Register singletons for services and factories for blocs
- Initialize DI container before running the app

### Bloc Guidelines
- Create separate files for events, states, and blocs
- Use **dart_mappable** for events and states serialization and comparison
- Follow naming conventions: `FeatureEvent`, `FeatureState`, `FeatureBloc`
- Use **dart_mappable** annotations for immutable states and events
- Implement error states and loading states
- Use **bloc_test** for testing blocs

### Code Organization
- **Feature-first** folder structure within each layer
- Group related functionality together
- **Mandatory barrel exports** in every folder for clean import structure
- Create `injection_container.dart` in the core layer for DI setup
- Use **shared/common** directories for reusable components across features

### Barrel Export Guidelines
- **Every folder** must contain a barrel export file (typically named after the folder or `exports.dart`)
- **Barrel files** export all files in the current folder and all barrel files from subfolders
- **Import rule**: Files should only import from top-level barrel files, never from individual files
- **Naming convention**: Use descriptive names like `core.dart`, `shared.dart`, `translation.dart`
- **Structure example**:
  ```
  lib/
  ├── rosetta.dart                 # Main app barrel (exports core, features, shared, l10n)
  ├── core.dart                    # Exports all core functionality
  ├── shared.dart                  # Exports all shared functionality
  ├── features.dart                # Exports all feature functionality
  ├── l10n/
  │   └── l10n.dart               # Exports localization functionality
  ├── core/
  │   ├── core.dart               # Exports all core submodules
  │   ├── theme.dart              # Exports all theme files
  │   ├── extensions.dart         # Exports all extension files
  │   └── routing.dart            # Exports all routing files
  ```

### Import Best Practices
- **Top-level imports only**: `import 'package:rosetta/core.dart';`
- **No deep imports**: Never use `import 'package:rosetta/core/theme/app_spacing.dart';`
- **Consistent naming**: Use consistent barrel file names across the project
- **Circular dependency prevention**: Structure barrels to avoid circular imports
- **Selective exports**: Only export what needs to be used outside the module
- Organize blocs by feature with shared components:
  ```
  lib/
  ├── core/
  │   ├── injection_container.dart  # get_it DI setup
  │   ├── constants/
  │   ├── errors/
  │   ├── extensions/             # Context and other extensions
  │   ├── theme/                  # Theme extensions and configuration
  │   │   ├── app_spacing.dart
  │   │   ├── app_radiuses.dart
  │   │   ├── app_sizes.dart
  │   │   ├── app_durations.dart
  │   │   └── app_theme.dart
  │   ├── routing/                # Router configuration
  │   │   └── app_router.dart
  │   └── utils/
  ├── shared/
  │   ├── presentation/
  │   │   ├── widgets/             # Reusable widgets across features
  │   │   │   ├── common_button.dart
  │   │   │   ├── loading_widget.dart
  │   │   │   ├── error_widget.dart
  │   │   │   ├── file_picker_widget.dart
  │   │   │   └── editor_widgets.dart
  │   │   └── bloc/                # Reusable blocs across features
  │   │       ├── theme/
  │   │       ├── file_system/
  │   │       └── settings/
  │   ├── data/
  │   │   ├── dtos/               # Shared data models
  │   │   └── services/           # Common services (file I/O, validation)
  │   └── domain/
  │       ├── entities/           # Shared entities
  │       └── repositories/       # Common repository interfaces
  ├── features/
  │   ├── arb_management/         # ARB file operations
  │   │   ├── data/
  │   │   │   ├── dtos/
  │   │   │   ├── data_sources/
  │   │   │   └── repositories/
  │   │   ├── domain/
  │   │   │   ├── entities/
  │   │   │   ├── repositories/
  │   │   │   └── use_cases/
  │   │   └── presentation/
  │   │       ├── bloc/
  │   │       ├── pages/
  │   │       └── widgets/
  │   ├── translation_editor/     # Translation editing interface
  │   ├── project_management/     # Project/workspace management
  │   ├── validation/            # Translation validation
  │   ├── export_import/         # File export/import
  │   └── analytics/             # Translation analytics
  ```

### Rosetta-Specific Features Structure
```
features/
├── arb_management/             # Core ARB file operations
│   ├── domain/entities/
│   │   ├── arb_file.dart      # ARB file entity
│   │   ├── translation_entry.dart
│   │   └── arb_metadata.dart
│   └── use_cases/
│       ├── parse_arb_file_use_case.dart
│       ├── save_arb_file_use_case.dart
│       └── validate_arb_syntax_use_case.dart
├── translation_editor/         # Translation editing UI
│   ├── domain/entities/
│   │   ├── translation_project.dart
│   │   ├── translation_session.dart
│   │   └── editor_state.dart
│   └── presentation/widgets/
│       ├── translation_table_widget.dart
│       ├── key_editor_widget.dart
│       └── value_editor_widget.dart
├── project_management/         # Project/workspace management
│   ├── domain/entities/
│   │   ├── translation_workspace.dart
│   │   └── project_settings.dart
│   └── use_cases/
│       ├── create_project_use_case.dart
│       └── load_project_use_case.dart
├── validation/                # Translation validation
│   ├── domain/entities/
│   │   ├── validation_rule.dart
│   │   └── validation_result.dart
│   └── use_cases/
│       ├── validate_translations_use_case.dart
│       └── check_missing_keys_use_case.dart
├── export_import/             # File operations
│   └── use_cases/
│       ├── export_to_csv_use_case.dart
│       ├── import_from_csv_use_case.dart
│       └── batch_export_use_case.dart
└── analytics/                 # Translation statistics
    ├── domain/entities/
    │   └── translation_stats.dart
    └── use_cases/
        └── generate_stats_use_case.dart
```

### Shared Components Guidelines
- **Shared Widgets**: Place in `shared/presentation/widgets/` for UI components used across multiple features
  - Examples: FilePickerWidget, EditorToolbar, ValidationIndicator, ProgressDialog
- **Shared Blocs**: Place in `shared/presentation/bloc/` for state management shared across features
  - Examples: ThemeBloc, FileSystemBloc, SettingsBloc, RecentProjectsBloc
- **Shared Models**: Place in `shared/data/dtos/` for data structures used by multiple features
  - Examples: FileMetadata, UserPreferences, AppSettings
- **Shared Services**: Place in `shared/data/services/` for common services
  - Examples: FileService, ValidationService, ExportService, BackupService
- **Shared Entities**: Place in `shared/domain/entities/` for business objects used across features
  - Examples: File entity, User preferences, Validation result
- **Common Repositories**: Place in `shared/domain/repositories/` for repository interfaces used by multiple features
  - Examples: FileRepository interface, SettingsRepository interface

### When to Use Shared vs Feature-Specific

**Use Shared** when:
- Component is used in 2+ features
- Component provides app-wide functionality (theme, file operations, settings)
- Component is a common UI pattern (editors, file browsers, validation indicators)
- Service handles cross-cutting concerns (file I/O, validation, export)

**Keep Feature-Specific** when:
- Component is only used within one feature
- Business logic is tightly coupled to a specific feature
- Widget has feature-specific styling or behavior
- Component may evolve independently of other features

### Naming Conventions
- Use **snake_case** for file names and directories
- Use **camelCase** for variables and methods
- Use **PascalCase** for classes and widgets
- Prefix private members with underscore (_)

## Coding Standards

### Dart/Flutter Best Practices
- Always use `const` constructors when possible
- Prefer composition over inheritance
- Use extension methods for utility functions
- Implement proper error handling with custom exceptions
- Use **dart_mappable** for immutable data classes and JSON serialization
- Use **dart_mappable** annotations (@MappableClass, @MappableEnum) for code generation
- **Never manually implement** `copyWith`, `toMap`, `fromMap`, `==`, `hashCode` when using dart_mappable - these are auto-generated
- Run `dart run build_runner build` to generate dart_mappable code after changes

### Widget Guidelines
- Create small, focused, reusable widgets
- Use `StatelessWidget` unless state is absolutely necessary
- Extract complex widgets into separate files
- Use proper widget keys for performance optimization
- Follow Material Design 3 guidelines with desktop adaptations
- Wrap widgets with BlocProvider when needed
- Use BlocBuilder for reactive UI updates

### Desktop-Specific Considerations
- Design for larger screens and desktop interactions
- Implement keyboard shortcuts for productivity
- Support mouse interactions (hover states, right-click menus)
- Use desktop-appropriate navigation patterns
- Consider multi-window support for advanced workflows
- Optimize for desktop performance (file operations, large datasets)

### Performance Optimization
- Use `ListView.builder()` for large translation lists
- Implement virtual scrolling for large ARB files
- Implement proper disposal of resources (controllers, streams, blocs)
- Use `RepaintBoundary` for expensive widgets
- Optimize file I/O operations with streaming
- Use `const` constructors extensively
- Dispose blocs properly to prevent memory leaks
- Cache parsed ARB data for better performance

### Testing Requirements
- Write unit tests for business logic
- Write bloc tests using **bloc_test** package
- Write widget tests for UI components
- Use **mocktail** for mocking dependencies (preferred over mockito)
- Test all bloc states and events
- Mock get_it dependencies in tests using mocktail
- Test file operations with mock file systems
- Aim for >80% code coverage
- Test error scenarios and edge cases
- Reset get_it container between tests for isolation

### Code Quality
- Follow **very_good_analysis** lint rules for comprehensive code quality
- Use `flutter analyze` to check for issues
- Format code with `dart format`
- Use meaningful variable and function names
- Keep functions small and focused (max 20-30 lines)
- Use single quotes for strings (`prefer_single_quotes`)
- Add trailing commas for better formatting (`require_trailing_commas`)

### Documentation Guidelines
- **Always document**: Public APIs, interfaces, domain entities, complex business logic, file format specifications
- **Never document**: Private methods, implementation details, self-explanatory code
- **Focus on "why" not "what"**: Explain business rules, constraints, and design decisions
- **Use proper Dart doc syntax**: `///` for public members, `//` for internal comments
- **Include examples** for complex APIs and use cases
- **Document parameters**: Use `[paramName]` to reference parameters in descriptions
- **Document exceptions**: Mention what exceptions can be thrown and when
- **Keep docs current**: Update documentation when changing behavior
- **Document ARB format specifics**: Explain ARB structure, metadata, and validation rules

## Localization (l10n) Guidelines

### Setup and Configuration
- Use **flutter_localizations** and **intl** for internationalization
- Enable l10n in `pubspec.yaml` with `generate: true`
- Create `l10n.yaml` configuration file in project root
- Use **ARB files** (Application Resource Bundle) for translations
- Support common languages: English (en), Spanish (es), French (fr), German (de), Russian (ru), Chinese (zh), Japanese (ja), Arabic (ar)

### File Structure
```
lib/
├── l10n/
│   ├── app_en.arb          # English (default)
│   ├── app_es.arb          # Spanish
│   ├── app_fr.arb          # French
│   ├── app_de.arb          # German
│   ├── app_ru.arb          # Russian
│   ├── app_zh.arb          # Chinese
│   ├── app_ja.arb          # Japanese
│   └── app_ar.arb          # Arabic
```

### Translation Key Naming Convention
Use structured naming: `<feature><component><descriptor>`

**Examples**:
- `arbManagementFileButtonOpen` - ARB management feature, file component, open button
- `translationEditorTableHeaderKey` - Translation editor feature, table component, key header
- `projectManagementDialogTitleCreate` - Project management feature, dialog component, create title
- `validationResultMessageMissingKeys` - Validation feature, result component, missing keys message
- `commonButtonSave` - Common/shared, button component, save action

**Component Types**:
- `Button` - Interactive buttons
- `Label` - Text labels for fields
- `Title` - Section/page titles
- `Header` - Table/list headers
- `Message` - User feedback messages
- `Description` - Explanatory text
- `Error` - Error messages
- `Dialog` - Dialog titles and content
- `Menu` - Menu items and labels
- `Status` - Status indicators

**Feature Prefixes**:
- `arbManagement` - ARB file operations
- `translationEditor` - Translation editing interface
- `projectManagement` - Project/workspace management
- `validation` - Translation validation
- `exportImport` - File export/import operations
- `analytics` - Translation analytics
- `settings` - App settings
- `navigation` - Navigation elements
- `common` - Shared/reusable elements

### ARB File Guidelines
- Include `@@locale` metadata in each ARB file
- Add descriptions for translators using `@key` metadata
- Use placeholders for dynamic content: `{fileName}`
- Support plural forms with ICU syntax
- Include context information for better translations

### Code Implementation
- Access translations via `context.l10n` extension method (instead of `AppLocalizations.of(context)`)
- Create extension: `extension L10nExtension on BuildContext { AppLocalizations get l10n => AppLocalizations.of(this)!; }`
- Use `Localizations.localeOf(context)` to get current locale
- Implement locale switching in app settings
- Handle missing translations gracefully with fallbacks
- Use `Intl` package for date/number formatting

## Theming Guidelines

### Theme Structure
- Support **light and dark themes** using default Flutter `ThemeData`
- Use default Material 3 color schemes from `ThemeData.light()` and `ThemeData.dark()`
- Create custom **ThemeExtensions** for spacing, radiuses, and other design tokens
- Access theme extensions via context extensions for clean API
- Consider high contrast themes for accessibility

### Desktop Theme Adaptations
- Adjust spacing and sizing for desktop interfaces
- Use appropriate typography scales for desktop reading
- Consider multi-window theming consistency
- Support platform-specific theme preferences

### ThemeExtension Implementation
- Create separate ThemeExtension classes for different design aspects:
  - `AppSpacing` - for margins, paddings, gaps
  - `AppRadiuses` - for border radiuses
  - `AppSizes` - for component sizes
  - `AppDurations` - for animation durations
- Use consistent naming conventions for design tokens

### Theme Access Pattern
- Access theme extensions via context extensions:
```dart
// In core/extensions/context_extensions.dart
extension ThemeExtensions on BuildContext {
  AppSpacing get spacing => Theme.of(this).extension<AppSpacing>()!;
  AppRadiuses get radiuses => Theme.of(this).extension<AppRadiuses>()!;
  AppSizes get sizes => Theme.of(this).extension<AppSizes>()!;
  AppDurations get durations => Theme.of(this).extension<AppDurations>()!;
}
```

## Routing Guidelines

### Router Configuration
- Use **go_router** as the primary routing solution
- Configure declarative routing with route definitions
- Implement type-safe navigation with custom route classes
- Use nested routing for complex navigation flows
- Handle deep linking and URL-based navigation
- Support desktop navigation patterns (tabs, multiple windows)

### Navigation Pattern
- Use context extensions for clean navigation:
```dart
// In core/extensions/context_extensions.dart
extension NavigationExtensions on BuildContext {
  void goTo(String path) => GoRouter.of(this).go(path);
  void pushTo(String path) => GoRouter.of(this).push(path);
  void pop() => GoRouter.of(this).pop();
}
```

## File Operations Guidelines

### ARB File Handling
- Parse ARB files with proper error handling
- Validate ARB syntax and structure
- Support large ARB files with efficient parsing
- Implement file watching for external changes
- Handle file encoding (UTF-8) properly
- Support backup and recovery mechanisms

### File System Integration
- Use proper file paths for cross-platform compatibility
- Implement recent files/projects functionality
- Support drag-and-drop file operations
- Handle file permissions and access rights
- Implement auto-save functionality
- Support project templates and presets

## Dependencies Management
- Prefer official Flutter packages
- Use version pinning for stability
- Document why each dependency is needed
- Regular dependency updates and security checks
- Required packages:
  - `flutter_bloc` - State management
  - `bloc` - Core bloc library
  - `get_it` - Dependency injection
  - `dart_mappable` - Immutable classes and JSON serialization
  - `go_router` - Declarative routing
  - `flutter_localizations` - Localization support
  - `intl` - Internationalization utilities
  - `file_picker` - File selection dialogs
  - `path_provider` - File system paths
  - `path` - Path manipulation utilities
  - `watcher` - File system monitoring
  - `csv` - CSV export/import functionality
  - `dart_mappable_builder` - Code generation (dev dependency)
  - `bloc_test` - Bloc testing (dev dependency)
  - `mocktail` - Mocking for tests (dev dependency)

## Platform-Specific Guidelines

### Desktop Platforms (Primary Focus)

#### macOS
- Follow macOS Human Interface Guidelines
- Implement native macOS menu bars
- Support macOS file dialogs and operations
- Handle macOS-specific keyboard shortcuts
- Integrate with macOS file associations

#### Windows
- Follow Microsoft Fluent Design principles
- Implement Windows-style file operations
- Support Windows keyboard shortcuts
- Handle Windows file system quirks
- Consider Windows-specific accessibility features

#### Linux
- Support various Linux desktop environments
- Handle different file managers and dialogs
- Consider Linux-specific keyboard shortcuts
- Support various Linux distributions

#### Mobile (Secondary Support)

##### iOS
- Adapt desktop UI for mobile constraints
- Use Cupertino widgets when appropriate
- Handle iOS file sharing limitations
- Consider iOS document provider integration

##### Android
- Follow Material Design guidelines for mobile
- Handle Android file system access
- Support Android share functionality
- Consider Android storage permissions

## Validation and Quality Assurance

### ARB Validation Rules
- Check for missing translation keys across locales
- Validate placeholder consistency
- Verify ICU message format syntax
- Check for duplicate keys
- Validate metadata completeness
- Ensure proper JSON syntax

### Translation Quality Checks
- Check for empty translations
- Validate placeholder usage
- Detect potentially problematic characters
- Check translation length constraints
- Validate formatting consistency

## Error Handling

### File Operation Errors
- Handle file not found errors gracefully
- Provide meaningful error messages for file format issues
- Implement retry mechanisms for transient failures
- Log file operation errors for debugging
- Provide user-friendly error recovery options

### Validation Errors
- Clearly communicate validation failures
- Provide suggestions for fixing validation errors
- Allow partial saves with warnings
- Implement error highlighting in editors

## Security Guidelines
- Validate all file inputs to prevent injection attacks
- Handle untrusted ARB files safely
- Implement proper file access controls
- Avoid executing dynamic code from ARB files
- Sanitize user inputs in translation values

## Performance Guidelines
- Implement lazy loading for large translation projects
- Use efficient data structures for translation storage
- Optimize search and filter operations
- Implement pagination for large translation lists
- Cache parsed data appropriately
- Use background processing for heavy operations

## Accessibility Guidelines
- Support screen readers for all UI elements
- Implement proper keyboard navigation
- Provide high contrast theme options
- Support font scaling preferences
- Add meaningful semantic labels
- Ensure proper focus management

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
