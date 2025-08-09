import 'package:dart_mappable/dart_mappable.dart';

import 'package:rosetta/features/features.dart';

part 'arb_entry_metadata_dto.mapper.dart';

/// DTO for ARB entry metadata
@MappableClass()
class ArbEntryMetadataDto with ArbEntryMetadataDtoMappable {
  const ArbEntryMetadataDto({
    this.description,
    this.placeholders,
    this.context,
    this.examples,
  });

  final String? description;
  final Map<String, PlaceholderDto>? placeholders;
  final String? context;
  final List<String>? examples;

  /// Convert to domain entity
  ArbEntryMetadata toDomain() {
    return ArbEntryMetadata(
      description: description,
      context: context,
      examples: examples,
    );
  }

  /// Create from domain entity
  factory ArbEntryMetadataDto.fromDomain(ArbEntryMetadata metadata) {
    return ArbEntryMetadataDto(
      description: metadata.description,
      context: metadata.context,
      examples: metadata.examples,
    );
  }

  /// Create from JSON metadata
  factory ArbEntryMetadataDto.fromJson(Map<String, dynamic> json) {
    final placeholders = <String, PlaceholderDto>{};

    if (json['placeholders'] != null) {
      final placeholdersJson = json['placeholders'] as Map<String, dynamic>;
      for (final entry in placeholdersJson.entries) {
        placeholders[entry.key] = PlaceholderDto.fromJson(
          entry.key,
          entry.value as Map<String, dynamic>,
        );
      }
    }

    return ArbEntryMetadataDto(
      description: json['description'] as String?,
      placeholders: placeholders.isNotEmpty ? placeholders : null,
      context: json['context'] as String?,
      examples: (json['examples'] as List<dynamic>?)?.cast<String>(),
    );
  }

  /// Convert to JSON Map
  Map<String, dynamic> toJsonMap() {
    final json = <String, dynamic>{};

    if (description != null) json['description'] = description;
    if (context != null) json['context'] = context;
    if (examples != null) json['examples'] = examples;

    if (placeholders != null && placeholders!.isNotEmpty) {
      json['placeholders'] = placeholders!.map(
        (key, placeholder) => MapEntry(key, placeholder.toJsonMap()),
      );
    }

    return json;
  }
}
