// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'arb_entry.dart';

class ArbEntryMapper extends ClassMapperBase<ArbEntry> {
  ArbEntryMapper._();

  static ArbEntryMapper? _instance;
  static ArbEntryMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ArbEntryMapper._());
      ArbEntryTypeMapper.ensureInitialized();
      ArbPlaceholderMapper.ensureInitialized();
      ArbEntryMetadataMapper.ensureInitialized();
      IcuCaseMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'ArbEntry';

  static String _$key(ArbEntry v) => v.key;
  static const Field<ArbEntry, String> _f$key = Field('key', _$key);
  static String _$value(ArbEntry v) => v.value;
  static const Field<ArbEntry, String> _f$value = Field('value', _$value);
  static ArbEntryType _$type(ArbEntry v) => v.type;
  static const Field<ArbEntry, ArbEntryType> _f$type = Field('type', _$type);
  static Map<String, ArbPlaceholder>? _$placeholders(ArbEntry v) =>
      v.placeholders;
  static const Field<ArbEntry, Map<String, ArbPlaceholder>> _f$placeholders =
      Field('placeholders', _$placeholders, opt: true);
  static ArbEntryMetadata? _$metadata(ArbEntry v) => v.metadata;
  static const Field<ArbEntry, ArbEntryMetadata> _f$metadata = Field(
    'metadata',
    _$metadata,
    opt: true,
  );
  static List<IcuCase>? _$pluralCases(ArbEntry v) => v.pluralCases;
  static const Field<ArbEntry, List<IcuCase>> _f$pluralCases = Field(
    'pluralCases',
    _$pluralCases,
    opt: true,
  );
  static List<IcuCase>? _$selectCases(ArbEntry v) => v.selectCases;
  static const Field<ArbEntry, List<IcuCase>> _f$selectCases = Field(
    'selectCases',
    _$selectCases,
    opt: true,
  );
  static bool _$hasNestedStructures(ArbEntry v) => v.hasNestedStructures;
  static const Field<ArbEntry, bool> _f$hasNestedStructures = Field(
    'hasNestedStructures',
    _$hasNestedStructures,
    opt: true,
    def: false,
  );
  static bool _$hasPlaceholders(ArbEntry v) => v.hasPlaceholders;
  static const Field<ArbEntry, bool> _f$hasPlaceholders = Field(
    'hasPlaceholders',
    _$hasPlaceholders,
    mode: FieldMode.member,
  );
  static bool _$isPlural(ArbEntry v) => v.isPlural;
  static const Field<ArbEntry, bool> _f$isPlural = Field(
    'isPlural',
    _$isPlural,
    mode: FieldMode.member,
  );
  static bool _$isSelect(ArbEntry v) => v.isSelect;
  static const Field<ArbEntry, bool> _f$isSelect = Field(
    'isSelect',
    _$isSelect,
    mode: FieldMode.member,
  );
  static List<String> _$placeholderNames(ArbEntry v) => v.placeholderNames;
  static const Field<ArbEntry, List<String>> _f$placeholderNames = Field(
    'placeholderNames',
    _$placeholderNames,
    mode: FieldMode.member,
  );
  static bool _$hasRequiredOtherCase(ArbEntry v) => v.hasRequiredOtherCase;
  static const Field<ArbEntry, bool> _f$hasRequiredOtherCase = Field(
    'hasRequiredOtherCase',
    _$hasRequiredOtherCase,
    mode: FieldMode.member,
  );

  @override
  final MappableFields<ArbEntry> fields = const {
    #key: _f$key,
    #value: _f$value,
    #type: _f$type,
    #placeholders: _f$placeholders,
    #metadata: _f$metadata,
    #pluralCases: _f$pluralCases,
    #selectCases: _f$selectCases,
    #hasNestedStructures: _f$hasNestedStructures,
    #hasPlaceholders: _f$hasPlaceholders,
    #isPlural: _f$isPlural,
    #isSelect: _f$isSelect,
    #placeholderNames: _f$placeholderNames,
    #hasRequiredOtherCase: _f$hasRequiredOtherCase,
  };

  static ArbEntry _instantiate(DecodingData data) {
    return ArbEntry(
      key: data.dec(_f$key),
      value: data.dec(_f$value),
      type: data.dec(_f$type),
      placeholders: data.dec(_f$placeholders),
      metadata: data.dec(_f$metadata),
      pluralCases: data.dec(_f$pluralCases),
      selectCases: data.dec(_f$selectCases),
      hasNestedStructures: data.dec(_f$hasNestedStructures),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static ArbEntry fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ArbEntry>(map);
  }

  static ArbEntry fromJson(String json) {
    return ensureInitialized().decodeJson<ArbEntry>(json);
  }
}

