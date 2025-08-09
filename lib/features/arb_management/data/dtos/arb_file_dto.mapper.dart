// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'arb_file_dto.dart';

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

