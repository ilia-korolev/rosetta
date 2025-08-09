import 'dart:convert';
import 'package:dart_mappable/dart_mappable.dart';
import 'package:path/path.dart' as path;

import '../../domain/entities/arb_file.dart';
import '../../domain/entities/arb_entry.dart';
import '../../domain/use_cases/parse_icu_message_use_case.dart';

part 'arb_file_dto.mapper.dart';

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
    if (optionalParameters != null)
      json['optionalParameters'] = optionalParameters;
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

/// DTO for ARB file
@MappableClass()
class ArbFileDto with ArbFileDtoMappable {
  const ArbFileDto({
    required this.filePath,
    required this.locale,
    required this.entries,
    required this.metadata,
    this.context,
    this.author,
    this.version,
  });

  final String filePath;
  final String locale;
  final Map<String, String> entries;
  final Map<String, ArbEntryMetadataDto> metadata;
  final String? context;
  final String? author;
  final String? version;

  /// Convert to domain entity
  ArbFile toDomain() {
    final parseIcuMessageUseCase = ParseIcuMessageUseCase();
    final domainEntries = <String, ArbEntry>{};

    for (final entry in entries.entries) {
      final key = entry.key;
      final value = entry.value;
      final metadataDto = metadata[key];

      // Parse the ICU message to determine type and extract placeholders
      final parsedMessage = parseIcuMessageUseCase(value, key);
      final arbEntry = parsedMessage.toArbEntry(
        metadata: metadataDto?.toDomain(),
      );

      domainEntries[key] = arbEntry;
    }

    final fileMetadata = ArbFileMetadata(
      locale: locale,
      context: context,
      author: author,
      version: version,
      lastModified: DateTime.now(),
    );

    final arbFile = ArbFile(
      filePath: filePath,
      entries: domainEntries,
      metadata: fileMetadata,
    );

    // Calculate statistics
    final statistics = arbFile.calculateStatistics();

    return arbFile.copyWith(statistics: statistics);
  }

  /// Create from domain entity
  factory ArbFileDto.fromDomain(ArbFile arbFile) {
    final entries = <String, String>{};
    final metadata = <String, ArbEntryMetadataDto>{};

    for (final entry in arbFile.entries.values) {
      entries[entry.key] = entry.value;

      if (entry.metadata != null || entry.placeholders != null) {
        final placeholdersDto = entry.placeholders?.map(
          (key, placeholder) =>
              MapEntry(key, PlaceholderDto.fromDomain(placeholder)),
        );

        metadata[entry.key] = ArbEntryMetadataDto(
          description: entry.metadata?.description,
          context: entry.metadata?.context,
          examples: entry.metadata?.examples,
          placeholders: placeholdersDto,
        );
      }
    }

    return ArbFileDto(
      filePath: arbFile.filePath,
      locale: arbFile.locale,
      entries: entries,
      metadata: metadata,
      context: arbFile.metadata.context,
      author: arbFile.metadata.author,
      version: arbFile.metadata.version,
    );
  }

  /// Create from JSON string
  factory ArbFileDto.fromJson(String jsonContent, String filePath) {
    try {
      final json = jsonDecode(jsonContent) as Map<String, dynamic>;

      // Extract locale
      final locale =
          json['@@locale'] as String? ?? _extractLocaleFromPath(filePath);

      // Extract file metadata
      final context = json['@@context'] as String?;
      final author = json['@@author'] as String?;
      final version = json['@@version'] as String?;

      // Separate entries from metadata
      final entries = <String, String>{};
      final metadata = <String, ArbEntryMetadataDto>{};

      for (final entry in json.entries) {
        final key = entry.key;
        final value = entry.value;

        if (key.startsWith('@@')) {
          // Skip file metadata (already processed)
          continue;
        } else if (key.startsWith('@')) {
          // Entry metadata
          final entryKey = key.substring(1);
          if (value is Map<String, dynamic>) {
            metadata[entryKey] = ArbEntryMetadataDto.fromJson(value);
          }
        } else {
          // Entry value
          if (value is String) {
            entries[key] = value;
          }
        }
      }

      return ArbFileDto(
        filePath: filePath,
        locale: locale,
        entries: entries,
        metadata: metadata,
        context: context,
        author: author,
        version: version,
      );
    } catch (e) {
      throw FormatException('Invalid ARB JSON format: $e');
    }
  }

  /// Convert to JSON string
  String toJsonString() {
    final json = <String, dynamic>{};

    // Add file metadata
    json['@@locale'] = locale;
    if (context != null) json['@@context'] = context;
    if (author != null) json['@@author'] = author;
    if (version != null) json['@@version'] = version;

    // Add entries and their metadata
    for (final entry in entries.entries) {
      final key = entry.key;
      final value = entry.value;

      json[key] = value;

      // Add entry metadata if it exists
      final entryMetadata = metadata[key];
      if (entryMetadata != null) {
        final metadataJson = entryMetadata.toJsonMap();
        if (metadataJson.isNotEmpty) {
          json['@$key'] = metadataJson;
        }
      }
    }

    // Format with proper indentation
    const encoder = JsonEncoder.withIndent('  ');
    return encoder.convert(json);
  }

  /// Extract locale from file path
  static String _extractLocaleFromPath(String filePath) {
    final fileName = path.basename(filePath);
    final nameWithoutExtension = path.basenameWithoutExtension(fileName);

    // Expected format: app_en.arb, intl_es.arb, etc.
    final parts = nameWithoutExtension.split('_');
    if (parts.length >= 2) {
      return parts.last;
    }

    // Fallback to 'en' if locale cannot be determined
    return 'en';
  }
}
