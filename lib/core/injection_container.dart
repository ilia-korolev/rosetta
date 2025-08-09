import 'package:get_it/get_it.dart';

import 'package:rosetta/features/features.dart';
import 'package:rosetta/core/core.dart';

final getIt = GetIt.instance;

/// Initialize dependency injection container
Future<void> initializeDependencies() async {
  // Core data sources
  getIt.registerLazySingleton<PreferencesDataSource>(
    () => const SharedPreferencesDataSource(),
  );

  // File/data sources
  getIt.registerLazySingleton<SessionStorageDataSource>(
    () => const SessionStorageDataSourceImpl(),
  );
  getIt.registerLazySingleton<BackupDataSource>(
    () => const BackupDataSourceImpl(),
  );

  // Feature data sources
  getIt.registerLazySingleton<ArbFileDataSource>(
    () => const ArbFileDataSource(),
  );

  getIt.registerLazySingleton<RecentFilesDataSource>(
    () => RecentFilesDataSourceImpl(getIt()),
  );

  getIt.registerLazySingleton<AutoSavePreferencesDataSource>(
    () => AutoSavePreferencesDataSourceImpl(getIt()),
  );

  // Repositories
  getIt.registerLazySingleton<ArbFileRepository>(
    () => ArbFileRepositoryImpl(
      getIt<ArbFileDataSource>(),
      getIt<RecentFilesDataSource>(),
      getIt<BackupDataSource>(),
    ),
  );

  getIt.registerLazySingleton<TranslationSessionRepository>(
    () => TranslationSessionRepositoryImpl(
      getIt<AutoSavePreferencesDataSource>(),
      getIt<SessionStorageDataSource>(),
    ),
  );

  // Use cases
  getIt.registerLazySingleton<ImportArbFileUseCase>(
    () => ImportArbFileUseCase(getIt()),
  );

  getIt.registerLazySingleton<ValidateIcuSyntaxUseCase>(
    () => const ValidateIcuSyntaxUseCase(),
  );

  getIt.registerLazySingleton<ParseIcuMessageUseCase>(
    () => const ParseIcuMessageUseCase(),
  );
}
