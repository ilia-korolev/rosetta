import 'package:dart_mappable/dart_mappable.dart';

import 'arb_entry_metadata.dart';
import 'arb_entry_type.dart';
import 'arb_placeholder.dart';
import 'icu_case.dart';

part 'arb_entry.mapper.dart';

/// An entry in an ARB file
@MappableClass()
class ArbEntry with ArbEntryMappable {
  const ArbEntry({
    required this.key,
    required this.value,
    required this.type,
    this.placeholders,
    this.metadata,
    this.pluralCases,
    this.selectCases,
    this.hasNestedStructures = false,
  });

  /// The key of the entry
  final String key;

  /// The message value
  final String value;

  /// Type of the entry
  final ArbEntryType type;

  /// Placeholders in the message
  final Map<String, ArbPlaceholder>? placeholders;

  /// Metadata for the entry
  final ArbEntryMetadata? metadata;

  /// Plural cases for ICU plural messages
  final List<IcuCase>? pluralCases;

  /// Select cases for ICU select messages
  final List<IcuCase>? selectCases;

  /// Whether the message has nested ICU structures
  final bool hasNestedStructures;

  /// Check if this entry has placeholders
  bool get hasPlaceholders => placeholders?.isNotEmpty ?? false;

  /// Check if this entry is a plural message
  bool get isPlural =>
      type == ArbEntryType.plural || type == ArbEntryType.compound;

  /// Check if this entry is a select message
  bool get isSelect =>
      type == ArbEntryType.select || type == ArbEntryType.compound;

  /// Get all placeholder names
  List<String> get placeholderNames => placeholders?.keys.toList() ?? [];

  /// Check if entry has required "other" case for plural/select
  bool get hasRequiredOtherCase {
    if (isPlural) {
      return pluralCases?.any((icuCase) => icuCase.selector == 'other') ??
          false;
    }
    if (isSelect) {
      return selectCases?.any((icuCase) => icuCase.selector == 'other') ??
          false;
    }
    return true; // Non-ICU messages don't need "other" case
  }
}
