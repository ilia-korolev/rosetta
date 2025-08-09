import 'package:rosetta/features/features.dart';

/// Implementation of translation session repository
class TranslationSessionRepositoryImpl implements TranslationSessionRepository {
  const TranslationSessionRepositoryImpl(
    this._autoSavePreferencesDataSource,
    this._sessionStorageDataSource,
  );

  final AutoSavePreferencesDataSource _autoSavePreferencesDataSource;
  final SessionStorageDataSource _sessionStorageDataSource;

  static const Duration _defaultAutoSaveInterval = Duration(minutes: 5);

  @override
  Future<void> saveSession(TranslationSession session) async {
    final dto = session.toDto();
    await _sessionStorageDataSource.saveSessionJson(
      session.sessionId,
      dto.toMap(),
    );
  }

  @override
  Future<TranslationSession?> loadSession(String sessionId) async {
    try {
      final sessionData = await _sessionStorageDataSource.loadSessionJson(
        sessionId,
      );
      if (sessionData == null) return null;

      final dto = TranslationSessionDtoMapper.fromMap(sessionData);
      return dto.toDomain();
    } catch (e) {
      return null;
    }
  }

  @override
  Future<List<TranslationSession>> getAllSessions() async {
    try {
      final ids = await _sessionStorageDataSource.listSessionIds();
      final sessions = <TranslationSession>[];
      for (final id in ids) {
        final session = await loadSession(id);
        if (session != null) sessions.add(session);
      }

      // Sort by creation date (most recent first)
      sessions.sort((a, b) => b.createdAt.compareTo(a.createdAt));

      return sessions;
    } catch (e) {
      return <TranslationSession>[];
    }
  }

  @override
  Future<void> deleteSession(String sessionId) async {
    try {
      await _sessionStorageDataSource.deleteSession(sessionId);
    } catch (e) {
      // Ignore errors when deleting
    }
  }

  @override
  Future<void> autoSaveSession(TranslationSession session) async {
    // Create a copy with updated auto-save timestamp
    final updatedSession = session.copyWith(lastAutoSave: DateTime.now());

    await saveSession(updatedSession);
  }

  @override
  Duration getAutoSaveInterval() {
    // Note: This is synchronous but preferences are async
    // In a real implementation, you might want to cache this value
    // or make the interface async
    return _defaultAutoSaveInterval;
  }

  /// Get auto-save interval from preferences (async version)
  Future<Duration> getAutoSaveIntervalAsync() async {
    try {
      final minutes = await _autoSavePreferencesDataSource
          .getAutoSaveIntervalMinutes();
      return Duration(minutes: minutes ?? _defaultAutoSaveInterval.inMinutes);
    } catch (e) {
      return _defaultAutoSaveInterval;
    }
  }

  @override
  Future<void> setAutoSaveInterval(Duration interval) async {
    await _autoSavePreferencesDataSource.setAutoSaveIntervalMinutes(
      interval.inMinutes,
    );
  }
}
