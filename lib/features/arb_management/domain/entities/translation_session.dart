import 'package:dart_mappable/dart_mappable.dart';
import 'package:rosetta/features/features.dart';

part 'translation_session.mapper.dart';

/// Type of change made to a translation
@MappableEnum()
enum ChangeType {
  add, // Added new entry
  edit, // Modified existing entry
  delete, // Removed entry
  metadata, // Changed metadata
}

/// A single change in the translation session
@MappableClass()
class TranslationChange with TranslationChangeMappable {
  const TranslationChange({
    required this.changeId,
    required this.timestamp,
    required this.type,
    required this.entryKey,
    required this.fileLocale,
    this.oldValue,
    this.newValue,
    this.oldEntry,
    this.newEntry,
    this.description,
  });

  /// Unique identifier for this change
  final String changeId;

  /// When the change was made
  final DateTime timestamp;

  /// Type of change
  final ChangeType type;

  /// Key of the entry that was changed
  final String entryKey;

  /// Locale of the file that was changed
  final String fileLocale;

  /// Old value (for simple text changes)
  final String? oldValue;

  /// New value (for simple text changes)
  final String? newValue;

  /// Complete old entry (for complex changes)
  final ArbEntry? oldEntry;

  /// Complete new entry (for complex changes)
  final ArbEntry? newEntry;

  /// Description of the change
  final String? description;

  /// Create a change for editing a simple value
  factory TranslationChange.editValue({
    required String entryKey,
    required String fileLocale,
    required String oldValue,
    required String newValue,
    String? description,
  }) {
    return TranslationChange(
      changeId: DateTime.now().microsecondsSinceEpoch.toString(),
      timestamp: DateTime.now(),
      type: ChangeType.edit,
      entryKey: entryKey,
      fileLocale: fileLocale,
      oldValue: oldValue,
      newValue: newValue,
      description: description,
    );
  }

  /// Create a change for adding a new entry
  factory TranslationChange.addEntry({
    required String entryKey,
    required String fileLocale,
    required ArbEntry entry,
    String? description,
  }) {
    return TranslationChange(
      changeId: DateTime.now().microsecondsSinceEpoch.toString(),
      timestamp: DateTime.now(),
      type: ChangeType.add,
      entryKey: entryKey,
      fileLocale: fileLocale,
      newEntry: entry,
      description: description,
    );
  }

  /// Create a change for deleting an entry
  factory TranslationChange.deleteEntry({
    required String entryKey,
    required String fileLocale,
    required ArbEntry entry,
    String? description,
  }) {
    return TranslationChange(
      changeId: DateTime.now().microsecondsSinceEpoch.toString(),
      timestamp: DateTime.now(),
      type: ChangeType.delete,
      entryKey: entryKey,
      fileLocale: fileLocale,
      oldEntry: entry,
      description: description,
    );
  }
}

/// Current state of a translation session
@MappableEnum()
enum SessionState {
  idle, // No active translation work
  editing, // Actively editing translations
  validating, // Running validation
  saving, // Saving changes
  exporting, // Exporting files
  error, // Error state
}

/// Statistics for a translation session
@MappableClass()
class SessionStatistics with SessionStatisticsMappable {
  const SessionStatistics({
    required this.totalChanges,
    required this.addedEntries,
    required this.editedEntries,
    required this.deletedEntries,
    required this.filesModified,
    required this.sessionDuration,
  });

  /// Total number of changes made
  final int totalChanges;

  /// Number of entries added
  final int addedEntries;

  /// Number of entries edited
  final int editedEntries;

  /// Number of entries deleted
  final int deletedEntries;

  /// Number of files modified
  final int filesModified;

  /// Duration of the session
  final Duration sessionDuration;
}

/// A translation working session
@MappableClass()
class TranslationSession with TranslationSessionMappable {
  const TranslationSession({
    required this.sessionId,
    required this.createdAt,
    required this.files,
    required this.state,
    this.changes = const [],
    this.undoStack = const [],
    this.redoStack = const [],
    this.currentFileLocale,
    this.selectedEntryKey,
    this.hasUnsavedChanges = false,
    this.lastAutoSave,
  });

  /// Unique session identifier
  final String sessionId;

  /// When the session was created
  final DateTime createdAt;

  /// ARB files in this session
  final Map<String, ArbFile> files;

  /// Current session state
  final SessionState state;

  /// All changes made in this session
  final List<TranslationChange> changes;

  /// Undo stack (most recent first)
  final List<TranslationChange> undoStack;

  /// Redo stack (most recent first)
  final List<TranslationChange> redoStack;

  /// Currently selected file locale
  final String? currentFileLocale;

  /// Currently selected entry key
  final String? selectedEntryKey;

  /// Whether there are unsaved changes
  final bool hasUnsavedChanges;

  /// When auto-save last ran
  final DateTime? lastAutoSave;

  /// Get available locales
  List<String> get locales => files.keys.toList();

  /// Get current file
  ArbFile? get currentFile =>
      currentFileLocale != null ? files[currentFileLocale] : null;

  /// Get currently selected entry
  ArbEntry? get selectedEntry {
    if (currentFileLocale == null || selectedEntryKey == null) return null;
    return files[currentFileLocale]?.getEntry(selectedEntryKey!);
  }

  /// Check if undo is available
  bool get canUndo => undoStack.isNotEmpty;

  /// Check if redo is available
  bool get canRedo => redoStack.isNotEmpty;

  /// Get session duration
  Duration get sessionDuration => DateTime.now().difference(createdAt);

