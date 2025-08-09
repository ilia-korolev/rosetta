import 'package:dart_mappable/dart_mappable.dart';
import 'package:rosetta/features/features.dart';

part 'translation_session_dto.mapper.dart';

/// DTO for serializing/deserializing TranslationSession
@MappableClass()
class TranslationSessionDto with TranslationSessionDtoMappable {
  const TranslationSessionDto({
    required this.sessionId,
    required this.createdAtIso,
    required this.state,
    required this.files,
    required this.changes,
    required this.undoStack,
    required this.redoStack,
    this.currentFileLocale,
    this.selectedEntryKey,
    this.hasUnsavedChanges = false,
    this.lastAutoSaveIso,
  });

  final String sessionId;
  final String createdAtIso;
  final SessionState state;
  final Map<String, Map<String, dynamic>> files;
  final List<Map<String, dynamic>> changes;
  final List<Map<String, dynamic>> undoStack;
  final List<Map<String, dynamic>> redoStack;
  final String? currentFileLocale;
  final String? selectedEntryKey;
  final bool hasUnsavedChanges;
  final String? lastAutoSaveIso;
}

extension TranslationSessionDtoMapping on TranslationSession {
  TranslationSessionDto toDto() {
    final filesJson = <String, Map<String, dynamic>>{};
    for (final entry in files.entries) {
      filesJson[entry.key] = ArbFileDto.fromDomain(entry.value).toMap();
    }
    return TranslationSessionDto(
      sessionId: sessionId,
      createdAtIso: createdAt.toIso8601String(),
      state: state,
      currentFileLocale: currentFileLocale,
      selectedEntryKey: selectedEntryKey,
      hasUnsavedChanges: hasUnsavedChanges,
      lastAutoSaveIso: lastAutoSave?.toIso8601String(),
      files: filesJson,
      changes: changes.map((c) => c.toMap()).toList(),
      undoStack: undoStack.map((c) => c.toMap()).toList(),
      redoStack: redoStack.map((c) => c.toMap()).toList(),
    );
  }
}

extension TranslationSessionDtoToDomain on TranslationSessionDto {
  TranslationSession toDomain() {
    final filesDomain = <String, ArbFile>{};
    for (final entry in files.entries) {
      final dto = ArbFileDtoMapper.fromMap(entry.value);
      filesDomain[entry.key] = dto.toDomain();
    }
    return TranslationSession(
      sessionId: sessionId,
      createdAt: DateTime.parse(createdAtIso),
      state: state,
      currentFileLocale: currentFileLocale,
      selectedEntryKey: selectedEntryKey,
      hasUnsavedChanges: hasUnsavedChanges,
      lastAutoSave: lastAutoSaveIso != null
          ? DateTime.parse(lastAutoSaveIso!)
          : null,
      files: filesDomain,
      changes: changes.map((m) => TranslationChangeMapper.fromMap(m)).toList(),
      undoStack: undoStack
          .map((m) => TranslationChangeMapper.fromMap(m))
          .toList(),
      redoStack: redoStack
          .map((m) => TranslationChangeMapper.fromMap(m))
          .toList(),
    );
  }
}
