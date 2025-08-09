import 'package:dart_mappable/dart_mappable.dart';

part 'arb_entry_type.mapper.dart';

/// Types of ARB entries based on ICU message format
@MappableEnum()
enum ArbEntryType {
  simple, // "hello": "Hello"
  plural, // ICU plural syntax
  select, // ICU select syntax
  compound, // Mixed plural/select
  withPlaceholders, // Simple with {variables}
  withDateFormat, // DateTime formatting
  withNumberFormat, // Number/currency formatting
}
