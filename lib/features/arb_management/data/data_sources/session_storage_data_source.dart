// Session storage data source barrel

import 'dart:convert';
import 'dart:io';

import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

/// Data source responsible for low-level persistence of translation sessions
abstract class SessionStorageDataSource {
  Future<void> saveSessionJson(String sessionId, Map<String, dynamic> data);
  Future<Map<String, dynamic>?> loadSessionJson(String sessionId);
  Future<List<String>> listSessionIds();
  Future<void> deleteSession(String sessionId);
}

class SessionStorageDataSourceImpl implements SessionStorageDataSource {
  const SessionStorageDataSourceImpl();

  @override
  Future<void> saveSessionJson(
    String sessionId,
    Map<String, dynamic> data,
  ) async {
    final sessionsDir = await _getSessionsDirectory();
    final sessionFile = File(p.join(sessionsDir.path, '$sessionId.json'));
    final jsonString = const JsonEncoder.withIndent('  ').convert(data);
    await sessionFile.writeAsString(jsonString);
  }

  @override
  Future<Map<String, dynamic>?> loadSessionJson(String sessionId) async {
    final sessionsDir = await _getSessionsDirectory();
    final sessionFile = File(p.join(sessionsDir.path, '$sessionId.json'));
    if (!await sessionFile.exists()) return null;
    final content = await sessionFile.readAsString();
    return jsonDecode(content) as Map<String, dynamic>;
  }

  @override
  Future<List<String>> listSessionIds() async {
    final sessionsDir = await _getSessionsDirectory();
    final files = sessionsDir
        .listSync()
        .whereType<File>()
        .where((f) => f.path.endsWith('.json'))
        .toList();
    return files.map((f) => p.basenameWithoutExtension(f.path)).toList();
  }

  @override
  Future<void> deleteSession(String sessionId) async {
    final sessionsDir = await _getSessionsDirectory();
    final file = File(p.join(sessionsDir.path, '$sessionId.json'));
    if (await file.exists()) {
      await file.delete();
    }
  }

  Future<Directory> _getSessionsDirectory() async {
    final appDir = await getApplicationDocumentsDirectory();
    final sessionsDir = Directory(p.join(appDir.path, 'rosetta', 'sessions'));
    if (!await sessionsDir.exists()) {
      await sessionsDir.create(recursive: true);
    }
    return sessionsDir;
  }
}
