import '../../../../core/data_sources/preferences_data_source.dart';

/// Data source for managing auto-save preferences
abstract class AutoSavePreferencesDataSource {
  /// Get the auto-save interval in minutes
  Future<int?> getAutoSaveIntervalMinutes();

  /// Set the auto-save interval in minutes
  Future<void> setAutoSaveIntervalMinutes(int minutes);

  /// Get whether auto-save is enabled
  Future<bool> isAutoSaveEnabled();

  /// Set whether auto-save is enabled
  Future<void> setAutoSaveEnabled(bool enabled);
}

/// Implementation of auto-save preferences data source
class AutoSavePreferencesDataSourceImpl
    implements AutoSavePreferencesDataSource {
  const AutoSavePreferencesDataSourceImpl(this._preferencesDataSource);

  final PreferencesDataSource _preferencesDataSource;

  static const String _autoSaveIntervalKey = 'auto_save_interval_minutes';
  static const String _autoSaveEnabledKey = 'auto_save_enabled';
  static const int _defaultAutoSaveInterval = 5; // 5 minutes

  @override
  Future<int?> getAutoSaveIntervalMinutes() async {
    try {
      final minutes = await _preferencesDataSource.getInt(_autoSaveIntervalKey);
      return minutes ?? _defaultAutoSaveInterval;
    } catch (e) {
      return _defaultAutoSaveInterval;
    }
  }

  @override
  Future<void> setAutoSaveIntervalMinutes(int minutes) async {
    try {
      await _preferencesDataSource.setInt(_autoSaveIntervalKey, minutes);
    } catch (e) {
      // Ignore errors when setting preferences
    }
  }

  @override
  Future<bool> isAutoSaveEnabled() async {
    try {
      final enabled = await _preferencesDataSource.getBool(_autoSaveEnabledKey);
      return enabled ?? true; // Default to enabled
    } catch (e) {
      return true;
    }
  }

  @override
  Future<void> setAutoSaveEnabled(bool enabled) async {
    try {
      await _preferencesDataSource.setBool(_autoSaveEnabledKey, enabled);
    } catch (e) {
      // Ignore errors when setting preferences
    }
  }
}
