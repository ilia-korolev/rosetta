/// Information about a validation issue
class ValidationIssueInfo {
  const ValidationIssueInfo({
    required this.fileLocale,
    required this.entryKey,
    required this.message,
    required this.code,
    required this.isError,
    this.suggestion,
  });

  final String fileLocale;
  final String entryKey;
  final String message;
  final String code;
  final bool isError;
  final String? suggestion;
}
