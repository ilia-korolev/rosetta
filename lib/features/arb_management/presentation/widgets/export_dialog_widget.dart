import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

/// Dialog for exporting ARB files in various formats
class ExportDialogWidget extends StatefulWidget {
  const ExportDialogWidget({
    super.key,
    required this.locales,
    required this.onExport,
  });

  final List<String> locales;
  final Function(ExportOptions options) onExport;

  @override
  State<ExportDialogWidget> createState() => _ExportDialogWidgetState();
}

class _ExportDialogWidgetState extends State<ExportDialogWidget> {
  String _selectedFormat = 'arb';
  String? _outputPath;
  Set<String> _selectedLocales = {};
  bool _compress = false;
  bool _includeMetadata = true;
  bool _preserveStructure = true;

  @override
  void initState() {
    super.initState();
    _selectedLocales = widget.locales.toSet();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SizedBox(
        width: 600,
        height: 500,
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Text(
                'Export Translation Files',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 24),

              // Format selection
              _buildFormatSelection(),
              const SizedBox(height: 16),

              // Locale selection
              _buildLocaleSelection(),
              const SizedBox(height: 16),

              // Output path selection
              _buildOutputPathSelection(),
              const SizedBox(height: 16),

              // Export options
              _buildExportOptions(),

              const Spacer(),

              // Action buttons
              _buildActionButtons(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFormatSelection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Export Format', style: Theme.of(context).textTheme.titleSmall),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          children: [
            _formatChip('arb', 'ARB Files', Icons.translate),
            _formatChip('json', 'JSON Files', Icons.code),
            _formatChip('csv', 'CSV Spreadsheet', Icons.table_view),
            _formatChip('xlsx', 'Excel Spreadsheet', Icons.grid_on),
          ],
        ),
      ],
    );
  }

  Widget _formatChip(String format, String label, IconData icon) {
    final isSelected = _selectedFormat == format;
    return FilterChip(
      label: Row(
        mainAxisSize: MainAxisSize.min,
        children: [Icon(icon, size: 16), const SizedBox(width: 4), Text(label)],
      ),
      selected: isSelected,
      onSelected: (selected) {
        if (selected) {
          setState(() => _selectedFormat = format);
        }
      },
    );
  }

  Widget _buildLocaleSelection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              'Select Locales',
              style: Theme.of(context).textTheme.titleSmall,
            ),
            const Spacer(),
            TextButton(
              onPressed: () {
                setState(() {
                  if (_selectedLocales.length == widget.locales.length) {
                    _selectedLocales.clear();
                  } else {
                    _selectedLocales = widget.locales.toSet();
                  }
                });
              },
              child: Text(
                _selectedLocales.length == widget.locales.length
                    ? 'Deselect All'
                    : 'Select All',
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Container(
          height: 120,
          decoration: BoxDecoration(
            border: Border.all(color: Theme.of(context).dividerColor),
            borderRadius: BorderRadius.circular(8),
          ),
          child: ListView.builder(
            itemCount: widget.locales.length,
            itemBuilder: (context, index) {
              final locale = widget.locales[index];
              return CheckboxListTile(
                title: Text(locale),
                subtitle: Text(_getLocaleDescription(locale)),
                value: _selectedLocales.contains(locale),
                onChanged: (value) {
                  setState(() {
                    if (value == true) {
                      _selectedLocales.add(locale);
                    } else {
                      _selectedLocales.remove(locale);
                    }
                  });
                },
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildOutputPathSelection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Output Location', style: Theme.of(context).textTheme.titleSmall),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: TextField(
                readOnly: true,
                decoration: InputDecoration(
                  hintText: 'Select output directory...',
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    onPressed: _selectOutputPath,
                    icon: const Icon(Icons.folder_open),
                  ),
                ),
                controller: TextEditingController(text: _outputPath ?? ''),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildExportOptions() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Export Options', style: Theme.of(context).textTheme.titleSmall),
        const SizedBox(height: 8),
        CheckboxListTile(
          title: const Text('Include metadata'),
          subtitle: const Text('Export entry descriptions and placeholders'),
          value: _includeMetadata,
          onChanged: (value) =>
              setState(() => _includeMetadata = value ?? true),
        ),
        CheckboxListTile(
          title: const Text('Preserve directory structure'),
          subtitle: const Text('Maintain original file organization'),
          value: _preserveStructure,
          onChanged: (value) =>
              setState(() => _preserveStructure = value ?? true),
        ),
        if (_selectedFormat != 'arb')
          CheckboxListTile(
            title: const Text('Create compressed archive'),
            subtitle: const Text('Package files into a ZIP archive'),
            value: _compress,
            onChanged: (value) => setState(() => _compress = value ?? false),
          ),
      ],
    );
  }

  Widget _buildActionButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
        const SizedBox(width: 8),
        ElevatedButton(
          onPressed: _canExport() ? _handleExport : null,
          child: const Text('Export'),
        ),
      ],
    );
  }

  Future<void> _selectOutputPath() async {
    final path = await FilePicker.platform.getDirectoryPath(
      dialogTitle: 'Select export directory',
    );

    if (path != null) {
      setState(() => _outputPath = path);
    }
  }

  bool _canExport() {
    return _outputPath != null && _selectedLocales.isNotEmpty;
  }

  void _handleExport() {
    final options = ExportOptions(
      format: _selectedFormat,
      outputPath: _outputPath!,
      selectedLocales: _selectedLocales.toList(),
      compress: _compress,
      includeMetadata: _includeMetadata,
      preserveStructure: _preserveStructure,
    );

    widget.onExport(options);
    Navigator.of(context).pop();
  }

  String _getLocaleDescription(String locale) {
    // Simple locale description mapping
    final descriptions = {
      'en': 'English',
      'es': 'Spanish',
      'fr': 'French',
      'de': 'German',
      'it': 'Italian',
      'ja': 'Japanese',
      'ko': 'Korean',
      'zh': 'Chinese',
      'ru': 'Russian',
      'pt': 'Portuguese',
    };

    return descriptions[locale.substring(0, 2)] ?? locale.toUpperCase();
  }
}

/// Export options configuration
class ExportOptions {
  const ExportOptions({
    required this.format,
    required this.outputPath,
    required this.selectedLocales,
    this.compress = false,
    this.includeMetadata = true,
    this.preserveStructure = true,
  });

  final String format;
  final String outputPath;
  final List<String> selectedLocales;
  final bool compress;
  final bool includeMetadata;
  final bool preserveStructure;
}
