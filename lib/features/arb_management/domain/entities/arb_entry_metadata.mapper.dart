// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'arb_entry_metadata.dart';

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

