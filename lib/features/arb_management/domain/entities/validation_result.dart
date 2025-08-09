import 'package:rosetta/features/features.dart';

/// Validation result for ARB operations
class ValidationResult {
  const ValidationResult({
    required this.isValid,
    this.errors = const [],
    this.warnings = const [],
    this.suggestions = const [],
  });

  /// Whether the validation passed
  final bool isValid;

  /// Critical errors that prevent operation
  final List<ValidationError> errors;

  /// Non-critical warnings
  final List<ValidationWarning> warnings;

  /// Suggestions for improvement
  final List<ValidationSuggestion> suggestions;

  /// Whether there are any issues
  bool get hasIssues => errors.isNotEmpty || warnings.isNotEmpty;

  /// Whether there are critical issues
  bool get hasCriticalIssues => errors.isNotEmpty;
}
