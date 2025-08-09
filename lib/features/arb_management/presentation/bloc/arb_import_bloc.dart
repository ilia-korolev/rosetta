import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:rosetta/features/features.dart';

part 'arb_import_bloc.mapper.dart';
part 'arb_import_event.dart';
part 'arb_import_state.dart';

/// BLoC for handling ARB file import
class ArbImportBloc extends Bloc<ArbImportEvent, ArbImportState> {
  ArbImportBloc({required ImportArbFileUseCase importUseCase})
    : _importUseCase = importUseCase,
      super(const ArbImportInitialState()) {
    on<ImportSingleFileEvent>(_onImportSingleFile);
    on<ImportMultipleFilesEvent>(_onImportMultipleFiles);
    on<LoadRecentFilesEvent>(_onLoadRecentFiles);
    on<ImportFromRecentEvent>(_onImportFromRecent);
    on<ClearImportEvent>(_onClearImport);
  }

  final ImportArbFileUseCase _importUseCase;

  /// Handle single file import
  Future<void> _onImportSingleFile(
    ImportSingleFileEvent event,
    Emitter<ArbImportState> emit,
  ) async {
    emit(const ArbImportLoadingState(operation: 'Importing file...'));

    try {
      final result = await _importUseCase(event.filePath);

      if (result.isSuccess &&
          result.file != null &&
          result.validationResult != null) {
        final files = {result.file!.locale: result.file!};
        final validationResults = {
          result.file!.locale: result.validationResult!,
        };

        // Load recent files
        final recentFiles = await _importUseCase.getRecentFiles();

        emit(
          ArbImportSuccessState(
            files: files,
            validationResults: validationResults,
            recentFiles: recentFiles,
          ),
        );
      } else {
        emit(
          ArbImportErrorState(
            message: result.errorMessage ?? 'Unknown import error',
            filePath: event.filePath,
          ),
        );
      }
    } catch (e) {
      emit(
        ArbImportErrorState(
          message: 'Failed to import file: $e',
          filePath: event.filePath,
        ),
      );
    }
  }

  /// Handle multiple files import
  Future<void> _onImportMultipleFiles(
    ImportMultipleFilesEvent event,
    Emitter<ArbImportState> emit,
  ) async {
    emit(const ArbImportLoadingState(operation: 'Importing files...'));

    try {
      final result = await _importUseCase.importMultiple(event.filePaths);

      if (result.isSuccess &&
          result.files != null &&
          result.validationResults != null) {
        // Load recent files
        final recentFiles = await _importUseCase.getRecentFiles();

        emit(
          ArbImportSuccessState(
            files: result.files!,
            validationResults: result.validationResults!,
            recentFiles: recentFiles,
          ),
        );
      } else {
        emit(
          ArbImportErrorState(
            message: result.errorMessage ?? 'Unknown import error',
          ),
        );
      }
    } catch (e) {
      emit(ArbImportErrorState(message: 'Failed to import files: $e'));
    }
  }

  /// Handle loading recent files
  Future<void> _onLoadRecentFiles(
    LoadRecentFilesEvent event,
    Emitter<ArbImportState> emit,
  ) async {
    try {
      final recentFiles = await _importUseCase.getRecentFiles();
      emit(RecentFilesLoadedState(recentFiles));
    } catch (e) {
      emit(ArbImportErrorState(message: 'Failed to load recent files: $e'));
    }
  }

  /// Handle import from recent files
  Future<void> _onImportFromRecent(
    ImportFromRecentEvent event,
    Emitter<ArbImportState> emit,
  ) async {
    add(ImportSingleFileEvent(event.filePath));
  }

  /// Handle clearing import state
  void _onClearImport(ClearImportEvent event, Emitter<ArbImportState> emit) {
    emit(const ArbImportInitialState());
  }
}
