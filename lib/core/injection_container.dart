import 'package:get_it/get_it.dart';

import '../features/arb_management/arb_management.dart';

final getIt = GetIt.instance;

/// Initialize dependency injection container
Future<void> initializeDependencies() async {
  // Data sources
  getIt.registerLazySingleton<ArbFileDataSource>(
    () => const ArbFileDataSource(),
  );

  // Repositories
  getIt.registerLazySingleton<ArbFileRepository>(
    () => ArbFileRepositoryImpl(getIt()),
  );

  getIt.registerLazySingleton<TranslationSessionRepository>(
    () => const TranslationSessionRepositoryImpl(),
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
