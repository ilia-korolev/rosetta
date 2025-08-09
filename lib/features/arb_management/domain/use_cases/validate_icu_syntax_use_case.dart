import '../entities/arb_entry.dart';
import '../entities/arb_entry_type.dart';
import '../entities/arb_placeholder.dart';
import '../entities/icu_case.dart';
import '../entities/icu_validation_result.dart';
import '../entities/validation_error.dart';

import '../entities/validation_suggestion.dart';
import '../entities/validation_warning.dart';

/// Use case for validating ICU message format syntax
class ValidateIcuSyntaxUseCase {
  const ValidateIcuSyntaxUseCase();

  /// Validate ICU syntax for an ARB entry
  IcuValidationResult call(ArbEntry entry) {
    final errors = <ValidationError>[];
    final warnings = <ValidationWarning>[];
    final suggestions = <ValidationSuggestion>[];

    // Check based on entry type
    switch (entry.type) {
      case ArbEntryType.plural:
        _validatePluralSyntax(entry, errors, warnings, suggestions);
        break;
      case ArbEntryType.select:
        _validateSelectSyntax(entry, errors, warnings, suggestions);
        break;
      case ArbEntryType.compound:
        _validateCompoundSyntax(entry, errors, warnings, suggestions);
        break;
      case ArbEntryType.withPlaceholders:
      case ArbEntryType.withDateFormat:
      case ArbEntryType.withNumberFormat:
        _validatePlaceholderSyntax(entry, errors, warnings, suggestions);
        break;
      case ArbEntryType.simple:
        // Simple entries don't need ICU validation
        break;
    }

    // Validate placeholder consistency
    _validatePlaceholderConsistency(entry, errors, warnings, suggestions);

    // Check for common ICU syntax errors
    _validateGeneralIcuSyntax(entry, errors, warnings, suggestions);

    return IcuValidationResult(
      isValid: errors.isEmpty,
      errors: errors,
      warnings: warnings,
      suggestions: suggestions,
      entry: entry,
    );
  }

  /// Validate plural message syntax
  void _validatePluralSyntax(
    ArbEntry entry,
    List<ValidationError> errors,
    List<ValidationWarning> warnings,
    List<ValidationSuggestion> suggestions,
  ) {
    final message = entry.value;

    // Check for plural pattern: {variable, plural, cases}
    final pluralPattern = RegExp(r'\{(\w+),\s*plural,\s*(.+)\}');
    final match = pluralPattern.firstMatch(message);

    if (match == null) {
      errors.add(
        ValidationError(
          message: 'Invalid plural syntax. Expected: {variable, plural, cases}',
          code: 'INVALID_PLURAL_SYNTAX',
          entryKey: entry.key,
          suggestion:
              'Use format: {count, plural, =0{no items} =1{1 item} other{# items}}',
        ),
      );
      return;
    }

    final placeholderName = match.group(1)!;
    final casesStr = match.group(2)!;

    // Validate placeholder exists in metadata
    if (entry.placeholders?.containsKey(placeholderName) != true) {
      errors.add(
        ValidationError(
          message: 'Placeholder "$placeholderName" not defined in metadata',
          code: 'MISSING_PLACEHOLDER_METADATA',
          entryKey: entry.key,
          suggestion: 'Add placeholder metadata for "$placeholderName"',
        ),
      );
    }

    // Parse and validate cases
    final cases = _parsePluralCases(casesStr);

    // Check for required "other" case
    if (!cases.any((c) => c.selector == 'other')) {
      errors.add(
        ValidationError(
          message: 'Missing required "other" case in plural message',
          code: 'MISSING_OTHER_CASE',
          entryKey: entry.key,
          suggestion: 'Add "other{...}" case to the plural message',
        ),
      );
    }

    // Check for valid case selectors
    final validSelectors = {
      '=0',
      '=1',
      'zero',
      'one',
      'two',
      'few',
      'many',
      'other',
    };
    for (final icuCase in cases) {
      if (!validSelectors.contains(icuCase.selector) &&
          !icuCase.selector.startsWith('=')) {
        warnings.add(
          ValidationWarning(
            message: 'Unknown plural selector "${icuCase.selector}"',
            code: 'UNKNOWN_PLURAL_SELECTOR',
            entryKey: entry.key,
            suggestion:
                'Use standard selectors: =0, =1, zero, one, few, many, other',
          ),
        );
      }
    }

    // Check for duplicate selectors
    final selectors = cases.map((c) => c.selector).toList();
    final duplicates = selectors
        .where((s) => selectors.where((s2) => s2 == s).length > 1)
        .toSet();
    for (final duplicate in duplicates) {
      errors.add(
        ValidationError(
          message: 'Duplicate plural selector "$duplicate"',
          code: 'DUPLICATE_PLURAL_SELECTOR',
          entryKey: entry.key,
          suggestion: 'Remove duplicate "$duplicate" selector',
        ),
      );
    }
  }

