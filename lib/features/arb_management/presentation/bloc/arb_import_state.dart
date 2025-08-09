part of 'arb_import_bloc.dart';

/// States for ARB import
@MappableClass()
sealed class ArbImportState with ArbImportStateMappable {
  const ArbImportState();
}

@MappableClass()
class ArbImportInitialState extends ArbImportState
    with ArbImportInitialStateMappable {
  const ArbImportInitialState();
}

@MappableClass()
class ArbImportLoadingState extends ArbImportState
    with ArbImportLoadingStateMappable {
  const ArbImportLoadingState({required this.operation, this.progress});

  final String operation;
  final double? progress;
}

@MappableClass()
class ArbImportSuccessState extends ArbImportState
    with ArbImportSuccessStateMappable {
  const ArbImportSuccessState({
    required this.files,
    required this.validationResults,
    this.recentFiles,
  });

  final Map<String, ArbFile> files;
  final Map<String, ValidationResult> validationResults;
  final List<String>? recentFiles;

  /// Check if any files have validation issues
  bool get hasValidationIssues {
    return validationResults.values.any((result) => result.hasIssues);
  }

  /// Check if any files have critical issues
  bool get hasCriticalIssues {
    return validationResults.values.any((result) => result.hasCriticalIssues);
  }

  /// Get files with issues
  Map<String, ValidationResult> get filesWithIssues {
    return Map.fromEntries(
      validationResults.entries.where((entry) => entry.value.hasIssues),
    );
  }
}

@MappableClass()
class ArbImportErrorState extends ArbImportState
    with ArbImportErrorStateMappable {
  const ArbImportErrorState({
    required this.message,
    this.filePath,
    this.recentFiles,
  });

  final String message;
  final String? filePath;
  final List<String>? recentFiles;
}

@MappableClass()
class RecentFilesLoadedState extends ArbImportState
    with RecentFilesLoadedStateMappable {
  const RecentFilesLoadedState(this.recentFiles);

  final List<String> recentFiles;
}
