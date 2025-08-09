import '../entities/arb_file.dart';
import '../entities/validation_result.dart';
import '../repositories/arb_file_repository.dart';

/// Use case for importing ARB files
class ImportArbFileUseCase {
  const ImportArbFileUseCase(this._repository);

  final ArbFileRepository _repository;

  /// Import a single ARB file
  Future<ImportResult> call(String filePath) async {
    try {
      // Validate file path
      if (filePath.isEmpty) {
        return ImportResult.failure('File path cannot be empty');
      }

      if (!filePath.toLowerCase().endsWith('.arb')) {
        return ImportResult.failure('File must have .arb extension');
      }

      // Import the file
      final arbFile = await _repository.importFromFile(filePath);

      // Validate the imported file
      final validationResult = await _repository.validateArbFile(arbFile);

      // Add to recent files if import was successful
      await _repository.addToRecentFiles(filePath);

      return ImportResult.success(
        file: arbFile,
        validationResult: validationResult,
      );
    } catch (e) {
      return ImportResult.failure('Failed to import file: $e');
    }
  }

  /// Import multiple ARB files
  Future<MultipleImportResult> importMultiple(List<String> filePaths) async {
    try {
      // Validate file paths
      if (filePaths.isEmpty) {
        return MultipleImportResult.failure('No files selected');
      }

      final invalidPaths = filePaths
          .where((path) => path.isEmpty || !path.toLowerCase().endsWith('.arb'))
          .toList();

      if (invalidPaths.isNotEmpty) {
        return MultipleImportResult.failure(
          'Invalid file paths: ${invalidPaths.join(', ')}',
        );
      }

      // Import all files
      final files = await _repository.importMultipleFiles(filePaths);

      // Validate all files
      final validationResults = <String, ValidationResult>{};
      for (final entry in files.entries) {
        validationResults[entry.key] = await _repository.validateArbFile(
          entry.value,
        );
      }

      // Add all files to recent files
      for (final filePath in filePaths) {
        await _repository.addToRecentFiles(filePath);
      }

      return MultipleImportResult.success(
        files: files,
        validationResults: validationResults,
      );
    } catch (e) {
      return MultipleImportResult.failure('Failed to import files: $e');
    }
  }

  /// Get recent files
  Future<List<String>> getRecentFiles() async {
    return _repository.getRecentFiles();
  }
}

/// Result of importing a single ARB file
class ImportResult {
  const ImportResult._({
    required this.isSuccess,
    this.file,
    this.validationResult,
    this.errorMessage,
  });

  /// Whether the import was successful
  final bool isSuccess;

  /// The imported file (if successful)
  final ArbFile? file;

  /// Validation result for the imported file
  final ValidationResult? validationResult;

  /// Error message (if failed)
  final String? errorMessage;

  /// Create a successful import result
  factory ImportResult.success({
    required ArbFile file,
    required ValidationResult validationResult,
  }) {
    return ImportResult._(
      isSuccess: true,
      file: file,
      validationResult: validationResult,
    );
  }

  /// Create a failed import result
  factory ImportResult.failure(String errorMessage) {
    return ImportResult._(isSuccess: false, errorMessage: errorMessage);
  }

  /// Whether the imported file has validation issues
  bool get hasValidationIssues => validationResult?.hasIssues ?? false;

  /// Whether the imported file has critical validation issues
  bool get hasCriticalIssues => validationResult?.hasCriticalIssues ?? false;
}

/// Result of importing multiple ARB files
class MultipleImportResult {
  const MultipleImportResult._({
    required this.isSuccess,
    this.files,
    this.validationResults,
    this.errorMessage,
  });

  /// Whether the import was successful
  final bool isSuccess;

  /// The imported files (if successful)
  final Map<String, ArbFile>? files;

  /// Validation results for each file
  final Map<String, ValidationResult>? validationResults;

  /// Error message (if failed)
  final String? errorMessage;

  /// Create a successful import result
  factory MultipleImportResult.success({
    required Map<String, ArbFile> files,
    required Map<String, ValidationResult> validationResults,
  }) {
    return MultipleImportResult._(
      isSuccess: true,
      files: files,
      validationResults: validationResults,
    );
  }

  /// Create a failed import result
  factory MultipleImportResult.failure(String errorMessage) {
    return MultipleImportResult._(isSuccess: false, errorMessage: errorMessage);
  }

  /// Get files with validation issues
  Map<String, ValidationResult> get filesWithIssues {
    if (validationResults == null) return {};
    return Map.fromEntries(
      validationResults!.entries.where((entry) => entry.value.hasIssues),
    );
  }

  /// Get files with critical validation issues
  Map<String, ValidationResult> get filesWithCriticalIssues {
    if (validationResults == null) return {};
    return Map.fromEntries(
      validationResults!.entries.where(
        (entry) => entry.value.hasCriticalIssues,
      ),
    );
  }

  /// Total number of imported files
  int get totalFiles => files?.length ?? 0;

  /// Number of files with issues
  int get filesWithIssuesCount => filesWithIssues.length;

  /// Number of files with critical issues
  int get filesWithCriticalIssuesCount => filesWithCriticalIssues.length;
}
