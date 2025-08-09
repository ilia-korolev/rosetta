import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:rosetta/features/features.dart';

part 'translation_editor_bloc.mapper.dart';
part 'translation_editor_event.dart';
part 'translation_editor_state.dart';

/// BLoC for handling translation editing
class TranslationEditorBloc
    extends Bloc<TranslationEditorEvent, TranslationEditorState> {
  TranslationEditorBloc({
    required ArbFileRepository arbFileRepository,
    required TranslationSessionRepository sessionRepository,
    required ValidateIcuSyntaxUseCase validateIcuSyntaxUseCase,
  }) : _arbFileRepository = arbFileRepository,
       _sessionRepository = sessionRepository,
       _validateIcuSyntaxUseCase = validateIcuSyntaxUseCase,
       super(const TranslationEditorInitialState()) {
    on<InitializeSessionEvent>(_onInitializeSession);
    on<LoadSessionEvent>(_onLoadSession);
    on<SelectEntryEvent>(_onSelectEntry);
    on<UpdateEntryValueEvent>(_onUpdateEntryValue);
    on<UpdateEntryEvent>(_onUpdateEntry);
    on<AddEntryEvent>(_onAddEntry);
    on<DeleteEntryEvent>(_onDeleteEntry);
    on<UndoEvent>(_onUndo);
    on<RedoEvent>(_onRedo);
    on<SaveSessionEvent>(_onSaveSession);
    on<AutoSaveEvent>(_onAutoSave);
    on<ValidateEntryEvent>(_onValidateEntry);
    on<FilterEntriesEvent>(_onFilterEntries);
  }

  final ArbFileRepository _arbFileRepository;
  final TranslationSessionRepository _sessionRepository;
  final ValidateIcuSyntaxUseCase _validateIcuSyntaxUseCase;

  /// Handle session initialization
  Future<void> _onInitializeSession(
    InitializeSessionEvent event,
    Emitter<TranslationEditorState> emit,
  ) async {
    emit(
      const TranslationEditorLoadingState(operation: 'Initializing session...'),
    );

    try {
      final session = TranslationSession.create(event.files);

      // Select first file and entry if available
      if (session.locales.isNotEmpty) {
        final firstLocale = session.locales.first;
        final firstFile = session.files[firstLocale];
        if (firstFile != null && firstFile.keys.isNotEmpty) {
          final updatedSession = session.selectEntry(
            firstLocale,
            firstFile.keys.first,
          );
          emit(TranslationEditorLoadedState(session: updatedSession));
          return;
        }
      }

      emit(TranslationEditorLoadedState(session: session));
    } catch (e) {
      emit(
        TranslationEditorErrorState(
          message: 'Failed to initialize session: $e',
        ),
      );
    }
  }

  /// Handle loading existing session
  Future<void> _onLoadSession(
    LoadSessionEvent event,
    Emitter<TranslationEditorState> emit,
  ) async {
    emit(const TranslationEditorLoadingState(operation: 'Loading session...'));

    try {
      final session = await _sessionRepository.loadSession(event.sessionId);

      if (session != null) {
        emit(TranslationEditorLoadedState(session: session));
      } else {
        emit(const TranslationEditorErrorState(message: 'Session not found'));
      }
    } catch (e) {
      emit(TranslationEditorErrorState(message: 'Failed to load session: $e'));
    }
  }

  /// Handle entry selection
  void _onSelectEntry(
    SelectEntryEvent event,
    Emitter<TranslationEditorState> emit,
  ) {
    final currentState = state;
    if (currentState is! TranslationEditorLoadedState) return;

    final updatedSession = currentState.session.selectEntry(
      event.fileLocale,
      event.entryKey,
    );

    emit(currentState.copyWith(session: updatedSession));
  }

  /// Handle entry value update
  void _onUpdateEntryValue(
    UpdateEntryValueEvent event,
    Emitter<TranslationEditorState> emit,
  ) {
    final currentState = state;
    if (currentState is! TranslationEditorLoadedState) return;

    final file = currentState.session.files[event.fileLocale];
    if (file == null) return;

    final currentEntry = file.getEntry(event.entryKey);
    if (currentEntry == null) return;

    // Create change record
    final change = TranslationChange.editValue(
      entryKey: event.entryKey,
      fileLocale: event.fileLocale,
      oldValue: currentEntry.value,
      newValue: event.newValue,
    );

    // Update entry
    final updatedEntry = currentEntry.copyWith(value: event.newValue);
    final updatedFile = file.updateEntry(event.entryKey, updatedEntry);

    // Update session
    var updatedSession = currentState.session.updateFile(
      event.fileLocale,
      updatedFile,
    );
    updatedSession = updatedSession.addChange(change);

    emit(currentState.copyWith(session: updatedSession));
  }

  /// Handle complete entry update
  void _onUpdateEntry(
    UpdateEntryEvent event,
    Emitter<TranslationEditorState> emit,
  ) {
    final currentState = state;
    if (currentState is! TranslationEditorLoadedState) return;

    final file = currentState.session.files[event.fileLocale];
    if (file == null) return;

    final currentEntry = file.getEntry(event.entryKey);

    // Create change record
    final change = TranslationChange(
      changeId: DateTime.now().microsecondsSinceEpoch.toString(),
      timestamp: DateTime.now(),
      type: ChangeType.edit,
      entryKey: event.entryKey,
      fileLocale: event.fileLocale,
      oldEntry: currentEntry,
      newEntry: event.entry,
    );

    // Update file
    final updatedFile = file.updateEntry(event.entryKey, event.entry);

    // Update session
    var updatedSession = currentState.session.updateFile(
      event.fileLocale,
      updatedFile,
    );
    updatedSession = updatedSession.addChange(change);

    emit(currentState.copyWith(session: updatedSession));
  }

  /// Handle adding new entry
  void _onAddEntry(AddEntryEvent event, Emitter<TranslationEditorState> emit) {
    final currentState = state;
    if (currentState is! TranslationEditorLoadedState) return;

    final file = currentState.session.files[event.fileLocale];
    if (file == null) return;

    // Create change record
    final change = TranslationChange.addEntry(
      entryKey: event.entry.key,
      fileLocale: event.fileLocale,
      entry: event.entry,
    );

    // Update file
    final updatedFile = file.updateEntry(event.entry.key, event.entry);

    // Update session
    var updatedSession = currentState.session.updateFile(
      event.fileLocale,
      updatedFile,
    );
    updatedSession = updatedSession.addChange(change);

    emit(currentState.copyWith(session: updatedSession));
  }

  /// Handle deleting entry
  void _onDeleteEntry(
    DeleteEntryEvent event,
    Emitter<TranslationEditorState> emit,
  ) {
    final currentState = state;
    if (currentState is! TranslationEditorLoadedState) return;

    final file = currentState.session.files[event.fileLocale];
    if (file == null) return;

    final entryToDelete = file.getEntry(event.entryKey);
    if (entryToDelete == null) return;

    // Create change record
    final change = TranslationChange.deleteEntry(
      entryKey: event.entryKey,
      fileLocale: event.fileLocale,
      entry: entryToDelete,
    );

    // Update file
    final updatedFile = file.removeEntry(event.entryKey);

    // Update session
    var updatedSession = currentState.session.updateFile(
      event.fileLocale,
      updatedFile,
    );
    updatedSession = updatedSession.addChange(change);

    emit(currentState.copyWith(session: updatedSession));
  }

  /// Handle undo
  void _onUndo(UndoEvent event, Emitter<TranslationEditorState> emit) {
    final currentState = state;
    if (currentState is! TranslationEditorLoadedState) return;

    if (currentState.session.canUndo) {
      final updatedSession = currentState.session.undo();
      emit(currentState.copyWith(session: updatedSession));
    }
  }

  /// Handle redo
  void _onRedo(RedoEvent event, Emitter<TranslationEditorState> emit) {
    final currentState = state;
    if (currentState is! TranslationEditorLoadedState) return;

    if (currentState.session.canRedo) {
      final updatedSession = currentState.session.redo();
      emit(currentState.copyWith(session: updatedSession));
    }
  }

  /// Handle session save
  Future<void> _onSaveSession(
    SaveSessionEvent event,
    Emitter<TranslationEditorState> emit,
  ) async {
    final currentState = state;
    if (currentState is! TranslationEditorLoadedState) return;

    try {
      // Save all files
      await _arbFileRepository.saveMultipleFiles(currentState.session.files);

      // Mark session as saved
      final savedSession = currentState.session.markAsSaved();

      // Save session state
      await _sessionRepository.saveSession(savedSession);

      emit(
        TranslationEditorSavedState(
          session: savedSession,
          message: 'Session saved successfully',
        ),
      );

      // Return to loaded state
      emit(currentState.copyWith(session: savedSession));
    } catch (e) {
      emit(
        TranslationEditorErrorState(
          message: 'Failed to save session: $e',
          session: currentState.session,
        ),
      );
    }
  }

  /// Handle auto-save
  Future<void> _onAutoSave(
    AutoSaveEvent event,
    Emitter<TranslationEditorState> emit,
  ) async {
    final currentState = state;
    if (currentState is! TranslationEditorLoadedState) return;

    try {
      await _sessionRepository.autoSaveSession(currentState.session);
    } catch (e) {
      // Auto-save failures should not disrupt the user experience
      // Just log the error or show a non-intrusive notification
    }
  }

  /// Handle entry validation
  void _onValidateEntry(
    ValidateEntryEvent event,
    Emitter<TranslationEditorState> emit,
  ) {
    final currentState = state;
    if (currentState is! TranslationEditorLoadedState) return;

    final file = currentState.session.files[event.fileLocale];
    if (file == null) return;

    final entry = file.getEntry(event.entryKey);
    if (entry == null) return;

    // Validate the entry
    final validationResult = _validateIcuSyntaxUseCase(entry);

    // Update validation results
    final currentResults = currentState.validationResults ?? {};
    final fileResults = currentResults[event.fileLocale] ?? {};
    fileResults[event.entryKey] = validationResult;
    currentResults[event.fileLocale] = fileResults;

    emit(currentState.copyWith(validationResults: currentResults));
  }

  /// Handle entry filtering
  void _onFilterEntries(
    FilterEntriesEvent event,
    Emitter<TranslationEditorState> emit,
  ) {
    final currentState = state;
    if (currentState is! TranslationEditorLoadedState) return;

    final filter = EntryFilter(
      searchTerm: event.searchTerm,
      entryType: event.entryType,
      hasIssues: event.hasIssues,
      isTranslated: event.isTranslated,
    );

    // Apply filters to each file
    final filteredEntries = <String, List<String>>{};

    for (final fileEntry in currentState.session.files.entries) {
      final locale = fileEntry.key;
      final file = fileEntry.value;

      var entries = file.entries.values.toList();

      // Apply search term filter
      if (event.searchTerm != null && event.searchTerm!.isNotEmpty) {
        final searchTerm = event.searchTerm!.toLowerCase();
        entries = entries
            .where(
              (entry) =>
                  entry.key.toLowerCase().contains(searchTerm) ||
                  entry.value.toLowerCase().contains(searchTerm),
            )
            .toList();
      }

      // Apply entry type filter
      if (event.entryType != null) {
        entries = entries
            .where((entry) => entry.type == event.entryType)
            .toList();
      }

      // Apply translation status filter
      if (event.isTranslated != null) {
        if (event.isTranslated!) {
          entries = entries.where((entry) => entry.value.isNotEmpty).toList();
        } else {
          entries = entries.where((entry) => entry.value.isEmpty).toList();
        }
      }

      // Apply validation issues filter
      if (event.hasIssues == true) {
        final validationResults = currentState.validationResults?[locale] ?? {};
        entries = entries
            .where((entry) => validationResults[entry.key]?.hasIssues == true)
            .toList();
      }

      filteredEntries[locale] = entries.map((e) => e.key).toList();
    }

    emit(
      currentState.copyWith(
        filteredEntries: filteredEntries,
        filter: filter,
        searchTerm: event.searchTerm,
      ),
    );
  }
}
