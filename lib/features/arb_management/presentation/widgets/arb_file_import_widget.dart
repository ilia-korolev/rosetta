import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:file_picker/file_picker.dart';

import 'package:rosetta/features/features.dart';

/// Widget for importing ARB files
class ArbFileImportWidget extends StatefulWidget {
  const ArbFileImportWidget({super.key});

  @override
  State<ArbFileImportWidget> createState() => _ArbFileImportWidgetState();
}

class _ArbFileImportWidgetState extends State<ArbFileImportWidget> {
  @override
  void initState() {
    super.initState();
    // Load recent files when widget initializes
    context.read<ArbImportBloc>().add(const LoadRecentFilesEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.file_open, size: 32),
              const SizedBox(width: 12),
              const Text(
                'Import ARB Files',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: const Icon(Icons.close),
              ),
            ],
          ),
          const SizedBox(height: 24),

          // Import options
          Row(
            children: [
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: _importSingleFile,
                  icon: const Icon(Icons.file_open),
                  label: const Text('Import Single File'),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: _importMultipleFiles,
                  icon: const Icon(Icons.folder_open),
                  label: const Text('Import Multiple Files'),
                ),
              ),
            ],
          ),

          const SizedBox(height: 24),
          const Divider(),
          const SizedBox(height: 16),

          // Recent files section
          const Text(
            'Recent Files',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 12),

          Expanded(
            child: BlocBuilder<ArbImportBloc, ArbImportState>(
              builder: (context, state) {
                if (state is ArbImportLoadingState) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const CircularProgressIndicator(),
                        const SizedBox(height: 16),
                        Text(state.operation),
                        if (state.progress != null)
                          Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: LinearProgressIndicator(
                              value: state.progress,
                            ),
                          ),
                      ],
                    ),
                  );
                }

                if (state is ArbImportSuccessState) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    Navigator.of(context).pop();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Successfully imported ${state.files.length} file(s)',
                        ),
                        backgroundColor: Colors.green,
                      ),
                    );
                  });
                  return const SizedBox.shrink();
                }

                if (state is ArbImportErrorState) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.error, color: Colors.red, size: 48),
                        const SizedBox(height: 16),
                        Text(
                          'Import Failed',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          state.message,
                          textAlign: TextAlign.center,
                          style: const TextStyle(color: Colors.red),
                        ),
                        const SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: () => context.read<ArbImportBloc>().add(
                            const ClearImportEvent(),
                          ),
                          child: const Text('Try Again'),
                        ),
                      ],
                    ),
                  );
                }

                // Show recent files
                final recentFiles = _getRecentFiles(state);

                if (recentFiles.isEmpty) {
                  return const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.history, size: 48, color: Colors.grey),
                        SizedBox(height: 16),
                        Text(
                          'No recent files',
                          style: TextStyle(color: Colors.grey),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Import some ARB files to see them here',
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                      ],
                    ),
                  );
                }

                return ListView.builder(
                  itemCount: recentFiles.length,
                  itemBuilder: (context, index) {
                    final filePath = recentFiles[index];
                    final fileName = filePath.split('/').last;

                    return ListTile(
                      leading: const Icon(Icons.description),
                      title: Text(fileName),
                      subtitle: Text(
                        filePath,
                        style: const TextStyle(fontSize: 12),
                        overflow: TextOverflow.ellipsis,
                      ),
                      trailing: IconButton(
                        icon: const Icon(Icons.open_in_new),
                        onPressed: () => _importFromRecent(filePath),
                      ),
                      onTap: () => _importFromRecent(filePath),
                    );
                  },
                );
              },
            ),
          ),

          const SizedBox(height: 16),

          // Drag and drop area
          Container(
            width: double.infinity,
            height: 100,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
                style: BorderStyle.solid,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.cloud_upload, size: 32, color: Colors.grey),
                  SizedBox(height: 8),
                  Text(
                    'Drag & Drop ARB files here',
                    style: TextStyle(color: Colors.grey),
                  ),
                  Text(
                    '(Coming soon)',
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<String> _getRecentFiles(ArbImportState state) {
    if (state is RecentFilesLoadedState) {
      return state.recentFiles;
    } else if (state is ArbImportSuccessState && state.recentFiles != null) {
      return state.recentFiles!;
    } else if (state is ArbImportErrorState && state.recentFiles != null) {
      return state.recentFiles!;
    }
    return [];
  }

  void _importSingleFile() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['arb'],
      dialogTitle: 'Select ARB file to import',
    );

    if (result != null && result.files.isNotEmpty) {
      final filePath = result.files.first.path;
      if (filePath != null) {
        context.read<ArbImportBloc>().add(ImportSingleFileEvent(filePath));
      }
    }
  }

  void _importMultipleFiles() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['arb'],
      allowMultiple: true,
      dialogTitle: 'Select ARB files to import',
    );

    if (result != null && result.files.isNotEmpty) {
      final filePaths = result.files
          .map((file) => file.path)
          .where((path) => path != null)
          .cast<String>()
          .toList();

      if (filePaths.isNotEmpty) {
        context.read<ArbImportBloc>().add(ImportMultipleFilesEvent(filePaths));
      }
    }
  }

  void _importFromRecent(String filePath) {
    context.read<ArbImportBloc>().add(ImportFromRecentEvent(filePath));
  }
}
