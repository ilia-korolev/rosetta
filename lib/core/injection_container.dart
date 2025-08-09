import 'package:get_it/get_it.dart';

import '../features/arb_management/arb_management.dart';
import 'data_sources/preferences_data_source.dart';

final getIt = GetIt.instance;

/// Initialize dependency injection container
Future<void> initializeDependencies() async {
  // Core data sources
  getIt.registerLazySingleton<PreferencesDataSource>(
    () => const SharedPreferencesDataSource(),
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
    () => ArbFileRepositoryImpl(getIt(), getIt()),
  );

  getIt.registerLazySingleton<TranslationSessionRepository>(
    () => TranslationSessionRepositoryImpl(getIt()),
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
