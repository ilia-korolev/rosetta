import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/translation_editor_bloc.dart';

/// Widget that displays validation results and issues
class ValidationPanelWidget extends StatelessWidget {
  const ValidationPanelWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TranslationEditorBloc, TranslationEditorState>(
      builder: (context, state) {
        if (state is! TranslationEditorLoadedState) {
          return const Center(
            child: Text(
              'No validation results',
              style: TextStyle(color: Colors.grey),
            ),
          );
        }

        final validationResults = state.validationResults ?? {};
        final allIssues = _collectAllIssues(validationResults);

        return Container(
          decoration: BoxDecoration(
            border: Border(
              left: BorderSide(color: Theme.of(context).dividerColor),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              _buildHeader(context, allIssues),

              // Issues list
              Expanded(
                child: allIssues.isEmpty
                    ? const Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.check_circle,
                              size: 64,
                              color: Colors.green,
                            ),
                            SizedBox(height: 16),
                            Text(
                              'No Issues Found',
                              style: TextStyle(
                                color: Colors.green,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'All translations are valid',
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                      )
                    : ListView.builder(
                        padding: const EdgeInsets.all(8),
                        itemCount: allIssues.length,
                        itemBuilder: (context, index) {
                          final issue = allIssues[index];
                          return _ValidationIssueCard(
                            issue: issue,
                            onTap: () => _navigateToIssue(context, issue),
                          );
                        },
                      ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildHeader(
    BuildContext context,
    List<ValidationIssueInfo> allIssues,
  ) {
    final theme = Theme.of(context);
    final errorCount = allIssues.where((i) => i.isError).length;
    final warningCount = allIssues.where((i) => !i.isError).length;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceVariant,
        border: Border(bottom: BorderSide(color: theme.dividerColor)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.bug_report),
              const SizedBox(width: 8),
              Text(
                'Validation',
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              if (errorCount > 0) ...[
                Icon(Icons.error, size: 16, color: Colors.red),
                const SizedBox(width: 4),
                Text('$errorCount errors', style: TextStyle(color: Colors.red)),
                if (warningCount > 0) const SizedBox(width: 16),
              ],
              if (warningCount > 0) ...[
                Icon(Icons.warning, size: 16, color: Colors.orange),
                const SizedBox(width: 4),
                Text(
                  '$warningCount warnings',
                  style: TextStyle(color: Colors.orange),
                ),
              ],
              if (errorCount == 0 && warningCount == 0)
                const Text('No issues', style: TextStyle(color: Colors.green)),
            ],
          ),
        ],
      ),
    );
  }

  List<ValidationIssueInfo> _collectAllIssues(
    Map<String, Map<String, dynamic>> validationResults,
  ) {
    final issues = <ValidationIssueInfo>[];

    for (final fileEntry in validationResults.entries) {
      final fileLocale = fileEntry.key;
      final fileResults = fileEntry.value;

      for (final entryResult in fileResults.entries) {
        final entryKey = entryResult.key;
        final validationResult = entryResult.value;

        // Add errors
        if (validationResult.errors != null) {
          for (final error in validationResult.errors) {
            issues.add(
              ValidationIssueInfo(
                fileLocale: fileLocale,
                entryKey: entryKey,
                message: error.message,
                code: error.code,
                isError: true,
                suggestion: error.suggestion,
              ),
            );
          }
        }

        // Add warnings
        if (validationResult.warnings != null) {
          for (final warning in validationResult.warnings) {
            issues.add(
              ValidationIssueInfo(
                fileLocale: fileLocale,
                entryKey: entryKey,
                message: warning.message,
                code: warning.code,
                isError: false,
                suggestion: warning.suggestion,
              ),
            );
          }
        }
      }
    }

    // Sort by severity (errors first) then by file and entry
    issues.sort((a, b) {
      if (a.isError != b.isError) {
        return a.isError ? -1 : 1;
      }
      final fileComparison = a.fileLocale.compareTo(b.fileLocale);
      if (fileComparison != 0) return fileComparison;
      return a.entryKey.compareTo(b.entryKey);
    });

    return issues;
  }

  void _navigateToIssue(BuildContext context, ValidationIssueInfo issue) {
    context.read<TranslationEditorBloc>().add(
      SelectEntryEvent(fileLocale: issue.fileLocale, entryKey: issue.entryKey),
    );
  }
}

/// Information about a validation issue
class ValidationIssueInfo {
  const ValidationIssueInfo({
    required this.fileLocale,
    required this.entryKey,
    required this.message,
    required this.code,
    required this.isError,
    this.suggestion,
  });

  final String fileLocale;
  final String entryKey;
  final String message;
  final String code;
  final bool isError;
  final String? suggestion;
}

/// Card widget for displaying a validation issue
class _ValidationIssueCard extends StatelessWidget {
  const _ValidationIssueCard({required this.issue, required this.onTap});

  final ValidationIssueInfo issue;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isError = issue.isError;
    final color = isError ? Colors.red : Colors.orange;

    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header with icon and entry info
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    isError ? Icons.error : Icons.warning,
                    size: 16,
                    color: color,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              issue.fileLocale.toUpperCase(),
                              style: theme.textTheme.labelSmall?.copyWith(
                                color: color,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Text(' • '),
                            Expanded(
                              child: Text(
                                issue.entryKey,
                                style: theme.textTheme.bodySmall?.copyWith(
                                  fontFamily: 'monospace',
                                  fontWeight: FontWeight.bold,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Text(issue.message, style: theme.textTheme.bodySmall),
                      ],
                    ),
                  ),
                ],
              ),

              // Suggestion if available
              if (issue.suggestion != null) ...[
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.blue.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(color: Colors.blue.withOpacity(0.3)),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.lightbulb_outline,
                        size: 16,
                        color: Colors.blue,
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          issue.suggestion!,
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: Colors.blue.shade700,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],

              // Code for debugging
              const SizedBox(height: 4),
              Text(
                'Code: ${issue.code}',
                style: theme.textTheme.bodySmall?.copyWith(
                  color: Colors.grey,
                  fontSize: 10,
                  fontFamily: 'monospace',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
