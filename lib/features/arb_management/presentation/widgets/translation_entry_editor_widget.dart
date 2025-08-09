import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/arb_entry.dart';
import '../bloc/translation_editor_bloc.dart';

/// Widget for editing individual translation entries with ICU support
class TranslationEntryEditorWidget extends StatefulWidget {
  const TranslationEntryEditorWidget({super.key});

  @override
  State<TranslationEntryEditorWidget> createState() => _TranslationEntryEditorWidgetState();
}

class _TranslationEntryEditorWidgetState extends State<TranslationEntryEditorWidget> {
  late TextEditingController _valueController;
  late TextEditingController _descriptionController;
  
  ArbEntry? _currentEntry;

  @override
  void initState() {
    super.initState();
    _valueController = TextEditingController();
    _descriptionController = TextEditingController();
  }

  @override
  void dispose() {
    _valueController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<TranslationEditorBloc, TranslationEditorState>(
      listener: (context, state) {
        if (state is TranslationEditorLoadedState) {
          final selectedEntry = state.selectedEntry;
          if (selectedEntry != _currentEntry) {
            _currentEntry = selectedEntry;
            _valueController.text = selectedEntry?.value ?? '';
            _descriptionController.text = selectedEntry?.metadata?.description ?? '';
          }
        }
      },
      child: BlocBuilder<TranslationEditorBloc, TranslationEditorState>(
        builder: (context, state) {
          if (state is! TranslationEditorLoadedState || state.selectedEntry == null) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.edit_note, size: 64, color: Colors.grey),
                  SizedBox(height: 16),
                  Text(
                    'Select an entry to edit',
                    style: TextStyle(color: Colors.grey, fontSize: 18),
                  ),
                  Text(
                    'Choose a translation key from the table',
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            );
          }

          final entry = state.selectedEntry!;
          final validationResult = state.currentEntryValidation;

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Entry header
                _buildEntryHeader(context, entry),
                const SizedBox(height: 16),

                // Value editor
                _buildValueEditor(context, entry, validationResult),
                const SizedBox(height: 16),

                // Metadata editor
                _buildMetadataEditor(context, entry),
                const SizedBox(height: 16),

                // Placeholders section
                if (entry.hasPlaceholders) ...[
                  _buildPlaceholdersSection(context, entry),
                  const SizedBox(height: 16),
                ],

                // ICU cases section
                if (entry.isPlural || entry.isSelect) ...[
                  _buildIcuCasesSection(context, entry),
                  const SizedBox(height: 16),
                ],

                // Validation results
                if (validationResult != null && validationResult.hasIssues) ...[
                  _buildValidationSection(context, validationResult),
                  const SizedBox(height: 16),
                ],

                // Action buttons
                _buildActionButtons(context, state),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildEntryHeader(BuildContext context, ArbEntry entry) {
    final theme = Theme.of(context);
    
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  _getEntryTypeIcon(entry.type),
                  color: theme.colorScheme.primary,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    entry.key,
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontFamily: 'monospace',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Chip(
                  label: Text(
                    entry.type.name,
                    style: const TextStyle(fontSize: 12),
                  ),
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
              ],
            ),
            if (entry.hasPlaceholders) ...[
              const SizedBox(height: 8),
              Wrap(
                spacing: 4,
                children: entry.placeholderNames.map((name) => 
                  Chip(
                    label: Text('{$name}', style: const TextStyle(fontSize: 10)),
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    visualDensity: VisualDensity.compact,
                  ),
                ).toList(),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildValueEditor(BuildContext context, ArbEntry entry, dynamic validationResult) {
    final theme = Theme.of(context);
    final hasErrors = validationResult?.hasCriticalIssues == true;
    
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Translation Value',
              style: theme.textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _valueController,
              maxLines: null,
              decoration: InputDecoration(
                hintText: 'Enter translation...',
                border: const OutlineInputBorder(),
                errorText: hasErrors ? 'Translation has critical errors' : null,
              ),
              onChanged: (value) => _updateValue(context, value),
            ),
            if (entry.type != ArbEntryType.simple) ...[
              const SizedBox(height: 8),
              Text(
                _getIcuHint(entry.type),
                style: theme.textTheme.bodySmall?.copyWith(
                  color: Colors.grey[600],
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildMetadataEditor(BuildContext context, ArbEntry entry) {
    final theme = Theme.of(context);
    
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Description',
              style: theme.textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _descriptionController,
              maxLines: 2,
              decoration: const InputDecoration(
                hintText: 'Add description for translators...',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) => _updateDescription(context, value),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPlaceholdersSection(BuildContext context, ArbEntry entry) {
    final theme = Theme.of(context);
    
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Placeholders',
              style: theme.textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            ...entry.placeholders!.entries.map((placeholder) => 
              _buildPlaceholderItem(context, placeholder.key, placeholder.value),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPlaceholderItem(BuildContext context, String name, ArbPlaceholder placeholder) {
    final theme = Theme.of(context);
    
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          SizedBox(
            width: 100,
            child: Text(
              '{$name}',
              style: theme.textTheme.bodyMedium?.copyWith(
                fontFamily: 'monospace',
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Chip(
            label: Text(
              placeholder.type.typeName,
              style: const TextStyle(fontSize: 10),
            ),
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            visualDensity: VisualDensity.compact,
          ),
          if (placeholder.format != null) ...[
            const SizedBox(width: 8),
            Chip(
              label: Text(
                placeholder.format!,
                style: const TextStyle(fontSize: 10),
              ),
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              visualDensity: VisualDensity.compact,
            ),
          ],
          if (placeholder.description != null) ...[
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                placeholder.description!,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: Colors.grey[600],
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildIcuCasesSection(BuildContext context, ArbEntry entry) {
    final theme = Theme.of(context);
    
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              entry.isPlural ? 'Plural Cases' : 'Select Cases',
              style: theme.textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            if (entry.pluralCases != null)
              ...entry.pluralCases!.map((icuCase) => 
                _buildIcuCaseItem(context, icuCase),
              ),
            if (entry.selectCases != null)
              ...entry.selectCases!.map((icuCase) => 
                _buildIcuCaseItem(context, icuCase),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildIcuCaseItem(BuildContext context, IcuCase icuCase) {
    final theme = Theme.of(context);
    
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 80,
            child: Chip(
              label: Text(
                icuCase.selector,
                style: const TextStyle(fontSize: 10),
              ),
              backgroundColor: icuCase.isRequired ? Colors.orange.withOpacity(0.2) : null,
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              visualDensity: VisualDensity.compact,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              icuCase.message,
              style: theme.textTheme.bodyMedium?.copyWith(
                fontFamily: 'monospace',
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildValidationSection(BuildContext context, dynamic validationResult) {
    final theme = Theme.of(context);
    
    return Card(
      color: Colors.red.withOpacity(0.1),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.error, color: Colors.red),
                const SizedBox(width: 8),
                Text(
                  'Validation Issues',
                  style: theme.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            if (validationResult.errors.isNotEmpty)
              ...validationResult.errors.map((error) => 
                _buildValidationItem(context, error.message, Colors.red, true),
              ),
            if (validationResult.warnings.isNotEmpty)
              ...validationResult.warnings.map((warning) => 
                _buildValidationItem(context, warning.message, Colors.orange, false),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildValidationItem(BuildContext context, String message, Color color, bool isError) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            isError ? Icons.error : Icons.warning,
            size: 16,
            color: color,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              message,
              style: TextStyle(color: color),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButtons(BuildContext context, TranslationEditorLoadedState state) {
    return Row(
      children: [
        ElevatedButton.icon(
          onPressed: () => _validateEntry(context, state),
          icon: const Icon(Icons.check_circle),
          label: const Text('Validate'),
        ),
        const SizedBox(width: 8),
        OutlinedButton.icon(
          onPressed: () => _resetEntry(context),
          icon: const Icon(Icons.refresh),
          label: const Text('Reset'),
        ),
        const Spacer(),
        if (state.session.selectedEntryKey != null)
          IconButton(
            onPressed: () => _deleteEntry(context, state),
            icon: const Icon(Icons.delete),
            tooltip: 'Delete entry',
            color: Colors.red,
          ),
      ],
    );
  }

  IconData _getEntryTypeIcon(ArbEntryType type) {
    switch (type) {
      case ArbEntryType.simple:
        return Icons.text_fields;
      case ArbEntryType.plural:
        return Icons.format_list_numbered;
      case ArbEntryType.select:
        return Icons.list;
      case ArbEntryType.compound:
        return Icons.account_tree;
      case ArbEntryType.withPlaceholders:
        return Icons.code;
      case ArbEntryType.withDateFormat:
        return Icons.calendar_today;
      case ArbEntryType.withNumberFormat:
        return Icons.numbers;
    }
  }

  String _getIcuHint(ArbEntryType type) {
    switch (type) {
      case ArbEntryType.plural:
        return 'Use ICU plural syntax: {count, plural, =0{no items} =1{one item} other{# items}}';
      case ArbEntryType.select:
        return 'Use ICU select syntax: {gender, select, male{he} female{she} other{they}}';
      case ArbEntryType.withDateFormat:
        return 'Use date placeholders: {date, date, yMd} or {time, time, Hm}';
      case ArbEntryType.withNumberFormat:
        return 'Use number placeholders: {amount, number, currency} or {count, number, compact}';
      default:
        return '';
    }
  }

  void _updateValue(BuildContext context, String value) {
    final state = context.read<TranslationEditorBloc>().state;
    if (state is TranslationEditorLoadedState && 
        state.session.selectedEntryKey != null &&
        state.session.currentFileLocale != null) {
      context.read<TranslationEditorBloc>().add(
        UpdateEntryValueEvent(
          fileLocale: state.session.currentFileLocale!,
          entryKey: state.session.selectedEntryKey!,
          newValue: value,
        ),
      );
    }
  }

  void _updateDescription(BuildContext context, String description) {
    // TODO: Implement description update
    // This would require updating the entry's metadata
  }

  void _validateEntry(BuildContext context, TranslationEditorLoadedState state) {
    if (state.session.selectedEntryKey != null && state.session.currentFileLocale != null) {
      context.read<TranslationEditorBloc>().add(
        ValidateEntryEvent(
          fileLocale: state.session.currentFileLocale!,
          entryKey: state.session.selectedEntryKey!,
        ),
      );
    }
  }

  void _resetEntry(BuildContext context) {
    final state = context.read<TranslationEditorBloc>().state;
    if (state is TranslationEditorLoadedState && state.selectedEntry != null) {
      _valueController.text = state.selectedEntry!.value;
      _descriptionController.text = state.selectedEntry!.metadata?.description ?? '';
    }
  }

  void _deleteEntry(BuildContext context, TranslationEditorLoadedState state) {
    if (state.session.selectedEntryKey != null && state.session.currentFileLocale != null) {
      // Show confirmation dialog
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Delete Entry'),
          content: Text('Are you sure you want to delete "${state.session.selectedEntryKey}"?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                context.read<TranslationEditorBloc>().add(
                  DeleteEntryEvent(
                    fileLocale: state.session.currentFileLocale!,
                    entryKey: state.session.selectedEntryKey!,
                  ),
                );
              },
              child: const Text('Delete'),
            ),
          ],
        ),
      );
    }
  }
}
