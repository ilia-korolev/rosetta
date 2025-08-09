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
import '../widgets/export_dialog_widget.dart';
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

  // Search state
  List<SearchResult> _searchResults = [];
  int _currentSearchIndex = -1;

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
                _updateSearchResults(value);
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
    final state = context.read<TranslationEditorBloc>().state;
    if (state is! TranslationEditorLoadedState) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('No files loaded to export'),
          backgroundColor: Colors.orange,
        ),
      );
      return;
    }

    showDialog(
      context: context,
      builder: (context) => ExportDialogWidget(
        locales: state.session.locales,
        onExport: _performExport,
      ),
    );
  }

  Future<void> _performExport(ExportOptions options) async {
    try {
      final state = context.read<TranslationEditorBloc>().state;
      if (state is! TranslationEditorLoadedState) return;

      // Show loading indicator
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Row(
              children: [
                const SizedBox(
                  width: 16,
                  height: 16,
                  child: CircularProgressIndicator(strokeWidth: 2),
                ),
                const SizedBox(width: 16),
                Text('Exporting ${options.selectedLocales.length} file(s)...'),
              ],
            ),
            duration: const Duration(seconds: 2),
          ),
        );
      }

      final repository = GetIt.instance<ArbFileRepository>();

      // Filter files for selected locales
      final filesToExport = <String, Map<String, dynamic>>{};
      for (final locale in options.selectedLocales) {
        final file = state.session.files[locale];
        if (file != null) {
          filesToExport[locale] = file as Map<String, dynamic>;
        }
      }

      // Perform export based on format
      for (final entry in filesToExport.entries) {
        final locale = entry.key;
        final file = entry.value;

        // Create output filename
        final filename = options.preserveStructure
            ? '${file['metadata']?['context'] ?? 'app'}_$locale.${options.format}'
            : 'translation_$locale.${options.format}';

        final outputPath = '${options.outputPath}/$filename';

        await repository.exportFile(
          file as dynamic,
          outputPath,
          options.format,
        );
      }

      // Create compressed archive if requested
      if (options.compress && options.format != 'arb') {
        // TODO: Implement ZIP compression
      }

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Successfully exported ${options.selectedLocales.length} file(s)',
            ),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Export failed: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  void _handleFindNext() {
    if (_searchResults.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('No search results found'),
          duration: Duration(seconds: 1),
        ),
      );
      return;
    }

    setState(() {
      _currentSearchIndex = (_currentSearchIndex + 1) % _searchResults.length;
    });

    final result = _searchResults[_currentSearchIndex];

    // Navigate to the entry
    context.read<TranslationEditorBloc>().add(
      SelectEntryEvent(fileLocale: result.locale, entryKey: result.entryKey),
    );

    // Show current position
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Result ${_currentSearchIndex + 1} of ${_searchResults.length}: ${result.entryKey}',
        ),
        duration: const Duration(seconds: 1),
      ),
    );
  }

  void _updateSearchResults(String searchTerm) {
    if (searchTerm.isEmpty) {
      setState(() {
        _searchResults.clear();
        _currentSearchIndex = -1;
      });
      return;
    }

    final state = context.read<TranslationEditorBloc>().state;
    if (state is! TranslationEditorLoadedState) return;

    final results = <SearchResult>[];
    final lowerSearchTerm = searchTerm.toLowerCase();

    // Search through all files and entries
    for (final fileEntry in state.session.files.entries) {
      final locale = fileEntry.key;
      final file = fileEntry.value;

      for (final entry in file.entries.values) {
        bool matches = false;
        String matchType = '';

        // Search in key
        if (entry.key.toLowerCase().contains(lowerSearchTerm)) {
          matches = true;
          matchType = 'key';
        }
        // Search in value
        else if (entry.value.toLowerCase().contains(lowerSearchTerm)) {
          matches = true;
          matchType = 'value';
        }
        // Search in description
        else if (entry.metadata?.description?.toLowerCase().contains(
              lowerSearchTerm,
            ) ??
            false) {
          matches = true;
          matchType = 'description';
        }

        if (matches) {
          results.add(
            SearchResult(
              locale: locale,
              entryKey: entry.key,
              matchType: matchType,
              preview: _createPreview(entry, lowerSearchTerm),
            ),
          );
        }
      }
    }

    setState(() {
      _searchResults = results;
      _currentSearchIndex = results.isNotEmpty ? 0 : -1;
    });
  }

  String _createPreview(dynamic entry, String searchTerm) {
    // Create a preview showing where the match was found
    final maxLength = 50;
    String text = entry.value as String;

    final index = text.toLowerCase().indexOf(searchTerm);
    if (index == -1) {
      return text.length > maxLength
          ? '${text.substring(0, maxLength)}...'
          : text;
    }

    final start = (index - 20).clamp(0, text.length);
    final end = (index + searchTerm.length + 20).clamp(0, text.length);

    String preview = text.substring(start, end);
    if (start > 0) preview = '...$preview';
    if (end < text.length) preview = '$preview...';

    return preview;
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

/// Search result for find functionality
class SearchResult {
  const SearchResult({
    required this.locale,
    required this.entryKey,
    required this.matchType,
    required this.preview,
  });

  final String locale;
  final String entryKey;
  final String matchType;
  final String preview;
}
