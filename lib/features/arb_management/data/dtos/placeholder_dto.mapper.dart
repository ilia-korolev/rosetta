// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'placeholder_dto.dart';

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

