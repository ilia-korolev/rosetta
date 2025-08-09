import '../entities/arb_entry.dart';

/// Use case for parsing ICU message format
class ParseIcuMessageUseCase {
  const ParseIcuMessageUseCase();

  /// Parse an ICU message and extract structured information
  ParsedIcuMessage call(String message, String key) {
    final type = _detectMessageType(message);
    final placeholders = _extractPlaceholders(message);
    final icuStructures = _extractIcuStructures(message);

    return ParsedIcuMessage(
      originalMessage: message,
      entryKey: key,
      type: type,
      placeholders: placeholders,
      icuStructures: icuStructures,
      isValid: _validateBasicSyntax(message),
    );
  }

  /// Detect the type of ICU message
  ArbEntryType _detectMessageType(String message) {
    final hasPlural = message.contains(RegExp(r'\{\w+,\s*plural,'));
    final hasSelect = message.contains(RegExp(r'\{\w+,\s*select,'));
    final hasPlaceholders = message.contains(RegExp(r'\{\w+\}'));
    final hasDateFormat = message.contains(RegExp(r'\{\w+,\s*date,'));
    final hasNumberFormat = message.contains(RegExp(r'\{\w+,\s*number,'));

    if (hasPlural && hasSelect) {
      return ArbEntryType.compound;
    } else if (hasPlural) {
      return ArbEntryType.plural;
    } else if (hasSelect) {
      return ArbEntryType.select;
    } else if (hasDateFormat) {
      return ArbEntryType.withDateFormat;
    } else if (hasNumberFormat) {
      return ArbEntryType.withNumberFormat;
    } else if (hasPlaceholders) {
      return ArbEntryType.withPlaceholders;
    } else {
      return ArbEntryType.simple;
    }
  }

  /// Extract placeholders from the message
  Map<String, PlaceholderInfo> _extractPlaceholders(String message) {
    final placeholders = <String, PlaceholderInfo>{};

    // Extract simple placeholders: {name}
    final simplePlaceholderPattern = RegExp(r'\{(\w+)\}');
    for (final match in simplePlaceholderPattern.allMatches(message)) {
      final name = match.group(1)!;
      placeholders[name] = PlaceholderInfo(
        name: name,
        type: PlaceholderType.string, // Default to string
        usage: PlaceholderUsage.simple,
      );
    }

    // Extract ICU placeholders: {name, type, format}
    final icuPlaceholderPattern = RegExp(r'\{(\w+),\s*(\w+)(?:,\s*([^}]+))?\}');
    for (final match in icuPlaceholderPattern.allMatches(message)) {
      final name = match.group(1)!;
      final typeStr = match.group(2)!;
      final format = match.group(3);

      final type = _mapTypeString(typeStr);
      final usage = _mapUsageString(typeStr);

      placeholders[name] = PlaceholderInfo(
        name: name,
        type: type,
        usage: usage,
        format: format,
      );
    }

    return placeholders;
  }

  /// Extract ICU structures (plural, select cases)
  List<IcuStructure> _extractIcuStructures(String message) {
    final structures = <IcuStructure>[];

    // Extract plural structures
    final pluralPattern = RegExp(r'\{(\w+),\s*plural,\s*([^}]+)\}');
    for (final match in pluralPattern.allMatches(message)) {
      final placeholderName = match.group(1)!;
      final casesStr = match.group(2)!;
      final cases = _parsePluralCases(casesStr);

      structures.add(
        IcuStructure(
          type: IcuStructureType.plural,
          placeholderName: placeholderName,
          cases: cases,
          startIndex: match.start,
          endIndex: match.end,
        ),
      );
    }

    // Extract select structures
    final selectPattern = RegExp(r'\{(\w+),\s*select,\s*([^}]+)\}');
    for (final match in selectPattern.allMatches(message)) {
      final placeholderName = match.group(1)!;
      final casesStr = match.group(2)!;
      final cases = _parseSelectCases(casesStr);

      structures.add(
        IcuStructure(
          type: IcuStructureType.select,
          placeholderName: placeholderName,
          cases: cases,
          startIndex: match.start,
          endIndex: match.end,
        ),
      );
    }

    return structures;
  }

  /// Validate basic ICU syntax
  bool _validateBasicSyntax(String message) {
    // Check balanced braces
    var braceCount = 0;
    for (final char in message.split('')) {
      if (char == '{') {
        braceCount++;
      } else if (char == '}') {
        braceCount--;
        if (braceCount < 0) return false;
      }
    }
    return braceCount == 0;
  }

  /// Map type string to PlaceholderType
  PlaceholderType _mapTypeString(String typeStr) {
    switch (typeStr.toLowerCase()) {
      case 'number':
      case 'plural':
        return PlaceholderType.num;
      case 'date':
        return PlaceholderType.dateTime;
      case 'select':
        return PlaceholderType.string;
      default:
        return PlaceholderType.string;
    }
  }

  /// Map usage string to PlaceholderUsage
  PlaceholderUsage _mapUsageString(String typeStr) {
    switch (typeStr.toLowerCase()) {
      case 'plural':
        return PlaceholderUsage.plural;
      case 'select':
        return PlaceholderUsage.select;
      case 'number':
        return PlaceholderUsage.number;
      case 'date':
        return PlaceholderUsage.date;
      default:
        return PlaceholderUsage.simple;
    }
  }

