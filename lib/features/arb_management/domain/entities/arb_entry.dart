import 'package:dart_mappable/dart_mappable.dart';

part 'arb_entry.mapper.dart';

/// Types of ARB entries based on ICU message format
@MappableEnum()
enum ArbEntryType {
  simple,           // "hello": "Hello"
  plural,           // ICU plural syntax
  select,           // ICU select syntax  
  compound,         // Mixed plural/select
  withPlaceholders, // Simple with {variables}
  withDateFormat,   // DateTime formatting
  withNumberFormat, // Number/currency formatting
}

/// Types of placeholders in ARB entries
@MappableEnum()
enum PlaceholderType {
  string('String'),
  int('int'),
  double('double'),
  num('num'),
  dateTime('DateTime');

  const PlaceholderType(this.typeName);
  final String typeName;
}

/// A placeholder within an ARB message
@MappableClass()
class ArbPlaceholder with ArbPlaceholderMappable {
  const ArbPlaceholder({
    required this.name,
    required this.type,
    this.format,
    this.optionalParameters,
    this.example,
    this.description,
  });

  /// Placeholder name (e.g., "count", "gender", "date")
  final String name;
  
  /// Type of the placeholder
  final PlaceholderType type;
  
  /// Format specification (e.g., "compact", "currency", "yMd")
  final String? format;
  
  /// Optional parameters for formatting (e.g., {"decimalDigits": 2})
  final Map<String, dynamic>? optionalParameters;
  
  /// Example value for testing/preview
  final String? example;
  
  /// Description for translators
  final String? description;
}

/// A case in a plural or select ICU message
@MappableClass()
class IcuCase with IcuCaseMappable {
  const IcuCase({
    required this.selector,
    required this.message,
    required this.isRequired,
  });

  /// The selector (e.g., "=0", "=1", "other", "male", "female")
  final String selector;
  
  /// The message for this case
  final String message;
  
  /// Whether this case is required (e.g., "other" is always required)
  final bool isRequired;
}

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
  bool get isPlural => type == ArbEntryType.plural || type == ArbEntryType.compound;

  /// Check if this entry is a select message
  bool get isSelect => type == ArbEntryType.select || type == ArbEntryType.compound;

  /// Get all placeholder names
  List<String> get placeholderNames => placeholders?.keys.toList() ?? [];

  /// Check if entry has required "other" case for plural/select
  bool get hasRequiredOtherCase {
    if (isPlural) {
      return pluralCases?.any((icuCase) => icuCase.selector == 'other') ?? false;
    }
    if (isSelect) {
      return selectCases?.any((icuCase) => icuCase.selector == 'other') ?? false;
    }
    return true; // Non-ICU messages don't need "other" case
  }
}
