import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;
import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/entities/arb_file.dart';
import '../../domain/entities/translation_session.dart';
import '../../domain/repositories/translation_session_repository.dart';
import '../dtos/arb_file_dto.dart';

/// Implementation of translation session repository
class TranslationSessionRepositoryImpl implements TranslationSessionRepository {
  const TranslationSessionRepositoryImpl();

  static const Duration _defaultAutoSaveInterval = Duration(minutes: 5);
  static const String _autoSaveIntervalKey = 'auto_save_interval_minutes';

  @override
  Future<void> saveSession(TranslationSession session) async {
    final sessionsDir = await _getSessionsDirectory();
    final sessionFile = File(
      path.join(sessionsDir.path, '${session.sessionId}.json'),
    );

    // Convert session to JSON with full serialization
    final sessionData = {
      'sessionId': session.sessionId,
      'createdAt': session.createdAt.toIso8601String(),
      'state': session.state.name,
      'currentFileLocale': session.currentFileLocale,
      'selectedEntryKey': session.selectedEntryKey,
      'hasUnsavedChanges': session.hasUnsavedChanges,
      'lastAutoSave': session.lastAutoSave?.toIso8601String(),

      'files': _serializeFiles(session.files),
      'changes': _serializeChanges(session.changes),
      'undoStack': _serializeChanges(session.undoStack),
      'redoStack': _serializeChanges(session.redoStack),
    };

    await sessionFile.writeAsString(
      const JsonEncoder.withIndent('  ').convert(sessionData),
    );
  }

  @override
  Future<TranslationSession?> loadSession(String sessionId) async {
    try {
      final sessionsDir = await _getSessionsDirectory();
      final sessionFile = File(path.join(sessionsDir.path, '$sessionId.json'));

      if (!await sessionFile.exists()) {
        return null;
      }

      final sessionData =
          jsonDecode(await sessionFile.readAsString()) as Map<String, dynamic>;

      return TranslationSession(
        sessionId: sessionData['sessionId'] as String,
        createdAt: DateTime.parse(sessionData['createdAt'] as String),
        state: SessionState.values.firstWhere(
          (state) => state.name == sessionData['state'],
          orElse: () => SessionState.idle,
        ),
        currentFileLocale: sessionData['currentFileLocale'] as String?,
        selectedEntryKey: sessionData['selectedEntryKey'] as String?,
        hasUnsavedChanges: sessionData['hasUnsavedChanges'] as bool? ?? false,
        lastAutoSave: sessionData['lastAutoSave'] != null
            ? DateTime.parse(sessionData['lastAutoSave'] as String)
            : null,

        files: _deserializeFiles(
          sessionData['files'] as Map<String, dynamic>? ?? {},
        ),
        changes: _deserializeChanges(
          sessionData['changes'] as List<dynamic>? ?? [],
        ),
        undoStack: _deserializeChanges(
          sessionData['undoStack'] as List<dynamic>? ?? [],
        ),
        redoStack: _deserializeChanges(
          sessionData['redoStack'] as List<dynamic>? ?? [],
        ),
      );
    } catch (e) {
      return null;
    }
  }

  @override
  Future<List<TranslationSession>> getAllSessions() async {
    try {
      final sessionsDir = await _getSessionsDirectory();
      final sessionFiles = sessionsDir
          .listSync()
          .whereType<File>()
          .where((file) => file.path.endsWith('.json'))
          .toList();

      final sessions = <TranslationSession>[];

      for (final file in sessionFiles) {
        try {
          final sessionId = path.basenameWithoutExtension(file.path);
          final session = await loadSession(sessionId);
          if (session != null) {
            sessions.add(session);
          }
        } catch (e) {
          // Skip invalid session files
          continue;
        }
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
      final sessionsDir = await _getSessionsDirectory();
      final sessionFile = File(path.join(sessionsDir.path, '$sessionId.json'));

      if (await sessionFile.exists()) {
        await sessionFile.delete();
      }
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
      final prefs = await SharedPreferences.getInstance();
      final minutes =
          prefs.getInt(_autoSaveIntervalKey) ??
          _defaultAutoSaveInterval.inMinutes;
      return Duration(minutes: minutes);
    } catch (e) {
      return _defaultAutoSaveInterval;
    }
  }

  @override
  Future<void> setAutoSaveInterval(Duration interval) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setInt(_autoSaveIntervalKey, interval.inMinutes);
    } catch (e) {
      // Ignore errors when saving preferences
    }
  }

  /// Serialize files map to JSON
  Map<String, dynamic> _serializeFiles(Map<String, ArbFile> files) {
    final result = <String, dynamic>{};
    for (final entry in files.entries) {
      result[entry.key] = ArbFileDto.fromDomain(entry.value).toJson();
    }
    return result;
  }

  /// Deserialize files map from JSON
  Map<String, ArbFile> _deserializeFiles(Map<String, dynamic> filesJson) {
    final result = <String, ArbFile>{};
    for (final entry in filesJson.entries) {
      try {
        final dto = ArbFileDtoMapper.fromMap(
          entry.value as Map<String, dynamic>,
        );
        result[entry.key] = dto.toDomain();
      } catch (e) {
        // Skip invalid file entries
        continue;
      }
    }
    return result;
  }

  /// Serialize translation changes to JSON
  List<Map<String, dynamic>> _serializeChanges(
    List<TranslationChange> changes,
  ) {
    return changes.map((change) => change.toMap()).toList();
  }

  /// Deserialize translation changes from JSON
  List<TranslationChange> _deserializeChanges(List<dynamic> changesJson) {
    final result = <TranslationChange>[];
    for (final changeJson in changesJson) {
      try {
        final change = TranslationChangeMapper.fromMap(
          changeJson as Map<String, dynamic>,
        );
        result.add(change);
      } catch (e) {
        // Skip invalid change entries
        continue;
      }
    }
    return result;
  }

  /// Get the directory for storing session files
  Future<Directory> _getSessionsDirectory() async {
    final appDir = await getApplicationDocumentsDirectory();
    final sessionsDir = Directory(
      path.join(appDir.path, 'rosetta', 'sessions'),
    );

    if (!await sessionsDir.exists()) {
      await sessionsDir.create(recursive: true);
    }

    return sessionsDir;
  }
}
