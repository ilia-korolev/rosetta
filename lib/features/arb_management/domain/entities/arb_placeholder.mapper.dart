// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'arb_placeholder.dart';

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

