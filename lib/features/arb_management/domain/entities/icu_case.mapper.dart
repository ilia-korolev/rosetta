// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'icu_case.dart';

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

