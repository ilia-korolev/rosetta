part of 'translation_editor_bloc.dart';

/// Events for translation editor
@MappableClass()
sealed class TranslationEditorEvent with TranslationEditorEventMappable {
  const TranslationEditorEvent();
}

@MappableClass()
class InitializeSessionEvent extends TranslationEditorEvent
    with InitializeSessionEventMappable {
  const InitializeSessionEvent(this.files);

  final Map<String, ArbFile> files;
}

@MappableClass()
class LoadSessionEvent extends TranslationEditorEvent
    with LoadSessionEventMappable {
  const LoadSessionEvent(this.sessionId);

  final String sessionId;
}

@MappableClass()
class SelectEntryEvent extends TranslationEditorEvent
    with SelectEntryEventMappable {
  const SelectEntryEvent({required this.fileLocale, required this.entryKey});

  final String fileLocale;
  final String entryKey;
}

@MappableClass()
class UpdateEntryValueEvent extends TranslationEditorEvent
    with UpdateEntryValueEventMappable {
  const UpdateEntryValueEvent({
    required this.fileLocale,
    required this.entryKey,
    required this.newValue,
  });

  final String fileLocale;
  final String entryKey;
  final String newValue;
}

@MappableClass()
class UpdateEntryEvent extends TranslationEditorEvent
    with UpdateEntryEventMappable {
  const UpdateEntryEvent({
    required this.fileLocale,
    required this.entryKey,
    required this.entry,
  });

  final String fileLocale;
  final String entryKey;
  final ArbEntry entry;
}

@MappableClass()
class AddEntryEvent extends TranslationEditorEvent with AddEntryEventMappable {
  const AddEntryEvent({required this.fileLocale, required this.entry});

  final String fileLocale;
  final ArbEntry entry;
}

@MappableClass()
class DeleteEntryEvent extends TranslationEditorEvent
    with DeleteEntryEventMappable {
  const DeleteEntryEvent({required this.fileLocale, required this.entryKey});

  final String fileLocale;
  final String entryKey;
}

@MappableClass()
class UndoEvent extends TranslationEditorEvent with UndoEventMappable {
  const UndoEvent();
}

@MappableClass()
class RedoEvent extends TranslationEditorEvent with RedoEventMappable {
  const RedoEvent();
}

@MappableClass()
class SaveSessionEvent extends TranslationEditorEvent
    with SaveSessionEventMappable {
  const SaveSessionEvent();
}

@MappableClass()
class AutoSaveEvent extends TranslationEditorEvent with AutoSaveEventMappable {
  const AutoSaveEvent();
}

@MappableClass()
class ValidateEntryEvent extends TranslationEditorEvent
    with ValidateEntryEventMappable {
  const ValidateEntryEvent({required this.fileLocale, required this.entryKey});

  final String fileLocale;
  final String entryKey;
}

@MappableClass()
class FilterEntriesEvent extends TranslationEditorEvent
    with FilterEntriesEventMappable {
  const FilterEntriesEvent({
    this.searchTerm,
    this.entryType,
    this.hasIssues,
    this.isTranslated,
  });

  final String? searchTerm;
  final ArbEntryType? entryType;
  final bool? hasIssues;
  final bool? isTranslated;
}
