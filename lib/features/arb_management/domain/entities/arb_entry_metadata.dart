import 'package:dart_mappable/dart_mappable.dart';

part 'arb_entry_metadata.mapper.dart';

/// Metadata for an ARB entry
@MappableClass()
class ArbEntryMetadata with ArbEntryMetadataMappable {
  const ArbEntryMetadata({
    this.description,
    this.context,
    this.examples,
    this.translatorNotes,
  });

  /// Description of the entry for translators
  final String? description;

  /// Context where this entry is used
  final String? context;

  /// Examples of usage
  final List<String>? examples;

  /// Additional notes for translators
  final String? translatorNotes;
}
