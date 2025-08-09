import 'dart:io';
import 'package:path/path.dart' as path;

import '../../domain/entities/arb_file.dart';
import '../../domain/entities/validation_result.dart';
import '../../domain/repositories/arb_file_repository.dart';
import '../data_sources/arb_file_data_source.dart';
import '../data_sources/recent_files_data_source.dart';

/// Implementation of ARB file repository
class ArbFileRepositoryImpl implements ArbFileRepository {
  const ArbFileRepositoryImpl(this._dataSource, this._recentFilesDataSource);

  final ArbFileDataSource _dataSource;
  final RecentFilesDataSource _recentFilesDataSource;

  @override
  Future<ArbFile> importFromFile(String filePath) async {
    return _dataSource.importFromFile(filePath);
  }

  @override
  Future<Map<String, ArbFile>> importMultipleFiles(
    List<String> filePaths,
  ) async {
    return _dataSource.importMultipleFiles(filePaths);
  }

  @override
  Future<void> saveToFile(ArbFile file, String filePath) async {
    await _dataSource.saveToFile(file, filePath);
  }

  @override
  Future<void> saveMultipleFiles(Map<String, ArbFile> files) async {
    await _dataSource.saveMultipleFiles(files);
  }

  @override
  Future<void> exportFile(
    ArbFile file,
    String outputPath,
    String format,
  ) async {
    await _dataSource.exportFile(file, outputPath, format);
  }

  @override
  Future<void> exportMultipleFiles(
    Map<String, ArbFile> files,
    String outputPath,
    String format, {
    bool compress = false,
  }) async {
    await _dataSource.exportMultipleFiles(
      files,
      outputPath,
      format,
      compress: compress,
    );
  }

  @override
  Future<ValidationResult> validateArbFile(ArbFile file) async {
    return _dataSource.validateArbFile(file);
  }

  @override
  Stream<String> watchFile(String filePath) {
    return _dataSource.watchFile(filePath);
  }

  @override
  Future<List<String>> getRecentFiles() async {
    return _recentFilesDataSource.getRecentFiles();
  }

  @override
  Future<void> addToRecentFiles(String filePath) async {
    await _recentFilesDataSource.addRecentFile(filePath);
  }

  @override
  Future<void> createBackup(String filePath) async {
    try {
      final file = File(filePath);
      if (!await file.exists()) return;

      final fileDir = file.parent;
      final fileName = path.basenameWithoutExtension(file.path);
      final fileExtension = path.extension(file.path);
      final timestamp = DateTime.now().toIso8601String().replaceAll(':', '-');

      final backupFileName = '${fileName}_backup_$timestamp$fileExtension';
      final backupPath = path.join(fileDir.path, backupFileName);

      await file.copy(backupPath);
    } catch (e) {
      // Ignore backup errors - they shouldn't prevent normal operation
    }
  }
}
