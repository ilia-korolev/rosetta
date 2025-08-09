import 'package:dart_mappable/dart_mappable.dart';

part 'icu_case.mapper.dart';

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
