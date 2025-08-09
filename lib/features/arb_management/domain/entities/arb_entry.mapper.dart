// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'arb_entry.dart';

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

class PlaceholderTypeMapper extends EnumMapper<PlaceholderType> {
  PlaceholderTypeMapper._();

  static PlaceholderTypeMapper? _instance;
  static PlaceholderTypeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = PlaceholderTypeMapper._());
    }
    return _instance!;
  }

  static PlaceholderType fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  PlaceholderType decode(dynamic value) {
    switch (value) {
      case r'string':
        return PlaceholderType.string;
      case r'int':
        return PlaceholderType.int;
      case r'double':
        return PlaceholderType.double;
      case r'num':
        return PlaceholderType.num;
      case r'dateTime':
        return PlaceholderType.dateTime;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(PlaceholderType self) {
    switch (self) {
      case PlaceholderType.string:
        return r'string';
      case PlaceholderType.int:
        return r'int';
      case PlaceholderType.double:
        return r'double';
      case PlaceholderType.num:
        return r'num';
      case PlaceholderType.dateTime:
        return r'dateTime';
    }
  }
}

extension PlaceholderTypeMapperExtension on PlaceholderType {
  String toValue() {
    PlaceholderTypeMapper.ensureInitialized();
    return MapperContainer.globals.toValue<PlaceholderType>(this) as String;
  }
}

class ArbPlaceholderMapper extends ClassMapperBase<ArbPlaceholder> {
  ArbPlaceholderMapper._();

  static ArbPlaceholderMapper? _instance;
  static ArbPlaceholderMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ArbPlaceholderMapper._());
      PlaceholderTypeMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'ArbPlaceholder';

  static String _$name(ArbPlaceholder v) => v.name;
  static const Field<ArbPlaceholder, String> _f$name = Field('name', _$name);
  static PlaceholderType _$type(ArbPlaceholder v) => v.type;
  static const Field<ArbPlaceholder, PlaceholderType> _f$type = Field(
    'type',
    _$type,
  );
  static String? _$format(ArbPlaceholder v) => v.format;
  static const Field<ArbPlaceholder, String> _f$format = Field(
    'format',
    _$format,
    opt: true,
  );
  static Map<String, dynamic>? _$optionalParameters(ArbPlaceholder v) =>
      v.optionalParameters;
  static const Field<ArbPlaceholder, Map<String, dynamic>>
  _f$optionalParameters = Field(
    'optionalParameters',
    _$optionalParameters,
    opt: true,
  );
  static String? _$example(ArbPlaceholder v) => v.example;
  static const Field<ArbPlaceholder, String> _f$example = Field(
    'example',
    _$example,
    opt: true,
  );
  static String? _$description(ArbPlaceholder v) => v.description;
  static const Field<ArbPlaceholder, String> _f$description = Field(
    'description',
    _$description,
    opt: true,
  );

  @override
  final MappableFields<ArbPlaceholder> fields = const {
    #name: _f$name,
    #type: _f$type,
    #format: _f$format,
    #optionalParameters: _f$optionalParameters,
    #example: _f$example,
    #description: _f$description,
  };

  static ArbPlaceholder _instantiate(DecodingData data) {
    return ArbPlaceholder(
      name: data.dec(_f$name),
      type: data.dec(_f$type),
      format: data.dec(_f$format),
      optionalParameters: data.dec(_f$optionalParameters),
      example: data.dec(_f$example),
      description: data.dec(_f$description),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static ArbPlaceholder fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ArbPlaceholder>(map);
  }

  static ArbPlaceholder fromJson(String json) {
    return ensureInitialized().decodeJson<ArbPlaceholder>(json);
  }
}

mixin ArbPlaceholderMappable {
  String toJson() {
    return ArbPlaceholderMapper.ensureInitialized().encodeJson<ArbPlaceholder>(
      this as ArbPlaceholder,
    );
  }

  Map<String, dynamic> toMap() {
    return ArbPlaceholderMapper.ensureInitialized().encodeMap<ArbPlaceholder>(
      this as ArbPlaceholder,
    );
  }

  ArbPlaceholderCopyWith<ArbPlaceholder, ArbPlaceholder, ArbPlaceholder>
  get copyWith => _ArbPlaceholderCopyWithImpl<ArbPlaceholder, ArbPlaceholder>(
    this as ArbPlaceholder,
    $identity,
    $identity,
  );
  @override
  String toString() {
    return ArbPlaceholderMapper.ensureInitialized().stringifyValue(
      this as ArbPlaceholder,
    );
  }

  @override
  bool operator ==(Object other) {
    return ArbPlaceholderMapper.ensureInitialized().equalsValue(
      this as ArbPlaceholder,
      other,
    );
  }

  @override
  int get hashCode {
    return ArbPlaceholderMapper.ensureInitialized().hashValue(
      this as ArbPlaceholder,
    );
  }
}

extension ArbPlaceholderValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ArbPlaceholder, $Out> {
  ArbPlaceholderCopyWith<$R, ArbPlaceholder, $Out> get $asArbPlaceholder =>
      $base.as((v, t, t2) => _ArbPlaceholderCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class ArbPlaceholderCopyWith<$R, $In extends ArbPlaceholder, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  MapCopyWith<$R, String, dynamic, ObjectCopyWith<$R, dynamic, dynamic>>?
  get optionalParameters;
  $R call({
    String? name,
    PlaceholderType? type,
    String? format,
    Map<String, dynamic>? optionalParameters,
    String? example,
    String? description,
  });
  ArbPlaceholderCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _ArbPlaceholderCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ArbPlaceholder, $Out>
    implements ArbPlaceholderCopyWith<$R, ArbPlaceholder, $Out> {
  _ArbPlaceholderCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ArbPlaceholder> $mapper =
      ArbPlaceholderMapper.ensureInitialized();
  @override
  MapCopyWith<$R, String, dynamic, ObjectCopyWith<$R, dynamic, dynamic>>?
  get optionalParameters => $value.optionalParameters != null
      ? MapCopyWith(
          $value.optionalParameters!,
          (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(optionalParameters: v),
        )
      : null;
  @override
  $R call({
    String? name,
    PlaceholderType? type,
    Object? format = $none,
    Object? optionalParameters = $none,
    Object? example = $none,
    Object? description = $none,
  }) => $apply(
    FieldCopyWithData({
      if (name != null) #name: name,
      if (type != null) #type: type,
      if (format != $none) #format: format,
      if (optionalParameters != $none) #optionalParameters: optionalParameters,
      if (example != $none) #example: example,
      if (description != $none) #description: description,
    }),
  );
  @override
  ArbPlaceholder $make(CopyWithData data) => ArbPlaceholder(
    name: data.get(#name, or: $value.name),
    type: data.get(#type, or: $value.type),
    format: data.get(#format, or: $value.format),
    optionalParameters: data.get(
      #optionalParameters,
      or: $value.optionalParameters,
    ),
    example: data.get(#example, or: $value.example),
    description: data.get(#description, or: $value.description),
  );

  @override
  ArbPlaceholderCopyWith<$R2, ArbPlaceholder, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _ArbPlaceholderCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class IcuCaseMapper extends ClassMapperBase<IcuCase> {
  IcuCaseMapper._();

  static IcuCaseMapper? _instance;
  static IcuCaseMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = IcuCaseMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'IcuCase';

  static String _$selector(IcuCase v) => v.selector;
  static const Field<IcuCase, String> _f$selector = Field(
    'selector',
    _$selector,
  );
  static String _$message(IcuCase v) => v.message;
  static const Field<IcuCase, String> _f$message = Field('message', _$message);
  static bool _$isRequired(IcuCase v) => v.isRequired;
  static const Field<IcuCase, bool> _f$isRequired = Field(
    'isRequired',
    _$isRequired,
  );

  @override
  final MappableFields<IcuCase> fields = const {
    #selector: _f$selector,
    #message: _f$message,
    #isRequired: _f$isRequired,
  };

  static IcuCase _instantiate(DecodingData data) {
    return IcuCase(
      selector: data.dec(_f$selector),
      message: data.dec(_f$message),
      isRequired: data.dec(_f$isRequired),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static IcuCase fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<IcuCase>(map);
  }

  static IcuCase fromJson(String json) {
    return ensureInitialized().decodeJson<IcuCase>(json);
  }
}

mixin IcuCaseMappable {
  String toJson() {
    return IcuCaseMapper.ensureInitialized().encodeJson<IcuCase>(
      this as IcuCase,
    );
  }

  Map<String, dynamic> toMap() {
    return IcuCaseMapper.ensureInitialized().encodeMap<IcuCase>(
      this as IcuCase,
    );
  }

  IcuCaseCopyWith<IcuCase, IcuCase, IcuCase> get copyWith =>
      _IcuCaseCopyWithImpl<IcuCase, IcuCase>(
        this as IcuCase,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return IcuCaseMapper.ensureInitialized().stringifyValue(this as IcuCase);
  }

  @override
  bool operator ==(Object other) {
    return IcuCaseMapper.ensureInitialized().equalsValue(
      this as IcuCase,
      other,
    );
  }

  @override
  int get hashCode {
    return IcuCaseMapper.ensureInitialized().hashValue(this as IcuCase);
  }
}

extension IcuCaseValueCopy<$R, $Out> on ObjectCopyWith<$R, IcuCase, $Out> {
  IcuCaseCopyWith<$R, IcuCase, $Out> get $asIcuCase =>
      $base.as((v, t, t2) => _IcuCaseCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class IcuCaseCopyWith<$R, $In extends IcuCase, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? selector, String? message, bool? isRequired});
  IcuCaseCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _IcuCaseCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, IcuCase, $Out>
    implements IcuCaseCopyWith<$R, IcuCase, $Out> {
  _IcuCaseCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<IcuCase> $mapper =
      IcuCaseMapper.ensureInitialized();
  @override
  $R call({String? selector, String? message, bool? isRequired}) => $apply(
    FieldCopyWithData({
      if (selector != null) #selector: selector,
      if (message != null) #message: message,
      if (isRequired != null) #isRequired: isRequired,
    }),
  );
  @override
  IcuCase $make(CopyWithData data) => IcuCase(
    selector: data.get(#selector, or: $value.selector),
    message: data.get(#message, or: $value.message),
    isRequired: data.get(#isRequired, or: $value.isRequired),
  );

  @override
  IcuCaseCopyWith<$R2, IcuCase, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _IcuCaseCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class ArbEntryMetadataMapper extends ClassMapperBase<ArbEntryMetadata> {
  ArbEntryMetadataMapper._();

  static ArbEntryMetadataMapper? _instance;
  static ArbEntryMetadataMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ArbEntryMetadataMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'ArbEntryMetadata';

  static String? _$description(ArbEntryMetadata v) => v.description;
  static const Field<ArbEntryMetadata, String> _f$description = Field(
    'description',
    _$description,
    opt: true,
  );
  static String? _$context(ArbEntryMetadata v) => v.context;
  static const Field<ArbEntryMetadata, String> _f$context = Field(
    'context',
    _$context,
    opt: true,
  );
  static List<String>? _$examples(ArbEntryMetadata v) => v.examples;
  static const Field<ArbEntryMetadata, List<String>> _f$examples = Field(
    'examples',
    _$examples,
    opt: true,
  );
  static String? _$translatorNotes(ArbEntryMetadata v) => v.translatorNotes;
  static const Field<ArbEntryMetadata, String> _f$translatorNotes = Field(
    'translatorNotes',
    _$translatorNotes,
    opt: true,
  );

  @override
  final MappableFields<ArbEntryMetadata> fields = const {
    #description: _f$description,
    #context: _f$context,
    #examples: _f$examples,
    #translatorNotes: _f$translatorNotes,
  };

  static ArbEntryMetadata _instantiate(DecodingData data) {
    return ArbEntryMetadata(
      description: data.dec(_f$description),
      context: data.dec(_f$context),
      examples: data.dec(_f$examples),
      translatorNotes: data.dec(_f$translatorNotes),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static ArbEntryMetadata fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ArbEntryMetadata>(map);
  }

  static ArbEntryMetadata fromJson(String json) {
    return ensureInitialized().decodeJson<ArbEntryMetadata>(json);
  }
}

mixin ArbEntryMetadataMappable {
  String toJson() {
    return ArbEntryMetadataMapper.ensureInitialized()
        .encodeJson<ArbEntryMetadata>(this as ArbEntryMetadata);
  }

  Map<String, dynamic> toMap() {
    return ArbEntryMetadataMapper.ensureInitialized()
        .encodeMap<ArbEntryMetadata>(this as ArbEntryMetadata);
  }

  ArbEntryMetadataCopyWith<ArbEntryMetadata, ArbEntryMetadata, ArbEntryMetadata>
  get copyWith =>
      _ArbEntryMetadataCopyWithImpl<ArbEntryMetadata, ArbEntryMetadata>(
        this as ArbEntryMetadata,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return ArbEntryMetadataMapper.ensureInitialized().stringifyValue(
      this as ArbEntryMetadata,
    );
  }

  @override
  bool operator ==(Object other) {
    return ArbEntryMetadataMapper.ensureInitialized().equalsValue(
      this as ArbEntryMetadata,
      other,
    );
  }

  @override
  int get hashCode {
    return ArbEntryMetadataMapper.ensureInitialized().hashValue(
      this as ArbEntryMetadata,
    );
  }
}

extension ArbEntryMetadataValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ArbEntryMetadata, $Out> {
  ArbEntryMetadataCopyWith<$R, ArbEntryMetadata, $Out>
  get $asArbEntryMetadata =>
      $base.as((v, t, t2) => _ArbEntryMetadataCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class ArbEntryMetadataCopyWith<$R, $In extends ArbEntryMetadata, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>? get examples;
  $R call({
    String? description,
    String? context,
    List<String>? examples,
    String? translatorNotes,
  });
  ArbEntryMetadataCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _ArbEntryMetadataCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ArbEntryMetadata, $Out>
    implements ArbEntryMetadataCopyWith<$R, ArbEntryMetadata, $Out> {
  _ArbEntryMetadataCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ArbEntryMetadata> $mapper =
      ArbEntryMetadataMapper.ensureInitialized();
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>? get examples =>
      $value.examples != null
      ? ListCopyWith(
          $value.examples!,
          (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(examples: v),
        )
      : null;
  @override
  $R call({
    Object? description = $none,
    Object? context = $none,
    Object? examples = $none,
    Object? translatorNotes = $none,
  }) => $apply(
    FieldCopyWithData({
      if (description != $none) #description: description,
      if (context != $none) #context: context,
      if (examples != $none) #examples: examples,
      if (translatorNotes != $none) #translatorNotes: translatorNotes,
    }),
  );
  @override
  ArbEntryMetadata $make(CopyWithData data) => ArbEntryMetadata(
    description: data.get(#description, or: $value.description),
    context: data.get(#context, or: $value.context),
    examples: data.get(#examples, or: $value.examples),
    translatorNotes: data.get(#translatorNotes, or: $value.translatorNotes),
  );

  @override
  ArbEntryMetadataCopyWith<$R2, ArbEntryMetadata, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _ArbEntryMetadataCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

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