  /// Validate select message syntax
  void _validateSelectSyntax(
    ArbEntry entry,
    List<ValidationError> errors,
    List<ValidationWarning> warnings,
    List<ValidationSuggestion> suggestions,
  ) {
    final message = entry.value;

    // Check for select pattern: {variable, select, cases}
    final selectPattern = RegExp(r'\{(\w+),\s*select,\s*(.+)\}');
    final match = selectPattern.firstMatch(message);

    if (match == null) {
      errors.add(
        ValidationError(
          message: 'Invalid select syntax. Expected: {variable, select, cases}',
          code: 'INVALID_SELECT_SYNTAX',
          entryKey: entry.key,
          suggestion:
              'Use format: {gender, select, male{he} female{she} other{they}}',
        ),
      );
      return;
    }

    final placeholderName = match.group(1)!;
    final casesStr = match.group(2)!;

    // Validate placeholder exists in metadata
    if (entry.placeholders?.containsKey(placeholderName) != true) {
      errors.add(
        ValidationError(
          message: 'Placeholder "$placeholderName" not defined in metadata',
          code: 'MISSING_PLACEHOLDER_METADATA',
          entryKey: entry.key,
          suggestion: 'Add placeholder metadata for "$placeholderName"',
        ),
      );
    }

    // Parse and validate cases
    final cases = _parseSelectCases(casesStr);

    // Check for required "other" case
    if (!cases.any((c) => c.selector == 'other')) {
      errors.add(
        ValidationError(
          message: 'Missing required "other" case in select message',
          code: 'MISSING_OTHER_CASE',
          entryKey: entry.key,
          suggestion: 'Add "other{...}" case to the select message',
        ),
      );
    }

    // Check for valid case selector format (no spaces, alphanumeric)
    final selectorPattern = RegExp(r'^[a-zA-Z0-9_]+$');
    for (final icuCase in cases) {
      if (!selectorPattern.hasMatch(icuCase.selector)) {
        warnings.add(
          ValidationWarning(
            message:
                'Invalid select selector "${icuCase.selector}". Use alphanumeric characters only.',
            code: 'INVALID_SELECT_SELECTOR',
            entryKey: entry.key,
            suggestion: 'Use alphanumeric characters and underscores only',
          ),
        );
      }
    }

    // Check for duplicate selectors
    final selectors = cases.map((c) => c.selector).toList();
    final duplicates = selectors
        .where((s) => selectors.where((s2) => s2 == s).length > 1)
        .toSet();
    for (final duplicate in duplicates) {
      errors.add(
        ValidationError(
          message: 'Duplicate select selector "$duplicate"',
          code: 'DUPLICATE_SELECT_SELECTOR',
          entryKey: entry.key,
          suggestion: 'Remove duplicate "$duplicate" selector',
        ),
      );
    }
  }

