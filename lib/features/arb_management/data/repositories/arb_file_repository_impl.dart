import 'package:rosetta/features/features.dart';

/// Implementation of ARB file repository
class ArbFileRepositoryImpl implements ArbFileRepository {
  const ArbFileRepositoryImpl(
    this._dataSource,
    this._recentFilesDataSource,
    this._backupDataSource,
  );

  final ArbFileDataSource _dataSource;
  final RecentFilesDataSource _recentFilesDataSource;
  final BackupDataSource _backupDataSource;

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
    await _backupDataSource.createBackup(filePath);
  }
}
