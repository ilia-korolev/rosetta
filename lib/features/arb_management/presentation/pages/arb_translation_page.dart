import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../domain/use_cases/import_arb_file_use_case.dart';
import '../../domain/use_cases/validate_icu_syntax_use_case.dart';
import '../../domain/repositories/arb_file_repository.dart';
import '../../domain/repositories/translation_session_repository.dart'
    as session_repo;
import '../bloc/arb_import_bloc.dart';
import '../bloc/translation_editor_bloc.dart';
import '../widgets/arb_file_import_widget.dart';
import '../widgets/translation_table_widget.dart';
import '../widgets/undo_redo_toolbar_widget.dart';
import '../widgets/file_tabs_widget.dart';
import '../widgets/translation_entry_editor_widget.dart';
import '../widgets/validation_panel_widget.dart';

/// Main page for ARB translation management
class ArbTranslationPage extends StatefulWidget {
  const ArbTranslationPage({super.key});

  @override
  State<ArbTranslationPage> createState() => _ArbTranslationPageState();
}

class _ArbTranslationPageState extends State<ArbTranslationPage> {
  final _searchController = TextEditingController();
  bool _showValidationPanel = false;

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ArbImportBloc>(
          create: (context) => ArbImportBloc(
            importUseCase: GetIt.instance<ImportArbFileUseCase>(),
          ),
        ),
        BlocProvider<TranslationEditorBloc>(
          create: (context) => TranslationEditorBloc(
            arbFileRepository: GetIt.instance<ArbFileRepository>(),
            sessionRepository:
                GetIt.instance<session_repo.TranslationSessionRepository>(),
            validateIcuSyntaxUseCase:
                GetIt.instance<ValidateIcuSyntaxUseCase>(),
          ),
        ),
      ],
      child: CallbackShortcuts(
        bindings: {
          const SingleActivator(LogicalKeyboardKey.keyO, control: true): () =>
              _handleImport(),
          const SingleActivator(LogicalKeyboardKey.keyS, control: true): () =>
              _handleSave(),
          const SingleActivator(LogicalKeyboardKey.keyZ, control: true): () =>
              _handleUndo(),
          const SingleActivator(LogicalKeyboardKey.keyY, control: true): () =>
              _handleRedo(),
          const SingleActivator(LogicalKeyboardKey.keyE, control: true): () =>
              _handleExport(),
          const SingleActivator(LogicalKeyboardKey.f3): () => _handleFindNext(),
        },
        child: Focus(
          autofocus: true,
          child: Scaffold(
            appBar: _buildAppBar(),
            body: _buildBody(),
            bottomNavigationBar: _buildStatusBar(),
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      title: const Text('Rosetta - ARB Translation Manager'),
      actions: [
        IconButton(
          onPressed: _handleImport,
          icon: const Icon(Icons.folder_open),
          tooltip: 'Import ARB Files (Ctrl+O)',
        ),
        const SizedBox(width: 8),
        UndoRedoToolbarWidget(),
        const SizedBox(width: 8),
        IconButton(
          onPressed: _handleSave,
          icon: const Icon(Icons.save),
          tooltip: 'Save All (Ctrl+S)',
        ),
        IconButton(
          onPressed: _handleExport,
          icon: const Icon(Icons.download),
          tooltip: 'Export Files (Ctrl+E)',
        ),
        const SizedBox(width: 8),
        IconButton(
          onPressed: () =>
              setState(() => _showValidationPanel = !_showValidationPanel),
          icon: Icon(
            _showValidationPanel ? Icons.bug_report : Icons.bug_report_outlined,
          ),
          tooltip: 'Toggle Validation Panel',
        ),
        const SizedBox(width: 16),
      ],
    );
  }

  Widget _buildBody() {
    return BlocListener<ArbImportBloc, ArbImportState>(
      listener: (context, state) {
        if (state is ArbImportSuccessState) {
          // Initialize translation session with imported files
          context.read<TranslationEditorBloc>().add(
            InitializeSessionEvent(state.files),
          );

          // Show validation issues if any
          if (state.hasValidationIssues) {
            setState(() => _showValidationPanel = true);
          }
        } else if (state is ArbImportErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message), backgroundColor: Colors.red),
          );
        }
      },
      child: Column(
        children: [
          // Search and filter bar
          _buildSearchBar(),

          // File tabs
          const FileTabsWidget(),

          // Main content area
          Expanded(
            child: Row(
              children: [
                // Translation table
                Expanded(flex: 3, child: const TranslationTableWidget()),

                // Entry editor
                Expanded(flex: 2, child: const TranslationEntryEditorWidget()),

                // Validation panel (collapsible)
                if (_showValidationPanel)
                  const SizedBox(width: 300, child: ValidationPanelWidget()),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Theme.of(context).dividerColor),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                hintText: 'Search translations...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
                isDense: true,
              ),
              onChanged: (value) {
                context.read<TranslationEditorBloc>().add(
                  FilterEntriesEvent(searchTerm: value),
                );
              },
            ),
          ),
          const SizedBox(width: 8),

          // Filter dropdown for entry types
          DropdownButton<String>(
            hint: const Text('Type'),
            items: const [
              DropdownMenuItem(value: null, child: Text('All Types')),
              DropdownMenuItem(value: 'simple', child: Text('Simple')),
              DropdownMenuItem(value: 'plural', child: Text('Plural')),
              DropdownMenuItem(value: 'select', child: Text('Select')),
              DropdownMenuItem(
                value: 'withPlaceholders',
                child: Text('With Placeholders'),
              ),
              DropdownMenuItem(
                value: 'withDateFormat',
                child: Text('Date Format'),
              ),
              DropdownMenuItem(
                value: 'withNumberFormat',
                child: Text('Number Format'),
              ),
            ],
            onChanged: (value) {
              // Convert string to enum and filter
            },
          ),
          const SizedBox(width: 8),

          // Filter dropdown for translation status
          DropdownButton<String>(
            hint: const Text('Status'),
            items: const [
              DropdownMenuItem(value: null, child: Text('All')),
              DropdownMenuItem(value: 'translated', child: Text('Translated')),
              DropdownMenuItem(
                value: 'untranslated',
                child: Text('Untranslated'),
              ),
              DropdownMenuItem(value: 'issues', child: Text('Has Issues')),
            ],
            onChanged: (value) {
              bool? isTranslated;
              bool? hasIssues;

              switch (value) {
                case 'translated':
                  isTranslated = true;
                  break;
                case 'untranslated':
                  isTranslated = false;
                  break;
                case 'issues':
                  hasIssues = true;
                  break;
              }

              context.read<TranslationEditorBloc>().add(
                FilterEntriesEvent(
                  isTranslated: isTranslated,
                  hasIssues: hasIssues,
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildStatusBar() {
    return BlocBuilder<TranslationEditorBloc, TranslationEditorState>(
      builder: (context, state) {
        if (state is! TranslationEditorLoadedState) {
          return const SizedBox.shrink();
        }

        final session = state.session;
        final statistics = session.calculateStatistics();

        return Container(
          height: 32,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(color: Theme.of(context).dividerColor),
            ),
          ),
          child: Row(
            children: [
              Text('Files: ${session.locales.length}'),
              const SizedBox(width: 16),
              Text('Changes: ${statistics.totalChanges}'),
              const SizedBox(width: 16),
              Text('Duration: ${_formatDuration(statistics.sessionDuration)}'),
              const Spacer(),
              if (session.hasUnsavedChanges)
                const Row(
                  children: [
                    Icon(Icons.circle, size: 8, color: Colors.orange),
                    SizedBox(width: 4),
                    Text('Unsaved changes'),
                  ],
                )
              else
                const Row(
                  children: [
                    Icon(Icons.check_circle, size: 16, color: Colors.green),
                    SizedBox(width: 4),
                    Text('Saved'),
                  ],
                ),
            ],
          ),
        );
      },
    );
  }

  void _handleImport() {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        child: SizedBox(width: 600, height: 400, child: ArbFileImportWidget()),
      ),
    );
  }

  void _handleSave() {
    context.read<TranslationEditorBloc>().add(const SaveSessionEvent());
  }

  void _handleUndo() {
    context.read<TranslationEditorBloc>().add(const UndoEvent());
  }

  void _handleRedo() {
    context.read<TranslationEditorBloc>().add(const RedoEvent());
  }

  void _handleExport() {
    // TODO: Implement export dialog
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Export functionality coming soon')),
    );
  }

  void _handleFindNext() {
    // TODO: Implement find next functionality
    if (_searchController.text.isNotEmpty) {
      // Navigate to next search result
    }
  }

  String _formatDuration(Duration duration) {
    final hours = duration.inHours;
    final minutes = duration.inMinutes.remainder(60);
    final seconds = duration.inSeconds.remainder(60);

    if (hours > 0) {
      return '${hours}h ${minutes}m ${seconds}s';
    } else if (minutes > 0) {
      return '${minutes}m ${seconds}s';
    } else {
      return '${seconds}s';
    }
  }
}
