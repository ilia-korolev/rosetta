import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:rosetta/features/features.dart';

/// Widget that displays a table of translation entries
class TranslationTableWidget extends StatelessWidget {
  const TranslationTableWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TranslationEditorBloc, TranslationEditorState>(
      builder: (context, state) {
        if (state is! TranslationEditorLoadedState) {
          return const Center(
            child: Text(
              'No translation session loaded',
              style: TextStyle(color: Colors.grey),
            ),
          );
        }

        final currentFile = state.currentFile;
        if (currentFile == null) {
          return const Center(
            child: Text(
              'No file selected',
              style: TextStyle(color: Colors.grey),
            ),
          );
        }

        final entryKeys = state.currentFileEntries;
        if (entryKeys.isEmpty) {
          return const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.translate, size: 64, color: Colors.grey),
                SizedBox(height: 16),
                Text(
                  'No translation entries found',
                  style: TextStyle(color: Colors.grey, fontSize: 18),
                ),
                Text(
                  'Import an ARB file to get started',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          );
        }

        return Column(
          children: [
            // Table header
            _buildTableHeader(context),

            // Table content
            Expanded(
              child: ListView.builder(
                itemCount: entryKeys.length,
                itemBuilder: (context, index) {
                  final entryKey = entryKeys[index];
                  final entry = currentFile.getEntry(entryKey);

                  if (entry == null) return const SizedBox.shrink();

                  return _TranslationTableRow(
                    entry: entry,
                    isSelected: state.session.selectedEntryKey == entryKey,
                    validationResult:
                        state.validationResults?[state
                            .session
                            .currentFileLocale]?[entryKey],
                    onTap: () => _selectEntry(
                      context,
                      state.session.currentFileLocale!,
                      entryKey,
                    ),
                    onEdit: (newValue) => _updateEntry(
                      context,
                      state.session.currentFileLocale!,
                      entryKey,
                      newValue,
                    ),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildTableHeader(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      height: 48,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHighest,
        border: Border(bottom: BorderSide(color: theme.dividerColor)),
      ),
      child: Row(
        children: [
          const SizedBox(width: 24), // Icon space
          const SizedBox(
            width: 200,
            child: Text('Key', style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          const SizedBox(width: 16),
          const Expanded(
            child: Text(
              'Translation',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(width: 16),
          const SizedBox(
            width: 80,
            child: Text('Type', style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          const SizedBox(width: 16),
          const SizedBox(
            width: 60,
            child: Text(
              'Status',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  void _selectEntry(BuildContext context, String fileLocale, String entryKey) {
    context.read<TranslationEditorBloc>().add(
      SelectEntryEvent(fileLocale: fileLocale, entryKey: entryKey),
    );
  }

  void _updateEntry(
    BuildContext context,
    String fileLocale,
    String entryKey,
    String newValue,
  ) {
    context.read<TranslationEditorBloc>().add(
      UpdateEntryValueEvent(
        fileLocale: fileLocale,
        entryKey: entryKey,
        newValue: newValue,
      ),
    );
  }
}

/// Individual row in the translation table
class _TranslationTableRow extends StatefulWidget {
  const _TranslationTableRow({
    required this.entry,
    required this.isSelected,
    required this.onTap,
    required this.onEdit,
    this.validationResult,
  });

  final ArbEntry entry;
  final bool isSelected;
  final VoidCallback onTap;
  final ValueChanged<String> onEdit;
  final dynamic validationResult; // IcuValidationResult?

  @override
  State<_TranslationTableRow> createState() => _TranslationTableRowState();
}

class _TranslationTableRowState extends State<_TranslationTableRow> {
  late TextEditingController _controller;
  bool _isEditing = false;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.entry.value);
  }

  @override
  void didUpdateWidget(_TranslationTableRow oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.entry.value != widget.entry.value) {
      _controller.text = widget.entry.value;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final hasIssues = widget.validationResult?.hasIssues == true;
    final hasCriticalIssues =
        widget.validationResult?.hasCriticalIssues == true;

    return Material(
      color: widget.isSelected
          ? theme.colorScheme.primaryContainer.withOpacity(0.3)
          : Colors.transparent,
      child: InkWell(
        onTap: widget.onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(color: theme.dividerColor.withOpacity(0.5)),
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Type/status icon
              _buildStatusIcon(theme, hasIssues, hasCriticalIssues),

              // Key
              SizedBox(
                width: 200,
                child: SelectableText(
                  widget.entry.key,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontFamily: 'monospace',
                    fontWeight: widget.isSelected
                        ? FontWeight.bold
                        : FontWeight.normal,
                  ),
                ),
              ),
              const SizedBox(width: 16),

              // Translation value
              Expanded(
                child: _isEditing
                    ? _buildEditField(theme)
                    : _buildDisplayValue(theme),
              ),
              const SizedBox(width: 16),

              // Entry type
              SizedBox(width: 80, child: _buildTypeChip(theme)),
              const SizedBox(width: 16),

              // Status indicators
              SizedBox(
                width: 60,
                child: _buildStatusIndicators(
                  theme,
                  hasIssues,
                  hasCriticalIssues,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatusIcon(
    ThemeData theme,
    bool hasIssues,
    bool hasCriticalIssues,
  ) {
    IconData icon;
    Color? color;

    if (hasCriticalIssues) {
      icon = Icons.error;
      color = Colors.red;
    } else if (hasIssues) {
      icon = Icons.warning;
      color = Colors.orange;
    } else if (widget.entry.value.isEmpty) {
      icon = Icons.radio_button_unchecked;
      color = Colors.grey;
    } else {
      icon = Icons.check_circle;
      color = Colors.green;
    }

    return SizedBox(width: 24, child: Icon(icon, size: 16, color: color));
  }

  Widget _buildEditField(ThemeData theme) {
    return TextField(
      controller: _controller,
      autofocus: true,
      maxLines: null,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        isDense: true,
      ),
      onSubmitted: (value) {
        widget.onEdit(value);
        setState(() => _isEditing = false);
      },
      onEditingComplete: () {
        widget.onEdit(_controller.text);
        setState(() => _isEditing = false);
      },
    );
  }

  Widget _buildDisplayValue(ThemeData theme) {
    return GestureDetector(
      onDoubleTap: () => setState(() => _isEditing = true),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: widget.entry.value.isEmpty
            ? Text(
                '(empty)',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: Colors.grey,
                  fontStyle: FontStyle.italic,
                ),
              )
            : SelectableText(
                widget.entry.value,
                style: theme.textTheme.bodyMedium,
              ),
      ),
    );
  }

  Widget _buildTypeChip(ThemeData theme) {
    Color chipColor;
    String label;

    switch (widget.entry.type) {
      case ArbEntryType.simple:
        chipColor = Colors.blue;
        label = 'Simple';
        break;
      case ArbEntryType.plural:
        chipColor = Colors.purple;
        label = 'Plural';
        break;
      case ArbEntryType.select:
        chipColor = Colors.orange;
        label = 'Select';
        break;
      case ArbEntryType.compound:
        chipColor = Colors.red;
        label = 'Compound';
        break;
      case ArbEntryType.withPlaceholders:
        chipColor = Colors.green;
        label = 'Params';
        break;
      case ArbEntryType.withDateFormat:
        chipColor = Colors.teal;
        label = 'Date';
        break;
      case ArbEntryType.withNumberFormat:
        chipColor = Colors.indigo;
        label = 'Number';
        break;
    }

    return Chip(
      label: Text(label, style: const TextStyle(fontSize: 10)),
      backgroundColor: chipColor.withOpacity(0.2),
      side: BorderSide(color: chipColor),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      visualDensity: VisualDensity.compact,
    );
  }

  Widget _buildStatusIndicators(
    ThemeData theme,
    bool hasIssues,
    bool hasCriticalIssues,
  ) {
    final indicators = <Widget>[];

    if (widget.entry.value.isEmpty) {
      indicators.add(Icon(Icons.circle_outlined, size: 12, color: Colors.grey));
    } else {
      indicators.add(Icon(Icons.circle, size: 12, color: Colors.green));
    }

    if (widget.entry.hasPlaceholders) {
      indicators.add(Icon(Icons.code, size: 12, color: Colors.blue));
    }

    if (hasCriticalIssues) {
      indicators.add(Icon(Icons.error, size: 12, color: Colors.red));
    } else if (hasIssues) {
      indicators.add(Icon(Icons.warning, size: 12, color: Colors.orange));
    }

    return Wrap(spacing: 2, children: indicators);
  }
}
