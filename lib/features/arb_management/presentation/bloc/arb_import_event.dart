part of 'arb_import_bloc.dart';

/// Events for ARB import
@MappableClass()
sealed class ArbImportEvent with ArbImportEventMappable {
  const ArbImportEvent();
}

@MappableClass()
class ImportSingleFileEvent extends ArbImportEvent
    with ImportSingleFileEventMappable {
  const ImportSingleFileEvent(this.filePath);

  final String filePath;
}

@MappableClass()
class ImportMultipleFilesEvent extends ArbImportEvent
    with ImportMultipleFilesEventMappable {
  const ImportMultipleFilesEvent(this.filePaths);

  final List<String> filePaths;
}

@MappableClass()
class LoadRecentFilesEvent extends ArbImportEvent
    with LoadRecentFilesEventMappable {
  const LoadRecentFilesEvent();
}

@MappableClass()
class ImportFromRecentEvent extends ArbImportEvent
    with ImportFromRecentEventMappable {
  const ImportFromRecentEvent(this.filePath);

  final String filePath;
}

@MappableClass()
class ClearImportEvent extends ArbImportEvent with ClearImportEventMappable {
  const ClearImportEvent();
}
