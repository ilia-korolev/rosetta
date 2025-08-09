import 'package:dart_mappable/dart_mappable.dart';

part 'arb_placeholder.mapper.dart';

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
