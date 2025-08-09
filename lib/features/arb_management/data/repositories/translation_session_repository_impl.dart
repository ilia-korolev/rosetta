import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;

import '../../domain/entities/translation_session.dart';
import '../../domain/repositories/translation_session_repository.dart';

/// Implementation of translation session repository
class TranslationSessionRepositoryImpl implements TranslationSessionRepository {
  const TranslationSessionRepositoryImpl();

  static const Duration _defaultAutoSaveInterval = Duration(minutes: 5);

  @override
  Future<void> saveSession(TranslationSession session) async {
    final sessionsDir = await _getSessionsDirectory();
    final sessionFile = File(path.join(sessionsDir.path, '${session.sessionId}.json'));
    
    // Convert session to JSON (simplified for now)
    final sessionData = {
      'sessionId': session.sessionId,
      'createdAt': session.createdAt.toIso8601String(),
      'state': session.state.name,
      'currentFileLocale': session.currentFileLocale,
      'selectedEntryKey': session.selectedEntryKey,
      'hasUnsavedChanges': session.hasUnsavedChanges,
      'lastAutoSave': session.lastAutoSave?.toIso8601String(),
      // Note: In a real implementation, you'd need to serialize the full session
      // including files, changes, undo/redo stacks, etc.
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
      
      final sessionData = jsonDecode(await sessionFile.readAsString());
      
      // TODO: Implement full session deserialization
      // For now, return null as this requires complex serialization
      return null;
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
          final sessionData = jsonDecode(await file.readAsString());
          // TODO: Implement full session deserialization
          // For now, return empty list
        } catch (e) {
          // Skip invalid session files
          continue;
        }
      }
      
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
    final updatedSession = session.copyWith(
      lastAutoSave: DateTime.now(),
    );
    
    await saveSession(updatedSession);
  }

  @override
  Duration getAutoSaveInterval() {
    // TODO: Load from preferences
    return _defaultAutoSaveInterval;
  }

  @override
  Future<void> setAutoSaveInterval(Duration interval) async {
    // TODO: Save to preferences
  }

  /// Get the directory for storing session files
  Future<Directory> _getSessionsDirectory() async {
    final appDir = await getApplicationDocumentsDirectory();
    final sessionsDir = Directory(path.join(appDir.path, 'rosetta', 'sessions'));
    
    if (!await sessionsDir.exists()) {
      await sessionsDir.create(recursive: true);
    }
    
    return sessionsDir;
  }
}
