import '../entities/arb_file.dart';

/// Repository interface for ARB file operations
abstract class ArbFileRepository {
  /// Import an ARB file from the given path
  Future<ArbFile> importFromFile(String filePath);

  /// Import multiple ARB files
  Future<Map<String, ArbFile>> importMultipleFiles(List<String> filePaths);

  /// Save an ARB file to the given path
  Future<void> saveToFile(ArbFile file, String filePath);

  /// Save multiple ARB files
  Future<void> saveMultipleFiles(Map<String, ArbFile> files);

  /// Export ARB file to different formats (ARB, JSON, CSV, XLSX)
  Future<void> exportFile(ArbFile file, String outputPath, String format);

  /// Export multiple files with compression
  Future<void> exportMultipleFiles(
    Map<String, ArbFile> files,
    String outputPath,
    String format, {
    bool compress = false,
  });

  /// Validate ARB file format and syntax
  Future<ValidationResult> validateArbFile(ArbFile file);

  /// Watch for file changes (for auto-reload)
  Stream<String> watchFile(String filePath);

  /// Get recent files list
  Future<List<String>> getRecentFiles();

  /// Add file to recent files
  Future<void> addToRecentFiles(String filePath);

  /// Create backup of file before saving
  Future<void> createBackup(String filePath);
}

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
