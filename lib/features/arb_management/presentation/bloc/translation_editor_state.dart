part of 'translation_editor_bloc.dart';

/// States for translation editor
@MappableClass()
sealed class TranslationEditorState with TranslationEditorStateMappable {
  const TranslationEditorState();
}

@MappableClass()
class TranslationEditorInitialState extends TranslationEditorState
    with TranslationEditorInitialStateMappable {
  const TranslationEditorInitialState();
}

@MappableClass()
class TranslationEditorLoadingState extends TranslationEditorState
    with TranslationEditorLoadingStateMappable {
  const TranslationEditorLoadingState({required this.operation, this.progress});

  final String operation;
  final double? progress;
}

@MappableClass()
class TranslationEditorLoadedState extends TranslationEditorState
    with TranslationEditorLoadedStateMappable {
  const TranslationEditorLoadedState({
    required this.session,
    this.filteredEntries,
    this.validationResults,
    this.searchTerm,
    this.filter,
  });

  final TranslationSession session;
  final Map<String, List<String>>? filteredEntries; // locale -> entry keys
  final Map<String, Map<String, IcuValidationResult>>?
  validationResults; // locale -> entryKey -> result
  final String? searchTerm;
  final EntryFilter? filter;

  /// Get current file
  ArbFile? get currentFile => session.currentFile;

  /// Get currently selected entry
  ArbEntry? get selectedEntry => session.selectedEntry;

  /// Get all locales
  List<String> get locales => session.locales;

  /// Check if undo is available
  bool get canUndo => session.canUndo;

  /// Check if redo is available
  bool get canRedo => session.canRedo;

  /// Check if there are unsaved changes
  bool get hasUnsavedChanges => session.hasUnsavedChanges;

  /// Get entries for current file (filtered if applicable)
  List<String> get currentFileEntries {
    if (session.currentFileLocale == null) return [];

    if (filteredEntries != null &&
        filteredEntries!.containsKey(session.currentFileLocale)) {
      return filteredEntries![session.currentFileLocale]!;
    }

    return session.currentFile?.keys ?? [];
  }

  /// Get validation result for current entry
  IcuValidationResult? get currentEntryValidation {
    if (session.currentFileLocale == null || session.selectedEntryKey == null) {
      return null;
    }
    return validationResults?[session.currentFileLocale]?[session
        .selectedEntryKey];
  }
}

@MappableClass()
class TranslationEditorErrorState extends TranslationEditorState
    with TranslationEditorErrorStateMappable {
  const TranslationEditorErrorState({required this.message, this.session});

  final String message;
  final TranslationSession? session;
}

@MappableClass()
class TranslationEditorSavedState extends TranslationEditorState
    with TranslationEditorSavedStateMappable {
  const TranslationEditorSavedState({
    required this.session,
    required this.message,
  });

  final TranslationSession session;
  final String message;
}

/// Filter for entries
@MappableClass()
class EntryFilter with EntryFilterMappable {
  const EntryFilter({
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
