// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'arb_entry_type.dart';

class ArbEntryTypeMapper extends EnumMapper<ArbEntryType> {
  ArbEntryTypeMapper._();

  static ArbEntryTypeMapper? _instance;
  static ArbEntryTypeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ArbEntryTypeMapper._());
    }
    return _instance!;
  }

  static ArbEntryType fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  ArbEntryType decode(dynamic value) {
    switch (value) {
      case r'simple':
        return ArbEntryType.simple;
      case r'plural':
        return ArbEntryType.plural;
      case r'select':
        return ArbEntryType.select;
      case r'compound':
        return ArbEntryType.compound;
      case r'withPlaceholders':
        return ArbEntryType.withPlaceholders;
      case r'withDateFormat':
        return ArbEntryType.withDateFormat;
      case r'withNumberFormat':
        return ArbEntryType.withNumberFormat;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(ArbEntryType self) {
    switch (self) {
      case ArbEntryType.simple:
        return r'simple';
      case ArbEntryType.plural:
        return r'plural';
      case ArbEntryType.select:
        return r'select';
      case ArbEntryType.compound:
        return r'compound';
      case ArbEntryType.withPlaceholders:
        return r'withPlaceholders';
      case ArbEntryType.withDateFormat:
        return r'withDateFormat';
      case ArbEntryType.withNumberFormat:
        return r'withNumberFormat';
    }
  }
}

extension ArbEntryTypeMapperExtension on ArbEntryType {
  String toValue() {
    ArbEntryTypeMapper.ensureInitialized();
    return MapperContainer.globals.toValue<ArbEntryType>(this) as String;
  }
}

