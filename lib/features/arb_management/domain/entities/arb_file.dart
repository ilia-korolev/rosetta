import 'package:dart_mappable/dart_mappable.dart';
import 'package:rosetta/features/features.dart';

part 'arb_file.mapper.dart';

/// Metadata for an ARB file
@MappableClass()
class ArbFileMetadata with ArbFileMetadataMappable {
  const ArbFileMetadata({
    required this.locale,
    this.lastModified,
    this.context,
    this.author,
    this.version,
  });

  /// The locale of this ARB file (e.g., "en", "es", "de")
  final String locale;

  /// When the file was last modified
  final DateTime? lastModified;

  /// Context description for the file
  final String? context;

  /// Author information
  final String? author;

  /// Version of the translations
  final String? version;
}

/// Statistics about an ARB file
@MappableClass()
class ArbFileStatistics with ArbFileStatisticsMappable {
  const ArbFileStatistics({
    required this.totalEntries,
    required this.translatedEntries,
    required this.emptyEntries,
    required this.entriesWithPlurals,
    required this.entriesWithSelects,
    required this.entriesWithNumbers,
    required this.entriesWithDates,
  });

  /// Total number of entries
  final int totalEntries;

  /// Number of translated (non-empty) entries
  final int translatedEntries;

  /// Number of empty entries
  final int emptyEntries;

  /// Number of entries with plural forms
  final int entriesWithPlurals;

  /// Number of entries with select forms
  final int entriesWithSelects;

  /// Number of entries with number formatting
  final int entriesWithNumbers;

  /// Number of entries with date formatting
  final int entriesWithDates;

  /// Calculate completion percentage
  double get completionPercentage {
    if (totalEntries == 0) return 0.0;
    return (translatedEntries / totalEntries) * 100.0;
  }

  /// Check if the file is fully translated
  bool get isComplete => emptyEntries == 0;
}

/// An ARB file representation
@MappableClass()
class ArbFile with ArbFileMappable {
  const ArbFile({
    required this.filePath,
    required this.entries,
    required this.metadata,
    this.statistics,
    this.lastSaved,
    this.hasUnsavedChanges = false,
  });

  /// Path to the ARB file
  final String filePath;

  /// Map of entries (key -> entry)
  final Map<String, ArbEntry> entries;

  /// File metadata
  final ArbFileMetadata metadata;

  /// File statistics
  final ArbFileStatistics? statistics;

  /// When the file was last saved
  final DateTime? lastSaved;

  /// Whether there are unsaved changes
  final bool hasUnsavedChanges;

  /// Get the locale from metadata
  String get locale => metadata.locale;

  /// Get the file name from path
  String get fileName => filePath.split('/').last;

  /// Get all entry keys
  List<String> get keys => entries.keys.toList();

  /// Get entry by key
  ArbEntry? getEntry(String key) => entries[key];

  /// Check if an entry exists
  bool hasEntry(String key) => entries.containsKey(key);

  /// Get entries of a specific type
  List<ArbEntry> getEntriesByType(ArbEntryType type) {
    return entries.values.where((entry) => entry.type == type).toList();
  }

  /// Get entries with placeholders
  List<ArbEntry> get entriesWithPlaceholders {
    return entries.values.where((entry) => entry.hasPlaceholders).toList();
  }

  /// Get plural entries
  List<ArbEntry> get pluralEntries {
    return entries.values.where((entry) => entry.isPlural).toList();
  }

  /// Get select entries
  List<ArbEntry> get selectEntries {
    return entries.values.where((entry) => entry.isSelect).toList();
  }

  /// Get entries missing required "other" case
  List<ArbEntry> get invalidIcuEntries {
    return entries.values
        .where((entry) => !entry.hasRequiredOtherCase)
        .toList();
  }

  /// Calculate statistics for this file
  ArbFileStatistics calculateStatistics() {
    final totalEntries = entries.length;
    final translatedEntries = entries.values
        .where((entry) => entry.value.isNotEmpty)
        .length;
    final emptyEntries = totalEntries - translatedEntries;
    final entriesWithPlurals = pluralEntries.length;
    final entriesWithSelects = selectEntries.length;
    final entriesWithNumbers = entries.values
        .where(
          (entry) =>
              entry.placeholders?.values.any(
                (p) =>
                    p.type == PlaceholderType.num ||
                    p.type == PlaceholderType.int ||
                    p.type == PlaceholderType.double,
              ) ??
              false,
        )
        .length;
    final entriesWithDates = entries.values
        .where(
          (entry) =>
              entry.placeholders?.values.any(
                (p) => p.type == PlaceholderType.dateTime,
              ) ??
              false,
        )
        .length;

    return ArbFileStatistics(
      totalEntries: totalEntries,
      translatedEntries: translatedEntries,
      emptyEntries: emptyEntries,
      entriesWithPlurals: entriesWithPlurals,
      entriesWithSelects: entriesWithSelects,
      entriesWithNumbers: entriesWithNumbers,
      entriesWithDates: entriesWithDates,
    );
  }

  /// Create a copy with updated entry
  ArbFile updateEntry(String key, ArbEntry entry) {
    return copyWith(entries: {...entries, key: entry}, hasUnsavedChanges: true);
  }

  /// Create a copy with removed entry
  ArbFile removeEntry(String key) {
    final newEntries = Map<String, ArbEntry>.from(entries);
    newEntries.remove(key);
    return copyWith(entries: newEntries, hasUnsavedChanges: true);
  }

  /// Create a copy marked as saved
  ArbFile markAsSaved() {
    return copyWith(hasUnsavedChanges: false, lastSaved: DateTime.now());
  }
}
