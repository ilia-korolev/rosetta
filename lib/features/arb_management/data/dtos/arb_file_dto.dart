import 'dart:convert';
import 'package:dart_mappable/dart_mappable.dart';
import 'package:path/path.dart' as path;

import 'package:rosetta/features/features.dart';

part 'arb_file_dto.mapper.dart';

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
