import 'dart:io';
import 'package:rosetta/core/core.dart';

/// Data source for managing recent files
abstract class RecentFilesDataSource {
  /// Get the list of recent files
  Future<List<String>> getRecentFiles();

  /// Add a file to the recent files list
  Future<void> addRecentFile(String filePath);

  /// Remove a file from the recent files list
  Future<void> removeRecentFile(String filePath);

  /// Clear all recent files
  Future<void> clearRecentFiles();
}

/// Implementation of recent files data source using preferences
class RecentFilesDataSourceImpl implements RecentFilesDataSource {
  const RecentFilesDataSourceImpl(this._preferencesDataSource);

  final PreferencesDataSource _preferencesDataSource;

  static const String _recentFilesKey = 'recent_arb_files';
  static const int _maxRecentFiles = 10;

  @override
  Future<List<String>> getRecentFiles() async {
    try {
      final recentFiles =
          await _preferencesDataSource.getStringList(_recentFilesKey) ??
          <String>[];

      // Filter out files that no longer exist
      final existingFiles = <String>[];
      for (final filePath in recentFiles) {
        if (await File(filePath).exists()) {
          existingFiles.add(filePath);
        }
      }

      // Update preferences if some files were removed
      if (existingFiles.length != recentFiles.length) {
        await _preferencesDataSource.setStringList(
          _recentFilesKey,
          existingFiles,
        );
      }

      return existingFiles;
    } catch (e) {
      return <String>[];
    }
  }

  @override
  Future<void> addRecentFile(String filePath) async {
    try {
      final recentFiles =
          await _preferencesDataSource.getStringList(_recentFilesKey) ??
          <String>[];

      // Remove if already exists to avoid duplicates
      recentFiles.remove(filePath);

      // Add to the beginning
      recentFiles.insert(0, filePath);

      // Keep only the maximum number of recent files
      if (recentFiles.length > _maxRecentFiles) {
        recentFiles.removeRange(_maxRecentFiles, recentFiles.length);
      }

      await _preferencesDataSource.setStringList(_recentFilesKey, recentFiles);
    } catch (e) {
      // Ignore errors when adding recent files
    }
  }

  @override
  Future<void> removeRecentFile(String filePath) async {
    try {
      final recentFiles =
          await _preferencesDataSource.getStringList(_recentFilesKey) ??
          <String>[];
      recentFiles.remove(filePath);
      await _preferencesDataSource.setStringList(_recentFilesKey, recentFiles);
    } catch (e) {
      // Ignore errors when removing recent files
    }
  }

  @override
  Future<void> clearRecentFiles() async {
    try {
      await _preferencesDataSource.setStringList(_recentFilesKey, <String>[]);
    } catch (e) {
      // Ignore errors when clearing recent files
    }
  }
}