  /// Validate compound (nested) ICU syntax
  void _validateCompoundSyntax(
    ArbEntry entry,
    List<ValidationError> errors,
    List<ValidationWarning> warnings,
    List<ValidationSuggestion> suggestions,
  ) {
    // For compound messages, we need to validate nested structures
    // This is more complex and requires parsing the entire message tree
    warnings.add(
      ValidationWarning(
        message: 'Compound ICU messages require careful review',
        code: 'COMPOUND_MESSAGE_COMPLEXITY',
        entryKey: entry.key,
        suggestion:
            'Ensure nested structures are properly balanced and complete',
      ),
    );
  }

  /// Validate placeholder syntax and consistency
  void _validatePlaceholderSyntax(
    ArbEntry entry,
    List<ValidationError> errors,
    List<ValidationWarning> warnings,
    List<ValidationSuggestion> suggestions,
  ) {
    final message = entry.value;

    // Find all placeholders in the message
    final placeholderPattern = RegExp(r'\{(\w+)\}');
    final messageePlaceholders = placeholderPattern
        .allMatches(message)
        .map((m) => m.group(1)!)
        .toSet();

    // Check that all message placeholders have metadata
    final metadataPlaceholders = entry.placeholders?.keys.toSet() ?? <String>{};

    for (final placeholder in messageePlaceholders) {
      if (!metadataPlaceholders.contains(placeholder)) {
        warnings.add(
          ValidationWarning(
            message:
                'Placeholder "{$placeholder}" used in message but not defined in metadata',
            code: 'UNDEFINED_PLACEHOLDER',
            entryKey: entry.key,
            suggestion: 'Add metadata for placeholder "$placeholder"',
          ),
        );
      }
    }

    // Check for unused placeholder metadata
    for (final placeholder in metadataPlaceholders) {
      if (!messageePlaceholders.contains(placeholder)) {
        suggestions.add(
          ValidationSuggestion(
            message:
                'Placeholder "$placeholder" defined in metadata but not used in message',
            code: 'UNUSED_PLACEHOLDER_METADATA',
            entryKey: entry.key,
            autoFixAvailable: true,
          ),
        );
      }
    }
  }

  /// Validate placeholder consistency across the entry
  void _validatePlaceholderConsistency(
    ArbEntry entry,
    List<ValidationError> errors,
    List<ValidationWarning> warnings,
    List<ValidationSuggestion> suggestions,
  ) {
    // Check that placeholder types are appropriate for their usage
    if (entry.placeholders != null) {
      for (final placeholder in entry.placeholders!.values) {
        // Validate format compatibility with type
        if (placeholder.format != null) {
          _validateFormatCompatibility(
            placeholder,
            errors,
            warnings,
            entry.key,
          );
        }

        // Validate optional parameters
        if (placeholder.optionalParameters != null) {
          _validateOptionalParameters(placeholder, warnings, entry.key);
        }
      }
    }
  }

  /// Validate general ICU syntax (balanced braces, etc.)
  void _validateGeneralIcuSyntax(
    ArbEntry entry,
    List<ValidationError> errors,
    List<ValidationWarning> warnings,
    List<ValidationSuggestion> suggestions,
  ) {
    final message = entry.value;

    // Check for balanced braces
    var braceCount = 0;
    for (var i = 0; i < message.length; i++) {
      if (message[i] == '{') {
        braceCount++;
      } else if (message[i] == '}') {
        braceCount--;
        if (braceCount < 0) {
          errors.add(
            ValidationError(
              message: 'Unmatched closing brace at position $i',
              code: 'UNMATCHED_CLOSING_BRACE',
              entryKey: entry.key,
              column: i,
              suggestion:
                  'Remove extra closing brace or add matching opening brace',
            ),
          );
          return;
        }
      }
    }

    if (braceCount > 0) {
      errors.add(
        ValidationError(
          message:
              'Unmatched opening brace(s). Missing $braceCount closing brace(s)',
          code: 'UNMATCHED_OPENING_BRACE',
          entryKey: entry.key,
          suggestion: 'Add missing closing brace(s)',
        ),
      );
    }
  }

