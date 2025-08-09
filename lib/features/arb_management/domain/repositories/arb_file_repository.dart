import 'package:rosetta/features/features.dart';

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