mixin ArbEntryMappable {
  String toJson() {
    return ArbEntryMapper.ensureInitialized().encodeJson<ArbEntry>(
      this as ArbEntry,
    );
  }

  Map<String, dynamic> toMap() {
    return ArbEntryMapper.ensureInitialized().encodeMap<ArbEntry>(
      this as ArbEntry,
    );
  }

  ArbEntryCopyWith<ArbEntry, ArbEntry, ArbEntry> get copyWith =>
      _ArbEntryCopyWithImpl<ArbEntry, ArbEntry>(
        this as ArbEntry,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return ArbEntryMapper.ensureInitialized().stringifyValue(this as ArbEntry);
  }

  @override
  bool operator ==(Object other) {
    return ArbEntryMapper.ensureInitialized().equalsValue(
      this as ArbEntry,
      other,
    );
  }

  @override
  int get hashCode {
    return ArbEntryMapper.ensureInitialized().hashValue(this as ArbEntry);
  }
}

extension ArbEntryValueCopy<$R, $Out> on ObjectCopyWith<$R, ArbEntry, $Out> {
  ArbEntryCopyWith<$R, ArbEntry, $Out> get $asArbEntry =>
      $base.as((v, t, t2) => _ArbEntryCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class ArbEntryCopyWith<$R, $In extends ArbEntry, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  MapCopyWith<
    $R,
    String,
    ArbPlaceholder,
    ArbPlaceholderCopyWith<$R, ArbPlaceholder, ArbPlaceholder>
  >?
  get placeholders;
  ArbEntryMetadataCopyWith<$R, ArbEntryMetadata, ArbEntryMetadata>?
  get metadata;
  ListCopyWith<$R, IcuCase, IcuCaseCopyWith<$R, IcuCase, IcuCase>>?
  get pluralCases;
  ListCopyWith<$R, IcuCase, IcuCaseCopyWith<$R, IcuCase, IcuCase>>?
  get selectCases;
  $R call({
    String? key,
    String? value,
    ArbEntryType? type,
    Map<String, ArbPlaceholder>? placeholders,
    ArbEntryMetadata? metadata,
    List<IcuCase>? pluralCases,
    List<IcuCase>? selectCases,
    bool? hasNestedStructures,
  });
  ArbEntryCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ArbEntryCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ArbEntry, $Out>
    implements ArbEntryCopyWith<$R, ArbEntry, $Out> {
  _ArbEntryCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ArbEntry> $mapper =
      ArbEntryMapper.ensureInitialized();
  @override
  MapCopyWith<
    $R,
    String,
    ArbPlaceholder,
    ArbPlaceholderCopyWith<$R, ArbPlaceholder, ArbPlaceholder>
  >?
  get placeholders => $value.placeholders != null
      ? MapCopyWith(
          $value.placeholders!,
          (v, t) => v.copyWith.$chain(t),
          (v) => call(placeholders: v),
        )
      : null;
  @override
  ArbEntryMetadataCopyWith<$R, ArbEntryMetadata, ArbEntryMetadata>?
  get metadata => $value.metadata?.copyWith.$chain((v) => call(metadata: v));
  @override
  ListCopyWith<$R, IcuCase, IcuCaseCopyWith<$R, IcuCase, IcuCase>>?
  get pluralCases => $value.pluralCases != null
      ? ListCopyWith(
          $value.pluralCases!,
          (v, t) => v.copyWith.$chain(t),
          (v) => call(pluralCases: v),
        )
      : null;
  @override
  ListCopyWith<$R, IcuCase, IcuCaseCopyWith<$R, IcuCase, IcuCase>>?
  get selectCases => $value.selectCases != null
      ? ListCopyWith(
          $value.selectCases!,
          (v, t) => v.copyWith.$chain(t),
          (v) => call(selectCases: v),
        )
      : null;
  @override
  $R call({
    String? key,
    String? value,
    ArbEntryType? type,
    Object? placeholders = $none,
    Object? metadata = $none,
    Object? pluralCases = $none,
    Object? selectCases = $none,
    bool? hasNestedStructures,
  }) => $apply(
    FieldCopyWithData({
      if (key != null) #key: key,
      if (value != null) #value: value,
      if (type != null) #type: type,
      if (placeholders != $none) #placeholders: placeholders,
      if (metadata != $none) #metadata: metadata,
      if (pluralCases != $none) #pluralCases: pluralCases,
      if (selectCases != $none) #selectCases: selectCases,
      if (hasNestedStructures != null)
        #hasNestedStructures: hasNestedStructures,
    }),
  );
  @override
  ArbEntry $make(CopyWithData data) => ArbEntry(
    key: data.get(#key, or: $value.key),
    value: data.get(#value, or: $value.value),
    type: data.get(#type, or: $value.type),
    placeholders: data.get(#placeholders, or: $value.placeholders),
    metadata: data.get(#metadata, or: $value.metadata),
    pluralCases: data.get(#pluralCases, or: $value.pluralCases),
    selectCases: data.get(#selectCases, or: $value.selectCases),
    hasNestedStructures: data.get(
      #hasNestedStructures,
      or: $value.hasNestedStructures,
    ),
  );

  @override
  ArbEntryCopyWith<$R2, ArbEntry, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _ArbEntryCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

