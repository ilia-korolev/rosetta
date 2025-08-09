/// A validation suggestion
class ValidationSuggestion {
  const ValidationSuggestion({
    required this.message,
    required this.code,
    this.entryKey,
    this.autoFixAvailable = false,
  });

  /// Suggestion message
  final String message;

  /// Suggestion code
  final String code;

  /// Entry key related to the suggestion
  final String? entryKey;

  /// Whether automatic fix is available
  final bool autoFixAvailable;
}
