import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/translation_editor_bloc.dart';

/// Widget that displays tabs for each imported ARB file
class FileTabsWidget extends StatelessWidget {
  const FileTabsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TranslationEditorBloc, TranslationEditorState>(
      builder: (context, state) {
        if (state is! TranslationEditorLoadedState) {
          return const SizedBox.shrink();
        }

        final session = state.session;
        final locales = session.locales;

        if (locales.isEmpty) {
          return Container(
            height: 48,
            padding: const EdgeInsets.all(16),
            child: const Text(
              'No files loaded',
              style: TextStyle(color: Colors.grey),
            ),
          );
        }

        return Container(
          height: 48,
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(color: Theme.of(context).dividerColor),
            ),
          ),
          child: Row(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: locales.map((locale) {
                      final file = session.files[locale]!;
                      final isSelected = session.currentFileLocale == locale;
                      final hasUnsavedChanges = file.hasUnsavedChanges;

                      return _FileTab(
                        locale: locale,
                        fileName: file.fileName,
                        isSelected: isSelected,
                        hasUnsavedChanges: hasUnsavedChanges,
                        statistics: file.statistics,
                        onTap: () => _selectFile(context, locale),
                        onClose: locales.length > 1
                            ? () => _closeFile(context, locale)
                            : null,
                      );
                    }).toList(),
                  ),
                ),
              ),
              // Add file button
              IconButton(
                onPressed: () => _showAddFileDialog(context),
                icon: const Icon(Icons.add),
                tooltip: 'Add another ARB file',
              ),
            ],
          ),
        );
      },
    );
  }

  void _selectFile(BuildContext context, String locale) {
    final currentState = context.read<TranslationEditorBloc>().state;
    if (currentState is TranslationEditorLoadedState) {
      final firstEntryKey = currentState.session.files[locale]?.keys.first;
      if (firstEntryKey != null) {
        context.read<TranslationEditorBloc>().add(
          SelectEntryEvent(fileLocale: locale, entryKey: firstEntryKey),
        );
      }
    }
  }

  void _closeFile(BuildContext context, String locale) {
    // TODO: Implement file closing with unsaved changes check
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Close file functionality coming soon')),
    );
  }

  void _showAddFileDialog(BuildContext context) {
    // TODO: Implement add file dialog
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Add file functionality coming soon')),
    );
  }
}

/// Individual file tab widget
class _FileTab extends StatelessWidget {
  const _FileTab({
    required this.locale,
    required this.fileName,
    required this.isSelected,
    required this.hasUnsavedChanges,
    required this.onTap,
    this.statistics,
    this.onClose,
  });

  final String locale;
  final String fileName;
  final bool isSelected;
  final bool hasUnsavedChanges;
  final VoidCallback onTap;
  final VoidCallback? onClose;
  final dynamic statistics; // ArbFileStatistics?

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Material(
      color: isSelected
          ? colorScheme.surfaceContainerHighest
          : Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Container(
          constraints: const BoxConstraints(minWidth: 120, maxWidth: 200),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              // File icon and unsaved indicator
              Icon(
                Icons.description,
                size: 16,
                color: hasUnsavedChanges ? Colors.orange : null,
              ),
              const SizedBox(width: 8),

              // File info
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      locale.toUpperCase(),
                      style: theme.textTheme.labelMedium?.copyWith(
                        fontWeight: isSelected
                            ? FontWeight.bold
                            : FontWeight.normal,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    if (statistics != null)
                      Text(
                        '${statistics.translatedEntries}/${statistics.totalEntries}',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: theme.textTheme.bodySmall?.color?.withOpacity(
                            0.7,
                          ),
                        ),
                      ),
                  ],
                ),
              ),

              // Unsaved changes indicator
              if (hasUnsavedChanges)
                Container(
                  width: 8,
                  height: 8,
                  margin: const EdgeInsets.only(left: 4),
                  decoration: const BoxDecoration(
                    color: Colors.orange,
                    shape: BoxShape.circle,
                  ),
                ),

              // Close button
              if (onClose != null)
                IconButton(
                  onPressed: onClose,
                  icon: const Icon(Icons.close, size: 16),
                  constraints: const BoxConstraints(
                    minWidth: 24,
                    minHeight: 24,
                  ),
                  padding: EdgeInsets.zero,
                  tooltip: 'Close file',
                ),
            ],
          ),
        ),
      ),
    );
  }
}