  /// Parse plural cases from cases string
  List<IcuCase> _parsePluralCases(String casesStr) {
    final cases = <IcuCase>[];
    final casePattern = RegExp(r'(=?\w+)\{([^}]*(?:\{[^}]*\}[^}]*)*)\}');

    for (final match in casePattern.allMatches(casesStr)) {
      final selector = match.group(1)!;
      final message = match.group(2)!;
      cases.add(
        IcuCase(
          selector: selector,
          message: message,
          isRequired: selector == 'other',
        ),
      );
    }

    return cases;
  }

  /// Parse select cases from cases string
  List<IcuCase> _parseSelectCases(String casesStr) {
    final cases = <IcuCase>[];
    final casePattern = RegExp(r'(\w+)\{([^}]*(?:\{[^}]*\}[^}]*)*)\}');

    for (final match in casePattern.allMatches(casesStr)) {
      final selector = match.group(1)!;
      final message = match.group(2)!;
      cases.add(
        IcuCase(
          selector: selector,
          message: message,
          isRequired: selector == 'other',
        ),
      );
    }

    return cases;
  }
}

/// Usage type for placeholders
enum PlaceholderUsage {
  simple, // {name}
  plural, // {count, plural, ...}
  select, // {gender, select, ...}
  number, // {amount, number, ...}
  date, // {date, date, ...}
}

/// Type of ICU structure
enum IcuStructureType { plural, select }

/// Information about a placeholder found in a message
class PlaceholderInfo {
  const PlaceholderInfo({
    required this.name,
    required this.type,
    required this.usage,
    this.format,
  });

  /// Name of the placeholder
  final String name;

  /// Type of the placeholder
  final PlaceholderType type;

  /// How the placeholder is used
  final PlaceholderUsage usage;

  /// Format specification (if any)
  final String? format;

  /// Whether this is a simple placeholder
  bool get isSimple => usage == PlaceholderUsage.simple;

  /// Whether this is an ICU placeholder
  bool get isIcu => usage != PlaceholderUsage.simple;
}

/// An ICU structure found in a message
class IcuStructure {
  const IcuStructure({
    required this.type,
    required this.placeholderName,
    required this.cases,
    required this.startIndex,
    required this.endIndex,
  });

  /// Type of ICU structure
  final IcuStructureType type;

  /// Name of the placeholder that drives this structure
  final String placeholderName;

  /// Cases within this structure
  final List<IcuCase> cases;

  /// Start index in the original message
  final int startIndex;

  /// End index in the original message
  final int endIndex;

  /// Whether this structure has the required "other" case
  bool get hasOtherCase => cases.any((c) => c.selector == 'other');

  /// Get case by selector
  IcuCase? getCase(String selector) {
    return cases.cast<IcuCase?>().firstWhere(
      (c) => c?.selector == selector,
      orElse: () => null,
    );
  }
}

/// Result of parsing an ICU message
class ParsedIcuMessage {
  const ParsedIcuMessage({
    required this.originalMessage,
    required this.entryKey,
    required this.type,
    required this.placeholders,
    required this.icuStructures,
    required this.isValid,
  });

  /// Original message text
  final String originalMessage;

  /// Key of the entry
  final String entryKey;

  /// Detected message type
  final ArbEntryType type;

  /// Placeholders found in the message
  final Map<String, PlaceholderInfo> placeholders;

  /// ICU structures found in the message
  final List<IcuStructure> icuStructures;

  /// Whether the message has valid basic syntax
  final bool isValid;

  /// Whether this is a simple message
  bool get isSimple => type == ArbEntryType.simple;

  /// Whether this is an ICU message
  bool get isIcu => type != ArbEntryType.simple;

  /// Whether this has nested structures
  bool get hasNestedStructures => icuStructures.length > 1;

  /// Get all placeholder names
  List<String> get placeholderNames => placeholders.keys.toList();

  /// Get ICU placeholder names
  List<String> get icuPlaceholderNames {
    return placeholders.values
        .where((p) => p.isIcu)
        .map((p) => p.name)
        .toList();
  }

  /// Get simple placeholder names
  List<String> get simplePlaceholderNames {
    return placeholders.values
        .where((p) => p.isSimple)
        .map((p) => p.name)
        .toList();
  }

  /// Create an ArbEntry from this parsed message
  ArbEntry toArbEntry({ArbEntryMetadata? metadata}) {
    // Convert PlaceholderInfo to ArbPlaceholder
    final arbPlaceholders = <String, ArbPlaceholder>{};
    for (final entry in placeholders.entries) {
      final info = entry.value;
      arbPlaceholders[entry.key] = ArbPlaceholder(
        name: info.name,
        type: info.type,
        format: info.format,
      );
    }

    // Convert ICU structures to plural/select cases
    List<IcuCase>? pluralCases;
    List<IcuCase>? selectCases;

    for (final structure in icuStructures) {
      switch (structure.type) {
        case IcuStructureType.plural:
          pluralCases = structure.cases;
          break;
        case IcuStructureType.select:
          selectCases = structure.cases;
          break;
      }
    }

    return ArbEntry(
      key: entryKey,
      value: originalMessage,
      type: type,
      placeholders: arbPlaceholders.isNotEmpty ? arbPlaceholders : null,
      metadata: metadata,
      pluralCases: pluralCases,
      selectCases: selectCases,
      hasNestedStructures: hasNestedStructures,
    );
  }
}
