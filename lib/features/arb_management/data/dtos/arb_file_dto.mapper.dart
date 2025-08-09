// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'arb_file_dto.dart';

class ArbEntryMetadataDtoMapper extends ClassMapperBase<ArbEntryMetadataDto> {
  ArbEntryMetadataDtoMapper._();

  static ArbEntryMetadataDtoMapper? _instance;
  static ArbEntryMetadataDtoMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ArbEntryMetadataDtoMapper._());
      PlaceholderDtoMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'ArbEntryMetadataDto';

  static String? _$description(ArbEntryMetadataDto v) => v.description;
  static const Field<ArbEntryMetadataDto, String> _f$description = Field(
    'description',
    _$description,
    opt: true,
  );
  static Map<String, PlaceholderDto>? _$placeholders(ArbEntryMetadataDto v) =>
      v.placeholders;
  static const Field<ArbEntryMetadataDto, Map<String, PlaceholderDto>>
  _f$placeholders = Field('placeholders', _$placeholders, opt: true);
  static String? _$context(ArbEntryMetadataDto v) => v.context;
  static const Field<ArbEntryMetadataDto, String> _f$context = Field(
    'context',
    _$context,
    opt: true,
  );
  static List<String>? _$examples(ArbEntryMetadataDto v) => v.examples;
  static const Field<ArbEntryMetadataDto, List<String>> _f$examples = Field(
    'examples',
    _$examples,
    opt: true,
  );

  @override
  final MappableFields<ArbEntryMetadataDto> fields = const {
    #description: _f$description,
    #placeholders: _f$placeholders,
    #context: _f$context,
    #examples: _f$examples,
  };

  static ArbEntryMetadataDto _instantiate(DecodingData data) {
    return ArbEntryMetadataDto(
      description: data.dec(_f$description),
      placeholders: data.dec(_f$placeholders),
      context: data.dec(_f$context),
      examples: data.dec(_f$examples),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static ArbEntryMetadataDto fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ArbEntryMetadataDto>(map);
  }

  static ArbEntryMetadataDto fromJson(String json) {
    return ensureInitialized().decodeJson<ArbEntryMetadataDto>(json);
  }
}

mixin ArbEntryMetadataDtoMappable {
  String toJson() {
    return ArbEntryMetadataDtoMapper.ensureInitialized()
        .encodeJson<ArbEntryMetadataDto>(this as ArbEntryMetadataDto);
  }

  Map<String, dynamic> toMap() {
    return ArbEntryMetadataDtoMapper.ensureInitialized()
        .encodeMap<ArbEntryMetadataDto>(this as ArbEntryMetadataDto);
  }

  ArbEntryMetadataDtoCopyWith<
    ArbEntryMetadataDto,
    ArbEntryMetadataDto,
    ArbEntryMetadataDto
  >
  get copyWith =>
      _ArbEntryMetadataDtoCopyWithImpl<
        ArbEntryMetadataDto,
        ArbEntryMetadataDto
      >(this as ArbEntryMetadataDto, $identity, $identity);
  @override
  String toString() {
    return ArbEntryMetadataDtoMapper.ensureInitialized().stringifyValue(
      this as ArbEntryMetadataDto,
    );
  }

  @override
  bool operator ==(Object other) {
    return ArbEntryMetadataDtoMapper.ensureInitialized().equalsValue(
      this as ArbEntryMetadataDto,
      other,
    );
  }

  @override
  int get hashCode {
    return ArbEntryMetadataDtoMapper.ensureInitialized().hashValue(
      this as ArbEntryMetadataDto,
    );
  }
}

extension ArbEntryMetadataDtoValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ArbEntryMetadataDto, $Out> {
  ArbEntryMetadataDtoCopyWith<$R, ArbEntryMetadataDto, $Out>
  get $asArbEntryMetadataDto => $base.as(
    (v, t, t2) => _ArbEntryMetadataDtoCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class ArbEntryMetadataDtoCopyWith<
  $R,
  $In extends ArbEntryMetadataDto,
  $Out
>
    implements ClassCopyWith<$R, $In, $Out> {
  MapCopyWith<
    $R,
    String,
    PlaceholderDto,
    PlaceholderDtoCopyWith<$R, PlaceholderDto, PlaceholderDto>
  >?
  get placeholders;
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>? get examples;
  $R call({
    String? description,
    Map<String, PlaceholderDto>? placeholders,
    String? context,
    List<String>? examples,
  });
  ArbEntryMetadataDtoCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _ArbEntryMetadataDtoCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ArbEntryMetadataDto, $Out>
    implements ArbEntryMetadataDtoCopyWith<$R, ArbEntryMetadataDto, $Out> {
  _ArbEntryMetadataDtoCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ArbEntryMetadataDto> $mapper =
      ArbEntryMetadataDtoMapper.ensureInitialized();
  @override
  MapCopyWith<
    $R,
    String,
    PlaceholderDto,
    PlaceholderDtoCopyWith<$R, PlaceholderDto, PlaceholderDto>
  >?
  get placeholders => $value.placeholders != null
      ? MapCopyWith(
          $value.placeholders!,
          (v, t) => v.copyWith.$chain(t),
          (v) => call(placeholders: v),
        )
      : null;
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
    Object? placeholders = $none,
    Object? context = $none,
    Object? examples = $none,
  }) => $apply(
    FieldCopyWithData({
      if (description != $none) #description: description,
      if (placeholders != $none) #placeholders: placeholders,
      if (context != $none) #context: context,
      if (examples != $none) #examples: examples,
    }),
  );
  @override
  ArbEntryMetadataDto $make(CopyWithData data) => ArbEntryMetadataDto(
    description: data.get(#description, or: $value.description),
    placeholders: data.get(#placeholders, or: $value.placeholders),
    context: data.get(#context, or: $value.context),
    examples: data.get(#examples, or: $value.examples),
  );

  @override
  ArbEntryMetadataDtoCopyWith<$R2, ArbEntryMetadataDto, $Out2>
  $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _ArbEntryMetadataDtoCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class PlaceholderDtoMapper extends ClassMapperBase<PlaceholderDto> {
  PlaceholderDtoMapper._();

  static PlaceholderDtoMapper? _instance;
  static PlaceholderDtoMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = PlaceholderDtoMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'PlaceholderDto';

  static String _$name(PlaceholderDto v) => v.name;
  static const Field<PlaceholderDto, String> _f$name = Field('name', _$name);
  static String _$type(PlaceholderDto v) => v.type;
  static const Field<PlaceholderDto, String> _f$type = Field('type', _$type);
  static String? _$format(PlaceholderDto v) => v.format;
  static const Field<PlaceholderDto, String> _f$format = Field(
    'format',
    _$format,
    opt: true,
  );
  static Map<String, dynamic>? _$optionalParameters(PlaceholderDto v) =>
      v.optionalParameters;
  static const Field<PlaceholderDto, Map<String, dynamic>>
  _f$optionalParameters = Field(
    'optionalParameters',
    _$optionalParameters,
    opt: true,
  );
  static String? _$example(PlaceholderDto v) => v.example;
  static const Field<PlaceholderDto, String> _f$example = Field(
    'example',
    _$example,
    opt: true,
  );
  static String? _$description(PlaceholderDto v) => v.description;
  static const Field<PlaceholderDto, String> _f$description = Field(
    'description',
    _$description,
    opt: true,
  );

  @override
  final MappableFields<PlaceholderDto> fields = const {
    #name: _f$name,
    #type: _f$type,
    #format: _f$format,
    #optionalParameters: _f$optionalParameters,
    #example: _f$example,
    #description: _f$description,
  };

  static PlaceholderDto _instantiate(DecodingData data) {
    return PlaceholderDto(
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

  static PlaceholderDto fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<PlaceholderDto>(map);
  }

  static PlaceholderDto fromJson(String json) {
    return ensureInitialized().decodeJson<PlaceholderDto>(json);
  }
}

mixin PlaceholderDtoMappable {
  String toJson() {
    return PlaceholderDtoMapper.ensureInitialized().encodeJson<PlaceholderDto>(
      this as PlaceholderDto,
    );
  }

  Map<String, dynamic> toMap() {
    return PlaceholderDtoMapper.ensureInitialized().encodeMap<PlaceholderDto>(
      this as PlaceholderDto,
    );
  }

  PlaceholderDtoCopyWith<PlaceholderDto, PlaceholderDto, PlaceholderDto>
  get copyWith => _PlaceholderDtoCopyWithImpl<PlaceholderDto, PlaceholderDto>(
    this as PlaceholderDto,
    $identity,
    $identity,
  );
  @override
  String toString() {
    return PlaceholderDtoMapper.ensureInitialized().stringifyValue(
      this as PlaceholderDto,
    );
  }

  @override
  bool operator ==(Object other) {
    return PlaceholderDtoMapper.ensureInitialized().equalsValue(
      this as PlaceholderDto,
      other,
    );
  }

  @override
  int get hashCode {
    return PlaceholderDtoMapper.ensureInitialized().hashValue(
      this as PlaceholderDto,
    );
  }
}

extension PlaceholderDtoValueCopy<$R, $Out>
    on ObjectCopyWith<$R, PlaceholderDto, $Out> {
  PlaceholderDtoCopyWith<$R, PlaceholderDto, $Out> get $asPlaceholderDto =>
      $base.as((v, t, t2) => _PlaceholderDtoCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class PlaceholderDtoCopyWith<$R, $In extends PlaceholderDto, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  MapCopyWith<$R, String, dynamic, ObjectCopyWith<$R, dynamic, dynamic>>?
  get optionalParameters;
  $R call({
    String? name,
    String? type,
    String? format,
    Map<String, dynamic>? optionalParameters,
    String? example,
    String? description,
  });
  PlaceholderDtoCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _PlaceholderDtoCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, PlaceholderDto, $Out>
    implements PlaceholderDtoCopyWith<$R, PlaceholderDto, $Out> {
  _PlaceholderDtoCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<PlaceholderDto> $mapper =
      PlaceholderDtoMapper.ensureInitialized();
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
    String? type,
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
  PlaceholderDto $make(CopyWithData data) => PlaceholderDto(
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
  PlaceholderDtoCopyWith<$R2, PlaceholderDto, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _PlaceholderDtoCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class ArbFileDtoMapper extends ClassMapperBase<ArbFileDto> {
  ArbFileDtoMapper._();

  static ArbFileDtoMapper? _instance;
  static ArbFileDtoMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ArbFileDtoMapper._());
      ArbEntryMetadataDtoMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'ArbFileDto';

  static String _$filePath(ArbFileDto v) => v.filePath;
  static const Field<ArbFileDto, String> _f$filePath = Field(
    'filePath',
    _$filePath,
  );
  static String _$locale(ArbFileDto v) => v.locale;
  static const Field<ArbFileDto, String> _f$locale = Field('locale', _$locale);
  static Map<String, String> _$entries(ArbFileDto v) => v.entries;
  static const Field<ArbFileDto, Map<String, String>> _f$entries = Field(
    'entries',
    _$entries,
  );
  static Map<String, ArbEntryMetadataDto> _$metadata(ArbFileDto v) =>
      v.metadata;
  static const Field<ArbFileDto, Map<String, ArbEntryMetadataDto>> _f$metadata =
      Field('metadata', _$metadata);
  static String? _$context(ArbFileDto v) => v.context;
  static const Field<ArbFileDto, String> _f$context = Field(
    'context',
    _$context,
    opt: true,
  );
  static String? _$author(ArbFileDto v) => v.author;
  static const Field<ArbFileDto, String> _f$author = Field(
    'author',
    _$author,
    opt: true,
  );
  static String? _$version(ArbFileDto v) => v.version;
  static const Field<ArbFileDto, String> _f$version = Field(
    'version',
    _$version,
    opt: true,
  );

  @override
  final MappableFields<ArbFileDto> fields = const {
    #filePath: _f$filePath,
    #locale: _f$locale,
    #entries: _f$entries,
    #metadata: _f$metadata,
    #context: _f$context,
    #author: _f$author,
    #version: _f$version,
  };

  static ArbFileDto _instantiate(DecodingData data) {
    return ArbFileDto(
      filePath: data.dec(_f$filePath),
      locale: data.dec(_f$locale),
      entries: data.dec(_f$entries),
      metadata: data.dec(_f$metadata),
      context: data.dec(_f$context),
      author: data.dec(_f$author),
      version: data.dec(_f$version),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static ArbFileDto fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ArbFileDto>(map);
  }

  static ArbFileDto fromJson(String json) {
    return ensureInitialized().decodeJson<ArbFileDto>(json);
  }
}

mixin ArbFileDtoMappable {
  String toJson() {
    return ArbFileDtoMapper.ensureInitialized().encodeJson<ArbFileDto>(
      this as ArbFileDto,
    );
  }

  Map<String, dynamic> toMap() {
    return ArbFileDtoMapper.ensureInitialized().encodeMap<ArbFileDto>(
      this as ArbFileDto,
    );
  }

  ArbFileDtoCopyWith<ArbFileDto, ArbFileDto, ArbFileDto> get copyWith =>
      _ArbFileDtoCopyWithImpl<ArbFileDto, ArbFileDto>(
        this as ArbFileDto,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return ArbFileDtoMapper.ensureInitialized().stringifyValue(
      this as ArbFileDto,
    );
  }

  @override
  bool operator ==(Object other) {
    return ArbFileDtoMapper.ensureInitialized().equalsValue(
      this as ArbFileDto,
      other,
    );
  }

  @override
  int get hashCode {
    return ArbFileDtoMapper.ensureInitialized().hashValue(this as ArbFileDto);
  }
}

extension ArbFileDtoValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ArbFileDto, $Out> {
  ArbFileDtoCopyWith<$R, ArbFileDto, $Out> get $asArbFileDto =>
      $base.as((v, t, t2) => _ArbFileDtoCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class ArbFileDtoCopyWith<$R, $In extends ArbFileDto, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  MapCopyWith<$R, String, String, ObjectCopyWith<$R, String, String>>
  get entries;
  MapCopyWith<
    $R,
    String,
    ArbEntryMetadataDto,
    ArbEntryMetadataDtoCopyWith<$R, ArbEntryMetadataDto, ArbEntryMetadataDto>
  >
  get metadata;
  $R call({
    String? filePath,
    String? locale,
    Map<String, String>? entries,
    Map<String, ArbEntryMetadataDto>? metadata,
    String? context,
    String? author,
    String? version,
  });
  ArbFileDtoCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ArbFileDtoCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ArbFileDto, $Out>
    implements ArbFileDtoCopyWith<$R, ArbFileDto, $Out> {
  _ArbFileDtoCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ArbFileDto> $mapper =
      ArbFileDtoMapper.ensureInitialized();
  @override
  MapCopyWith<$R, String, String, ObjectCopyWith<$R, String, String>>
  get entries => MapCopyWith(
    $value.entries,
    (v, t) => ObjectCopyWith(v, $identity, t),
    (v) => call(entries: v),
  );
  @override
  MapCopyWith<
    $R,
    String,
    ArbEntryMetadataDto,
    ArbEntryMetadataDtoCopyWith<$R, ArbEntryMetadataDto, ArbEntryMetadataDto>
  >
  get metadata => MapCopyWith(
    $value.metadata,
    (v, t) => v.copyWith.$chain(t),
    (v) => call(metadata: v),
  );
  @override
  $R call({
    String? filePath,
    String? locale,
    Map<String, String>? entries,
    Map<String, ArbEntryMetadataDto>? metadata,
    Object? context = $none,
    Object? author = $none,
    Object? version = $none,
  }) => $apply(
    FieldCopyWithData({
      if (filePath != null) #filePath: filePath,
      if (locale != null) #locale: locale,
      if (entries != null) #entries: entries,
      if (metadata != null) #metadata: metadata,
      if (context != $none) #context: context,
      if (author != $none) #author: author,
      if (version != $none) #version: version,
    }),
  );
  @override
  ArbFileDto $make(CopyWithData data) => ArbFileDto(
    filePath: data.get(#filePath, or: $value.filePath),
    locale: data.get(#locale, or: $value.locale),
    entries: data.get(#entries, or: $value.entries),
    metadata: data.get(#metadata, or: $value.metadata),
    context: data.get(#context, or: $value.context),
    author: data.get(#author, or: $value.author),
    version: data.get(#version, or: $value.version),
  );

  @override
  ArbFileDtoCopyWith<$R2, ArbFileDto, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _ArbFileDtoCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

