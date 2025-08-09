import 'dart:convert';
import 'dart:io';
import 'package:path/path.dart' as path;

import '../../domain/entities/arb_file.dart';
import '../../domain/entities/arb_entry.dart';
import '../../domain/entities/validation_error.dart';
import '../../domain/entities/validation_result.dart';
import '../../domain/entities/validation_suggestion.dart';
import '../../domain/entities/validation_warning.dart';
import '../dtos/arb_file_dto.dart';

/// Data source for ARB file operations
class ArbFileDataSource {
  const ArbFileDataSource();

  /// Import an ARB file from the file system
  Future<ArbFile> importFromFile(String filePath) async {
    try {
      final file = File(filePath);

      if (!await file.exists()) {
        throw FileSystemException('File not found', filePath);
      }

      final content = await file.readAsString(encoding: utf8);
      final arbDto = ArbFileDto.fromJson(content, filePath);

      return arbDto.toDomain();
    } catch (e) {
      throw ArbImportException('Failed to import ARB file: $e', filePath);
    }
  }

  /// Import multiple ARB files
  Future<Map<String, ArbFile>> importMultipleFiles(
    List<String> filePaths,
  ) async {
    final files = <String, ArbFile>{};
    final errors = <String, String>{};

    for (final filePath in filePaths) {
      try {
        final arbFile = await importFromFile(filePath);
        files[arbFile.locale] = arbFile;
      } catch (e) {
        errors[filePath] = e.toString();
      }
    }

    if (errors.isNotEmpty && files.isEmpty) {
      throw ArbImportException(
        'Failed to import any files: ${errors.values.join(', ')}',
        filePaths.first,
      );
    }

    return files;
  }

  /// Save an ARB file to the file system
  Future<void> saveToFile(ArbFile file, String filePath) async {
    try {
      final arbDto = ArbFileDto.fromDomain(file);
      final jsonContent = arbDto.toJsonString();

      final outputFile = File(filePath);

      // Create directory if it doesn't exist
      await outputFile.parent.create(recursive: true);

      // Create backup if file exists
      if (await outputFile.exists()) {
        await _createBackup(filePath);
      }

      await outputFile.writeAsString(jsonContent, encoding: utf8);
    } catch (e) {
      throw ArbSaveException('Failed to save ARB file: $e', filePath);
    }
  }

  /// Save multiple ARB files
  Future<void> saveMultipleFiles(Map<String, ArbFile> files) async {
    final errors = <String, String>{};

    for (final entry in files.entries) {
      try {
        await saveToFile(entry.value, entry.value.filePath);
      } catch (e) {
        errors[entry.key] = e.toString();
      }
    }

    if (errors.isNotEmpty) {
      throw ArbSaveException(
        'Failed to save some files: ${errors.values.join(', ')}',
        errors.keys.first,
      );
    }
  }

  /// Export ARB file to different formats
  Future<void> exportFile(
    ArbFile file,
    String outputPath,
    String format,
  ) async {
    switch (format.toLowerCase()) {
      case 'arb':
        await saveToFile(file, outputPath);
        break;
      case 'json':
        await _exportToJson(file, outputPath);
        break;
      case 'csv':
        await _exportToCsv(file, outputPath);
        break;
      case 'xlsx':
        await _exportToXlsx(file, outputPath);
        break;
      default:
        throw UnsupportedError('Export format $format is not supported');
    }
  }

  /// Export multiple files with optional compression
  Future<void> exportMultipleFiles(
    Map<String, ArbFile> files,
    String outputPath,
    String format, {
    bool compress = false,
  }) async {
    if (compress) {
      await _exportCompressed(files, outputPath, format);
    } else {
      for (final entry in files.entries) {
        final fileName = '${entry.key}.$format';
        final filePath = path.join(outputPath, fileName);
        await exportFile(entry.value, filePath, format);
      }
    }
  }

  /// Validate ARB file format and syntax
  Future<ValidationResult> validateArbFile(ArbFile file) async {
    final errors = <ValidationError>[];
    final warnings = <ValidationWarning>[];
    final suggestions = <ValidationSuggestion>[];

    // Check file structure
    if (file.entries.isEmpty) {
      warnings.add(
        ValidationWarning(
          message: 'ARB file is empty',
          code: 'EMPTY_FILE',
          suggestion: 'Add at least one translation entry',
        ),
      );
    }

    // Check locale metadata
    if (file.metadata.locale.isEmpty) {
      errors.add(
        ValidationError(
          message: 'Missing locale metadata',
          code: 'MISSING_LOCALE',
          suggestion: 'Add @@locale metadata to the ARB file',
        ),
      );
    }

    // Validate each entry
    for (final entry in file.entries.values) {
      await _validateEntry(entry, errors, warnings, suggestions);
    }

    return ValidationResult(
      isValid: errors.isEmpty,
      errors: errors,
      warnings: warnings,
      suggestions: suggestions,
    );
  }

  /// Watch for file changes
  Stream<String> watchFile(String filePath) {
    final file = File(filePath);
    final directory = file.parent;

    return directory
        .watch()
        .where(
          (event) =>
              event.path == filePath && event.type == FileSystemEvent.modify,
        )
        .map((event) => event.path);
  }

  /// Create backup of existing file
  Future<void> _createBackup(String filePath) async {
    final file = File(filePath);
    if (await file.exists()) {
      final timestamp = DateTime.now().millisecondsSinceEpoch;
      final backupPath = '$filePath.backup.$timestamp';
      await file.copy(backupPath);
    }
  }

