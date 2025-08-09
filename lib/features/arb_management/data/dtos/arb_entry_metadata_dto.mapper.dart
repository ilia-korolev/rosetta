// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'arb_entry_metadata_dto.dart';

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

