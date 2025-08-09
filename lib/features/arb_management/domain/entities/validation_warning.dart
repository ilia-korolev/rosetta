/// A validation warning
class ValidationWarning {
  const ValidationWarning({
    required this.message,
    required this.code,
    this.entryKey,
    this.suggestion,
  });

  /// Warning message
  final String message;

  /// Warning code
  final String code;

  /// Entry key related to the warning
  final String? entryKey;

  /// Suggestion to address the warning
  final String? suggestion;
}