  /// Export to JSON format
  Future<void> _exportToJson(ArbFile file, String outputPath) async {
    final data = <String, dynamic>{};

    // Add metadata
    data['@@locale'] = file.locale;
    if (file.metadata.context != null) {
      data['@@context'] = file.metadata.context;
    }

    // Add entries
    for (final entry in file.entries.values) {
      data[entry.key] = entry.value;

      // Add metadata for this entry
      if (entry.metadata != null) {
        data['@${entry.key}'] = {
          if (entry.metadata!.description != null)
            'description': entry.metadata!.description,
          if (entry.placeholders != null && entry.placeholders!.isNotEmpty)
            'placeholders': entry.placeholders!.map(
              (key, placeholder) => MapEntry(key, {
                'type': placeholder.type.typeName,
                if (placeholder.format != null) 'format': placeholder.format,
                if (placeholder.optionalParameters != null)
                  'optionalParameters': placeholder.optionalParameters,
              }),
            ),
        };
      }
    }

    final jsonString = const JsonEncoder.withIndent('  ').convert(data);
    await File(outputPath).writeAsString(jsonString, encoding: utf8);
  }

  /// Export to CSV format
  Future<void> _exportToCsv(ArbFile file, String outputPath) async {
    final lines = <String>[];

    // Header
    lines.add('Key,Value,Description,Type,Placeholders');

    // Data rows
    for (final entry in file.entries.values) {
      final description = entry.metadata?.description ?? '';
      final type = entry.type.name;
      final placeholders = entry.placeholderNames.join(';');

      lines.add(
        '"${entry.key}","${_escapeCsv(entry.value)}","$description","$type","$placeholders"',
      );
    }

    await File(outputPath).writeAsString(lines.join('\n'), encoding: utf8);
  }

  /// Export to XLSX format (simplified implementation)
  Future<void> _exportToXlsx(ArbFile file, String outputPath) async {
    // For a full implementation, you would use a package like excel
    // For now, we'll export as CSV with .xlsx extension
    await _exportToCsv(file, outputPath.replaceAll('.xlsx', '.csv'));
  }

  /// Export multiple files compressed
  Future<void> _exportCompressed(
    Map<String, ArbFile> files,
    String outputPath,
    String format,
  ) async {
    // For a full implementation, you would use archive package
    // For now, we'll just export to a directory
    final directory = Directory(outputPath);
    if (!await directory.exists()) {
      await directory.create(recursive: true);
    }

    for (final entry in files.entries) {
      final fileName = '${entry.key}.$format';
      final filePath = path.join(outputPath, fileName);
      await exportFile(entry.value, filePath, format);
    }
  }

  /// Validate a single ARB entry
  Future<void> _validateEntry(
    ArbEntry entry,
    List<ValidationError> errors,
    List<ValidationWarning> warnings,
    List<ValidationSuggestion> suggestions,
  ) async {
    // Check for empty values
    if (entry.value.isEmpty) {
      warnings.add(
        ValidationWarning(
          message: 'Entry "${entry.key}" has empty value',
          code: 'EMPTY_VALUE',
          entryKey: entry.key,
          suggestion: 'Provide a translation for this entry',
        ),
      );
    }

    // Check for invalid characters
    if (entry.value.contains('\t')) {
      warnings.add(
        ValidationWarning(
          message: 'Entry "${entry.key}" contains tab characters',
          code: 'TAB_CHARACTERS',
          entryKey: entry.key,
          suggestion: 'Replace tabs with spaces',
        ),
      );
    }

    // Check placeholder consistency
    if (entry.hasPlaceholders) {
      final messageePlaceholders = RegExp(
        r'\{(\w+)\}',
      ).allMatches(entry.value).map((m) => m.group(1)!).toSet();

      final metadataPlaceholders =
          entry.placeholders?.keys.toSet() ?? <String>{};

      // Check for missing metadata
      for (final placeholder in messageePlaceholders) {
        if (!metadataPlaceholders.contains(placeholder)) {
          warnings.add(
            ValidationWarning(
              message:
                  'Placeholder "{$placeholder}" used but not defined in metadata',
              code: 'UNDEFINED_PLACEHOLDER',
              entryKey: entry.key,
              suggestion: 'Add metadata for placeholder "$placeholder"',
            ),
          );
        }
      }
    }

    // Check ICU message syntax for plural/select entries
    if (entry.isPlural || entry.isSelect) {
      if (!entry.hasRequiredOtherCase) {
        errors.add(
          ValidationError(
            message: 'ICU message missing required "other" case',
            code: 'MISSING_OTHER_CASE',
            entryKey: entry.key,
            suggestion: 'Add "other{...}" case to the message',
          ),
        );
      }
    }
  }

  /// Escape CSV value
  String _escapeCsv(String value) {
    return value.replaceAll('"', '""');
  }
}

/// Exception thrown when ARB import fails
class ArbImportException implements Exception {
  const ArbImportException(this.message, this.filePath);

  final String message;
  final String filePath;

  @override
  String toString() => 'ArbImportException: $message (file: $filePath)';
}

/// Exception thrown when ARB save fails
class ArbSaveException implements Exception {
  const ArbSaveException(this.message, this.filePath);

  final String message;
  final String filePath;

  @override
  String toString() => 'ArbSaveException: $message (file: $filePath)';
}
