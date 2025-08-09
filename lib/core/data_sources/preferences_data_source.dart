import 'package:shared_preferences/shared_preferences.dart';

/// Data source for handling application preferences
abstract class PreferencesDataSource {
  /// Get a string value from preferences
  Future<String?> getString(String key);

  /// Set a string value in preferences
  Future<void> setString(String key, String value);

  /// Get a string list from preferences
  Future<List<String>?> getStringList(String key);

  /// Set a string list in preferences
  Future<void> setStringList(String key, List<String> value);

  /// Get an integer value from preferences
  Future<int?> getInt(String key);

  /// Set an integer value in preferences
  Future<void> setInt(String key, int value);

  /// Get a boolean value from preferences
  Future<bool?> getBool(String key);

  /// Set a boolean value in preferences
  Future<void> setBool(String key, bool value);

  /// Remove a key from preferences
  Future<void> remove(String key);

  /// Clear all preferences
  Future<void> clear();
}

/// Implementation of preferences data source using SharedPreferences
class SharedPreferencesDataSource implements PreferencesDataSource {
  const SharedPreferencesDataSource();

  Future<SharedPreferences> get _prefs => SharedPreferences.getInstance();

  @override
  Future<String?> getString(String key) async {
    try {
      final prefs = await _prefs;
      return prefs.getString(key);
    } catch (e) {
      return null;
    }
  }

  @override
  Future<void> setString(String key, String value) async {
    try {
      final prefs = await _prefs;
      await prefs.setString(key, value);
    } catch (e) {
      // Ignore errors when setting preferences
    }
  }

  @override
  Future<List<String>?> getStringList(String key) async {
    try {
      final prefs = await _prefs;
      return prefs.getStringList(key);
    } catch (e) {
      return null;
    }
  }

  @override
  Future<void> setStringList(String key, List<String> value) async {
    try {
      final prefs = await _prefs;
      await prefs.setStringList(key, value);
    } catch (e) {
      // Ignore errors when setting preferences
    }
  }

  @override
  Future<int?> getInt(String key) async {
    try {
      final prefs = await _prefs;
      return prefs.getInt(key);
    } catch (e) {
      return null;
    }
  }

  @override
  Future<void> setInt(String key, int value) async {
    try {
      final prefs = await _prefs;
      await prefs.setInt(key, value);
    } catch (e) {
      // Ignore errors when setting preferences
    }
  }

  @override
  Future<bool?> getBool(String key) async {
    try {
      final prefs = await _prefs;
      return prefs.getBool(key);
    } catch (e) {
      return null;
    }
  }

  @override
  Future<void> setBool(String key, bool value) async {
    try {
      final prefs = await _prefs;
      await prefs.setBool(key, value);
    } catch (e) {
      // Ignore errors when setting preferences
    }
  }

  @override
  Future<void> remove(String key) async {
    try {
      final prefs = await _prefs;
      await prefs.remove(key);
    } catch (e) {
      // Ignore errors when removing preferences
    }
  }

  @override
  Future<void> clear() async {
    try {
      final prefs = await _prefs;
      await prefs.clear();
    } catch (e) {
      // Ignore errors when clearing preferences
    }
  }
}