  /// Validate format compatibility with placeholder type
  void _validateFormatCompatibility(
    ArbPlaceholder placeholder,
    List<ValidationError> errors,
    List<ValidationWarning> warnings,
    String entryKey,
  ) {
    final format = placeholder.format!;

    switch (placeholder.type) {
      case PlaceholderType.dateTime:
        final validDateFormats = [
          'yMd',
          'yMMMMd',
          'yMMMd',
          'yMMMEd',
          'yMMMMEEEEd',
          'jm',
          'Hm',
          'Hms',
          'yMMMEd',
          'yQQQ',
          'EEEE',
          'MMMM',
          'MMM',
          'LLLL',
          'LLL',
        ];
        if (!validDateFormats.contains(format)) {
          warnings.add(
            ValidationWarning(
              message:
                  'Unknown date format "$format" for placeholder "${placeholder.name}"',
              code: 'UNKNOWN_DATE_FORMAT',
              entryKey: entryKey,
              suggestion:
                  'Use standard date formats like yMd, yMMMMd, jm, etc.',
            ),
          );
        }
        break;

      case PlaceholderType.num:
      case PlaceholderType.int:
      case PlaceholderType.double:
        final validNumberFormats = [
          'compact',
          'compactCurrency',
          'compactSimpleCurrency',
          'compactLong',
          'currency',
          'decimalPattern',
          'decimalPatternDigits',
          'decimalPercentPattern',
          'percentPattern',
          'scientificPattern',
          'simpleCurrency',
        ];
        if (!validNumberFormats.contains(format)) {
          warnings.add(
            ValidationWarning(
              message:
                  'Unknown number format "$format" for placeholder "${placeholder.name}"',
              code: 'UNKNOWN_NUMBER_FORMAT',
              entryKey: entryKey,
              suggestion:
                  'Use standard number formats like compact, currency, percentPattern, etc.',
            ),
          );
        }
        break;

      case PlaceholderType.string:
        warnings.add(
          ValidationWarning(
            message:
                'Format "$format" specified for String placeholder "${placeholder.name}"',
            code: 'UNNECESSARY_STRING_FORMAT',
            entryKey: entryKey,
            suggestion:
                'String placeholders typically do not need format specifications',
          ),
        );
        break;
    }
  }

  /// Validate optional parameters for placeholders
  void _validateOptionalParameters(
    ArbPlaceholder placeholder,
    List<ValidationWarning> warnings,
    String entryKey,
  ) {
    final params = placeholder.optionalParameters!;

    // Check for unknown parameters based on format
    if (placeholder.format != null) {
      final validParams = _getValidOptionalParameters(placeholder.format!);
      for (final param in params.keys) {
        if (!validParams.contains(param)) {
          warnings.add(
            ValidationWarning(
              message:
                  'Unknown optional parameter "$param" for format "${placeholder.format}"',
              code: 'UNKNOWN_OPTIONAL_PARAMETER',
              entryKey: entryKey,
              suggestion: 'Check format documentation for valid parameters',
            ),
          );
        }
      }
    }
  }

  /// Get valid optional parameters for a format
  Set<String> _getValidOptionalParameters(String format) {
    switch (format) {
      case 'compactCurrency':
      case 'currency':
      case 'simpleCurrency':
        return {'decimalDigits', 'symbol', 'customPattern'};
      case 'decimalPatternDigits':
        return {'decimalDigits'};
      case 'decimalPercentPattern':
        return {'decimalDigits'};
      default:
        return <String>{};
    }
  }

  /// Parse plural cases from cases string
  List<IcuCase> _parsePluralCases(String casesStr) {
    final cases = <IcuCase>[];
    final casePattern = RegExp(r'(=?\w+)\{([^}]*)\}');

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
    final casePattern = RegExp(r'(\w+)\{([^}]*)\}');

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