  /// Calculate session statistics
  SessionStatistics calculateStatistics() {
    final addedEntries = changes.where((c) => c.type == ChangeType.add).length;
    final editedEntries = changes
        .where((c) => c.type == ChangeType.edit)
        .length;
    final deletedEntries = changes
        .where((c) => c.type == ChangeType.delete)
        .length;
    final filesModified = changes.map((c) => c.fileLocale).toSet().length;

    return SessionStatistics(
      totalChanges: changes.length,
      addedEntries: addedEntries,
      editedEntries: editedEntries,
      deletedEntries: deletedEntries,
      filesModified: filesModified,
      sessionDuration: sessionDuration,
    );
  }

  /// Add a change to the session
  TranslationSession addChange(TranslationChange change) {
    return copyWith(
      changes: [...changes, change],
      undoStack: [change, ...undoStack],
      redoStack: [], // Clear redo stack when new change is made
      hasUnsavedChanges: true,
    );
  }

  /// Undo the last change
  TranslationSession undo() {
    if (!canUndo) return this;

    final changeToUndo = undoStack.first;
    final newUndoStack = undoStack.skip(1).toList();
    final newRedoStack = [changeToUndo, ...redoStack];

    // Apply the undo to the affected file
    final affectedFile = files[changeToUndo.fileLocale];
    if (affectedFile == null) return this;

    ArbFile updatedFile;
    switch (changeToUndo.type) {
      case ChangeType.add:
        // Undo add by removing the entry
        updatedFile = affectedFile.removeEntry(changeToUndo.entryKey);
        break;
      case ChangeType.edit:
        // Undo edit by restoring old value/entry
        if (changeToUndo.oldEntry != null) {
          updatedFile = affectedFile.updateEntry(
            changeToUndo.entryKey,
            changeToUndo.oldEntry!,
          );
        } else if (changeToUndo.oldValue != null) {
          final currentEntry = affectedFile.getEntry(changeToUndo.entryKey);
          if (currentEntry != null) {
            final restoredEntry = currentEntry.copyWith(
              value: changeToUndo.oldValue!,
            );
            updatedFile = affectedFile.updateEntry(
              changeToUndo.entryKey,
              restoredEntry,
            );
          } else {
            updatedFile = affectedFile;
          }
        } else {
          updatedFile = affectedFile;
        }
        break;
      case ChangeType.delete:
        // Undo delete by restoring the entry
        if (changeToUndo.oldEntry != null) {
          updatedFile = affectedFile.updateEntry(
            changeToUndo.entryKey,
            changeToUndo.oldEntry!,
          );
        } else {
          updatedFile = affectedFile;
        }
        break;
      case ChangeType.metadata:
        // Handle metadata undo if needed
        updatedFile = affectedFile;
        break;
    }

    return copyWith(
      files: {...files, changeToUndo.fileLocale: updatedFile},
      undoStack: newUndoStack,
      redoStack: newRedoStack,
      hasUnsavedChanges: true,
    );
  }

  /// Redo the last undone change
  TranslationSession redo() {
    if (!canRedo) return this;

    final changeToRedo = redoStack.first;
    final newRedoStack = redoStack.skip(1).toList();
    final newUndoStack = [changeToRedo, ...undoStack];

    // Apply the redo to the affected file
    final affectedFile = files[changeToRedo.fileLocale];
    if (affectedFile == null) return this;

    ArbFile updatedFile;
    switch (changeToRedo.type) {
      case ChangeType.add:
        // Redo add by adding the entry back
        if (changeToRedo.newEntry != null) {
          updatedFile = affectedFile.updateEntry(
            changeToRedo.entryKey,
            changeToRedo.newEntry!,
          );
        } else {
          updatedFile = affectedFile;
        }
        break;
      case ChangeType.edit:
        // Redo edit by applying new value/entry
        if (changeToRedo.newEntry != null) {
          updatedFile = affectedFile.updateEntry(
            changeToRedo.entryKey,
            changeToRedo.newEntry!,
          );
        } else if (changeToRedo.newValue != null) {
          final currentEntry = affectedFile.getEntry(changeToRedo.entryKey);
          if (currentEntry != null) {
            final editedEntry = currentEntry.copyWith(
              value: changeToRedo.newValue!,
            );
            updatedFile = affectedFile.updateEntry(
              changeToRedo.entryKey,
              editedEntry,
            );
          } else {
            updatedFile = affectedFile;
          }
        } else {
          updatedFile = affectedFile;
        }
        break;
      case ChangeType.delete:
        // Redo delete by removing the entry
        updatedFile = affectedFile.removeEntry(changeToRedo.entryKey);
        break;
      case ChangeType.metadata:
        // Handle metadata redo if needed
        updatedFile = affectedFile;
        break;
    }

    return copyWith(
      files: {...files, changeToRedo.fileLocale: updatedFile},
      undoStack: newUndoStack,
      redoStack: newRedoStack,
      hasUnsavedChanges: true,
    );
  }

  /// Update a file in the session
  TranslationSession updateFile(String locale, ArbFile file) {
    return copyWith(files: {...files, locale: file}, hasUnsavedChanges: true);
  }

  /// Select a file and entry
  TranslationSession selectEntry(String fileLocale, String entryKey) {
    return copyWith(currentFileLocale: fileLocale, selectedEntryKey: entryKey);
  }

  /// Mark session as saved
  TranslationSession markAsSaved() {
    final savedFiles = <String, ArbFile>{};
    for (final entry in files.entries) {
      savedFiles[entry.key] = entry.value.markAsSaved();
    }

    return copyWith(files: savedFiles, hasUnsavedChanges: false);
  }

  /// Create a new session
  factory TranslationSession.create(Map<String, ArbFile> files) {
    return TranslationSession(
      sessionId: DateTime.now().microsecondsSinceEpoch.toString(),
      createdAt: DateTime.now(),
      files: files,
      state: SessionState.idle,
    );
  }
}
