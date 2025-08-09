import '../../domain/entities/arb_file.dart';
import '../../domain/repositories/arb_file_repository.dart';
import '../data_sources/arb_file_data_source.dart';

/// Implementation of ARB file repository
class ArbFileRepositoryImpl implements ArbFileRepository {
  const ArbFileRepositoryImpl(this._dataSource);

  final ArbFileDataSource _dataSource;

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
    // TODO: Implement recent files storage (SharedPreferences, etc.)
    return <String>[];
  }

  @override
  Future<void> addToRecentFiles(String filePath) async {
    // TODO: Implement recent files storage
  }

  @override
  Future<void> createBackup(String filePath) async {
    // TODO: Implement backup creation
  }
}
