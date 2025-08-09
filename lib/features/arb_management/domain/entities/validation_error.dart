/// A validation error
class ValidationError {
  const ValidationError({
    required this.message,
    required this.code,
    this.line,
    this.column,
    this.entryKey,
    this.suggestion,
  });

  /// Error message
  final String message;

  /// Error code for programmatic handling
  final String code;

  /// Line number where error occurs
  final int? line;

  /// Column number where error occurs
  final int? column;

  /// Entry key related to the error
  final String? entryKey;

  /// Suggestion to fix the error
  final String? suggestion;
}
