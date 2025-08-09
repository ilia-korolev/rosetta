import 'arb_entry.dart';
import 'validation_error.dart';
import 'validation_result.dart';

/// Result of ICU syntax validation
class IcuValidationResult extends ValidationResult {
  const IcuValidationResult({
    required super.isValid,
    required this.entry,
    super.errors = const [],
    super.warnings = const [],
    super.suggestions = const [],
  });

  /// The ARB entry that was validated
  final ArbEntry entry;

  /// Whether the entry can be safely used
  bool get canBeUsed => !hasCriticalIssues;

  /// Get issues specific to ICU syntax
  List<ValidationError> get icuSyntaxErrors {
    return errors
        .where(
          (e) =>
              e.code.startsWith('INVALID_') ||
              e.code.startsWith('MISSING_') ||
              e.code.startsWith('UNMATCHED_'),
        )
        .toList();
  }

  /// Get placeholder-related issues
  List<ValidationError> get placeholderErrors {
    return errors.where((e) => e.code.contains('PLACEHOLDER')).toList();
  }
}
