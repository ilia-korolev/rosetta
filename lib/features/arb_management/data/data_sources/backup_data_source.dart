// Backup data source

import 'dart:io';

import 'package:path/path.dart' as p;

/// Responsible for low-level backup operations
abstract class BackupDataSource {
  Future<void> createBackup(String filePath);
}

class BackupDataSourceImpl implements BackupDataSource {
  const BackupDataSourceImpl();

  @override
  Future<void> createBackup(String filePath) async {
    try {
      final file = File(filePath);
      if (!await file.exists()) return;
      final directory = file.parent;
      final fileName = p.basenameWithoutExtension(file.path);
      final extension = p.extension(file.path);
      final timestamp = DateTime.now().toIso8601String().replaceAll(':', '-');
      final backupName = '${fileName}_backup_$timestamp$extension';
      final backupPath = p.join(directory.path, backupName);
      await file.copy(backupPath);
    } catch (_) {
      // Swallow backup errors intentionally
    }
  }
}
