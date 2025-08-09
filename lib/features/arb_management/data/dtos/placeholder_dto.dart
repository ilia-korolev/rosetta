import 'package:dart_mappable/dart_mappable.dart';

import 'package:rosetta/features/features.dart';

part 'placeholder_dto.mapper.dart';

/// DTO for ARB placeholder
@MappableClass()
class PlaceholderDto with PlaceholderDtoMappable {
  const PlaceholderDto({
    required this.name,
    required this.type,
    this.format,
    this.optionalParameters,
    this.example,
    this.description,
  });

  final String name;
  final String type;
  final String? format;
  final Map<String, dynamic>? optionalParameters;
  final String? example;
  final String? description;

  /// Convert to domain entity
  ArbPlaceholder toDomain() {
    return ArbPlaceholder(
      name: name,
      type: _mapPlaceholderType(type),
      format: format,
      optionalParameters: optionalParameters,
      example: example,
      description: description,
    );
  }

  /// Create from domain entity
  factory PlaceholderDto.fromDomain(ArbPlaceholder placeholder) {
    return PlaceholderDto(
      name: placeholder.name,
      type: placeholder.type.typeName,
      format: placeholder.format,
      optionalParameters: placeholder.optionalParameters,
      example: placeholder.example,
      description: placeholder.description,
    );
  }

  /// Create from JSON
  factory PlaceholderDto.fromJson(String name, Map<String, dynamic> json) {
    return PlaceholderDto(
      name: name,
      type: json['type'] as String? ?? 'String',
      format: json['format'] as String?,
      optionalParameters: json['optionalParameters'] as Map<String, dynamic>?,
      example: json['example'] as String?,
      description: json['description'] as String?,
    );
  }

  /// Convert to JSON Map
  Map<String, dynamic> toJsonMap() {
    final json = <String, dynamic>{'type': type};

    if (format != null) json['format'] = format;
    if (optionalParameters != null) {
      json['optionalParameters'] = optionalParameters;
    }
    if (example != null) json['example'] = example;
    if (description != null) json['description'] = description;

    return json;
  }

  /// Map string type to PlaceholderType enum
  PlaceholderType _mapPlaceholderType(String typeStr) {
    switch (typeStr.toLowerCase()) {
      case 'string':
        return PlaceholderType.string;
      case 'int':
        return PlaceholderType.int;
      case 'double':
        return PlaceholderType.double;
      case 'num':
        return PlaceholderType.num;
      case 'datetime':
        return PlaceholderType.dateTime;
      default:
        return PlaceholderType.string;
    }
  }
}
