import 'package:rosetta/features/features.dart';

/// Repository interface for translation session operations
abstract class TranslationSessionRepository {
  /// Save a translation session
  Future<void> saveSession(TranslationSession session);

  /// Load a translation session
  Future<TranslationSession?> loadSession(String sessionId);

  /// Get all saved sessions
  Future<List<TranslationSession>> getAllSessions();

  /// Delete a session
  Future<void> deleteSession(String sessionId);

  /// Auto-save session periodically
  Future<void> autoSaveSession(TranslationSession session);

  /// Get auto-save interval
  Duration getAutoSaveInterval();

  /// Set auto-save interval
  Future<void> setAutoSaveInterval(Duration interval);
}
