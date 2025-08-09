// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'arb_import_bloc.dart';

class ArbImportEventMapper extends ClassMapperBase<ArbImportEvent> {
  ArbImportEventMapper._();

  static ArbImportEventMapper? _instance;
  static ArbImportEventMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ArbImportEventMapper._());
      ImportSingleFileEventMapper.ensureInitialized();
      ImportMultipleFilesEventMapper.ensureInitialized();
      LoadRecentFilesEventMapper.ensureInitialized();
      ImportFromRecentEventMapper.ensureInitialized();
      ClearImportEventMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'ArbImportEvent';

  @override
  final MappableFields<ArbImportEvent> fields = const {};

  static ArbImportEvent _instantiate(DecodingData data) {
    throw MapperException.missingConstructor('ArbImportEvent');
  }

  @override
  final Function instantiate = _instantiate;

  static ArbImportEvent fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ArbImportEvent>(map);
  }

  static ArbImportEvent fromJson(String json) {
    return ensureInitialized().decodeJson<ArbImportEvent>(json);
  }
}

mixin ArbImportEventMappable {
  String toJson();
  Map<String, dynamic> toMap();
  ArbImportEventCopyWith<ArbImportEvent, ArbImportEvent, ArbImportEvent>
  get copyWith;
}

abstract class ArbImportEventCopyWith<$R, $In extends ArbImportEvent, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call();
  ArbImportEventCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class ImportSingleFileEventMapper
    extends ClassMapperBase<ImportSingleFileEvent> {
  ImportSingleFileEventMapper._();

  static ImportSingleFileEventMapper? _instance;
  static ImportSingleFileEventMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ImportSingleFileEventMapper._());
      ArbImportEventMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'ImportSingleFileEvent';

  static String _$filePath(ImportSingleFileEvent v) => v.filePath;
  static const Field<ImportSingleFileEvent, String> _f$filePath = Field(
    'filePath',
    _$filePath,
  );

  @override
  final MappableFields<ImportSingleFileEvent> fields = const {
    #filePath: _f$filePath,
  };

  static ImportSingleFileEvent _instantiate(DecodingData data) {
    return ImportSingleFileEvent(data.dec(_f$filePath));
  }

  @override
  final Function instantiate = _instantiate;

  static ImportSingleFileEvent fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ImportSingleFileEvent>(map);
  }

  static ImportSingleFileEvent fromJson(String json) {
    return ensureInitialized().decodeJson<ImportSingleFileEvent>(json);
  }
}

mixin ImportSingleFileEventMappable {
  String toJson() {
    return ImportSingleFileEventMapper.ensureInitialized()
        .encodeJson<ImportSingleFileEvent>(this as ImportSingleFileEvent);
  }

  Map<String, dynamic> toMap() {
    return ImportSingleFileEventMapper.ensureInitialized()
        .encodeMap<ImportSingleFileEvent>(this as ImportSingleFileEvent);
  }

  ImportSingleFileEventCopyWith<
    ImportSingleFileEvent,
    ImportSingleFileEvent,
    ImportSingleFileEvent
  >
  get copyWith =>
      _ImportSingleFileEventCopyWithImpl<
        ImportSingleFileEvent,
        ImportSingleFileEvent
      >(this as ImportSingleFileEvent, $identity, $identity);
  @override
  String toString() {
    return ImportSingleFileEventMapper.ensureInitialized().stringifyValue(
      this as ImportSingleFileEvent,
    );
  }

  @override
  bool operator ==(Object other) {
    return ImportSingleFileEventMapper.ensureInitialized().equalsValue(
      this as ImportSingleFileEvent,
      other,
    );
  }

  @override
  int get hashCode {
    return ImportSingleFileEventMapper.ensureInitialized().hashValue(
      this as ImportSingleFileEvent,
    );
  }
}

extension ImportSingleFileEventValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ImportSingleFileEvent, $Out> {
  ImportSingleFileEventCopyWith<$R, ImportSingleFileEvent, $Out>
  get $asImportSingleFileEvent => $base.as(
    (v, t, t2) => _ImportSingleFileEventCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class ImportSingleFileEventCopyWith<
  $R,
  $In extends ImportSingleFileEvent,
  $Out
>
    implements ArbImportEventCopyWith<$R, $In, $Out> {
  @override
  $R call({String? filePath});
  ImportSingleFileEventCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _ImportSingleFileEventCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ImportSingleFileEvent, $Out>
    implements ImportSingleFileEventCopyWith<$R, ImportSingleFileEvent, $Out> {
  _ImportSingleFileEventCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ImportSingleFileEvent> $mapper =
      ImportSingleFileEventMapper.ensureInitialized();
  @override
  $R call({String? filePath}) =>
      $apply(FieldCopyWithData({if (filePath != null) #filePath: filePath}));
  @override
  ImportSingleFileEvent $make(CopyWithData data) =>
      ImportSingleFileEvent(data.get(#filePath, or: $value.filePath));

  @override
  ImportSingleFileEventCopyWith<$R2, ImportSingleFileEvent, $Out2>
  $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _ImportSingleFileEventCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class ImportMultipleFilesEventMapper
    extends ClassMapperBase<ImportMultipleFilesEvent> {
  ImportMultipleFilesEventMapper._();

  static ImportMultipleFilesEventMapper? _instance;
  static ImportMultipleFilesEventMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(
        _instance = ImportMultipleFilesEventMapper._(),
      );
      ArbImportEventMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'ImportMultipleFilesEvent';

  static List<String> _$filePaths(ImportMultipleFilesEvent v) => v.filePaths;
  static const Field<ImportMultipleFilesEvent, List<String>> _f$filePaths =
      Field('filePaths', _$filePaths);

  @override
  final MappableFields<ImportMultipleFilesEvent> fields = const {
    #filePaths: _f$filePaths,
  };

  static ImportMultipleFilesEvent _instantiate(DecodingData data) {
    return ImportMultipleFilesEvent(data.dec(_f$filePaths));
  }

  @override
  final Function instantiate = _instantiate;

  static ImportMultipleFilesEvent fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ImportMultipleFilesEvent>(map);
  }

  static ImportMultipleFilesEvent fromJson(String json) {
    return ensureInitialized().decodeJson<ImportMultipleFilesEvent>(json);
  }
}

mixin ImportMultipleFilesEventMappable {
  String toJson() {
    return ImportMultipleFilesEventMapper.ensureInitialized()
        .encodeJson<ImportMultipleFilesEvent>(this as ImportMultipleFilesEvent);
  }

  Map<String, dynamic> toMap() {
    return ImportMultipleFilesEventMapper.ensureInitialized()
        .encodeMap<ImportMultipleFilesEvent>(this as ImportMultipleFilesEvent);
  }

  ImportMultipleFilesEventCopyWith<
    ImportMultipleFilesEvent,
    ImportMultipleFilesEvent,
    ImportMultipleFilesEvent
  >
  get copyWith =>
      _ImportMultipleFilesEventCopyWithImpl<
        ImportMultipleFilesEvent,
        ImportMultipleFilesEvent
      >(this as ImportMultipleFilesEvent, $identity, $identity);
  @override
  String toString() {
    return ImportMultipleFilesEventMapper.ensureInitialized().stringifyValue(
      this as ImportMultipleFilesEvent,
    );
  }

  @override
  bool operator ==(Object other) {
    return ImportMultipleFilesEventMapper.ensureInitialized().equalsValue(
      this as ImportMultipleFilesEvent,
      other,
    );
  }

  @override
  int get hashCode {
    return ImportMultipleFilesEventMapper.ensureInitialized().hashValue(
      this as ImportMultipleFilesEvent,
    );
  }
}

extension ImportMultipleFilesEventValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ImportMultipleFilesEvent, $Out> {
  ImportMultipleFilesEventCopyWith<$R, ImportMultipleFilesEvent, $Out>
  get $asImportMultipleFilesEvent => $base.as(
    (v, t, t2) => _ImportMultipleFilesEventCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class ImportMultipleFilesEventCopyWith<
  $R,
  $In extends ImportMultipleFilesEvent,
  $Out
>
    implements ArbImportEventCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get filePaths;
  @override
  $R call({List<String>? filePaths});
  ImportMultipleFilesEventCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _ImportMultipleFilesEventCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ImportMultipleFilesEvent, $Out>
    implements
        ImportMultipleFilesEventCopyWith<$R, ImportMultipleFilesEvent, $Out> {
  _ImportMultipleFilesEventCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ImportMultipleFilesEvent> $mapper =
      ImportMultipleFilesEventMapper.ensureInitialized();
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get filePaths =>
      ListCopyWith(
        $value.filePaths,
        (v, t) => ObjectCopyWith(v, $identity, t),
        (v) => call(filePaths: v),
      );
  @override
  $R call({List<String>? filePaths}) =>
      $apply(FieldCopyWithData({if (filePaths != null) #filePaths: filePaths}));
  @override
  ImportMultipleFilesEvent $make(CopyWithData data) =>
      ImportMultipleFilesEvent(data.get(#filePaths, or: $value.filePaths));

  @override
  ImportMultipleFilesEventCopyWith<$R2, ImportMultipleFilesEvent, $Out2>
  $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _ImportMultipleFilesEventCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class LoadRecentFilesEventMapper extends ClassMapperBase<LoadRecentFilesEvent> {
  LoadRecentFilesEventMapper._();

  static LoadRecentFilesEventMapper? _instance;
  static LoadRecentFilesEventMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = LoadRecentFilesEventMapper._());
      ArbImportEventMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'LoadRecentFilesEvent';

  @override
  final MappableFields<LoadRecentFilesEvent> fields = const {};

  static LoadRecentFilesEvent _instantiate(DecodingData data) {
    return LoadRecentFilesEvent();
  }

  @override
  final Function instantiate = _instantiate;

  static LoadRecentFilesEvent fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<LoadRecentFilesEvent>(map);
  }

  static LoadRecentFilesEvent fromJson(String json) {
    return ensureInitialized().decodeJson<LoadRecentFilesEvent>(json);
  }
}

mixin LoadRecentFilesEventMappable {
  String toJson() {
    return LoadRecentFilesEventMapper.ensureInitialized()
        .encodeJson<LoadRecentFilesEvent>(this as LoadRecentFilesEvent);
  }

  Map<String, dynamic> toMap() {
    return LoadRecentFilesEventMapper.ensureInitialized()
        .encodeMap<LoadRecentFilesEvent>(this as LoadRecentFilesEvent);
  }

  LoadRecentFilesEventCopyWith<
    LoadRecentFilesEvent,
    LoadRecentFilesEvent,
    LoadRecentFilesEvent
  >
  get copyWith =>
      _LoadRecentFilesEventCopyWithImpl<
        LoadRecentFilesEvent,
        LoadRecentFilesEvent
      >(this as LoadRecentFilesEvent, $identity, $identity);
  @override
  String toString() {
    return LoadRecentFilesEventMapper.ensureInitialized().stringifyValue(
      this as LoadRecentFilesEvent,
    );
  }

  @override
  bool operator ==(Object other) {
    return LoadRecentFilesEventMapper.ensureInitialized().equalsValue(
      this as LoadRecentFilesEvent,
      other,
    );
  }

  @override
  int get hashCode {
    return LoadRecentFilesEventMapper.ensureInitialized().hashValue(
      this as LoadRecentFilesEvent,
    );
  }
}

extension LoadRecentFilesEventValueCopy<$R, $Out>
    on ObjectCopyWith<$R, LoadRecentFilesEvent, $Out> {
  LoadRecentFilesEventCopyWith<$R, LoadRecentFilesEvent, $Out>
  get $asLoadRecentFilesEvent => $base.as(
    (v, t, t2) => _LoadRecentFilesEventCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class LoadRecentFilesEventCopyWith<
  $R,
  $In extends LoadRecentFilesEvent,
  $Out
>
    implements ArbImportEventCopyWith<$R, $In, $Out> {
  @override
  $R call();
  LoadRecentFilesEventCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _LoadRecentFilesEventCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, LoadRecentFilesEvent, $Out>
    implements LoadRecentFilesEventCopyWith<$R, LoadRecentFilesEvent, $Out> {
  _LoadRecentFilesEventCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<LoadRecentFilesEvent> $mapper =
      LoadRecentFilesEventMapper.ensureInitialized();
  @override
  $R call() => $apply(FieldCopyWithData({}));
  @override
  LoadRecentFilesEvent $make(CopyWithData data) => LoadRecentFilesEvent();

  @override
  LoadRecentFilesEventCopyWith<$R2, LoadRecentFilesEvent, $Out2>
  $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _LoadRecentFilesEventCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class ImportFromRecentEventMapper
    extends ClassMapperBase<ImportFromRecentEvent> {
  ImportFromRecentEventMapper._();

  static ImportFromRecentEventMapper? _instance;
  static ImportFromRecentEventMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ImportFromRecentEventMapper._());
      ArbImportEventMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'ImportFromRecentEvent';

  static String _$filePath(ImportFromRecentEvent v) => v.filePath;
  static const Field<ImportFromRecentEvent, String> _f$filePath = Field(
    'filePath',
    _$filePath,
  );

  @override
  final MappableFields<ImportFromRecentEvent> fields = const {
    #filePath: _f$filePath,
  };

  static ImportFromRecentEvent _instantiate(DecodingData data) {
    return ImportFromRecentEvent(data.dec(_f$filePath));
  }

  @override
  final Function instantiate = _instantiate;

  static ImportFromRecentEvent fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ImportFromRecentEvent>(map);
  }

  static ImportFromRecentEvent fromJson(String json) {
    return ensureInitialized().decodeJson<ImportFromRecentEvent>(json);
  }
}

mixin ImportFromRecentEventMappable {
  String toJson() {
    return ImportFromRecentEventMapper.ensureInitialized()
        .encodeJson<ImportFromRecentEvent>(this as ImportFromRecentEvent);
  }

  Map<String, dynamic> toMap() {
    return ImportFromRecentEventMapper.ensureInitialized()
        .encodeMap<ImportFromRecentEvent>(this as ImportFromRecentEvent);
  }

  ImportFromRecentEventCopyWith<
    ImportFromRecentEvent,
    ImportFromRecentEvent,
    ImportFromRecentEvent
  >
  get copyWith =>
      _ImportFromRecentEventCopyWithImpl<
        ImportFromRecentEvent,
        ImportFromRecentEvent
      >(this as ImportFromRecentEvent, $identity, $identity);
  @override
  String toString() {
    return ImportFromRecentEventMapper.ensureInitialized().stringifyValue(
      this as ImportFromRecentEvent,
    );
  }

  @override
  bool operator ==(Object other) {
    return ImportFromRecentEventMapper.ensureInitialized().equalsValue(
      this as ImportFromRecentEvent,
      other,
    );
  }

  @override
  int get hashCode {
    return ImportFromRecentEventMapper.ensureInitialized().hashValue(
      this as ImportFromRecentEvent,
    );
  }
}

extension ImportFromRecentEventValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ImportFromRecentEvent, $Out> {
  ImportFromRecentEventCopyWith<$R, ImportFromRecentEvent, $Out>
  get $asImportFromRecentEvent => $base.as(
    (v, t, t2) => _ImportFromRecentEventCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class ImportFromRecentEventCopyWith<
  $R,
  $In extends ImportFromRecentEvent,
  $Out
>
    implements ArbImportEventCopyWith<$R, $In, $Out> {
  @override
  $R call({String? filePath});
  ImportFromRecentEventCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _ImportFromRecentEventCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ImportFromRecentEvent, $Out>
    implements ImportFromRecentEventCopyWith<$R, ImportFromRecentEvent, $Out> {
  _ImportFromRecentEventCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ImportFromRecentEvent> $mapper =
      ImportFromRecentEventMapper.ensureInitialized();
  @override
  $R call({String? filePath}) =>
      $apply(FieldCopyWithData({if (filePath != null) #filePath: filePath}));
  @override
  ImportFromRecentEvent $make(CopyWithData data) =>
      ImportFromRecentEvent(data.get(#filePath, or: $value.filePath));

  @override
  ImportFromRecentEventCopyWith<$R2, ImportFromRecentEvent, $Out2>
  $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _ImportFromRecentEventCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class ClearImportEventMapper extends ClassMapperBase<ClearImportEvent> {
  ClearImportEventMapper._();

  static ClearImportEventMapper? _instance;
  static ClearImportEventMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ClearImportEventMapper._());
      ArbImportEventMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'ClearImportEvent';

  @override
  final MappableFields<ClearImportEvent> fields = const {};

  static ClearImportEvent _instantiate(DecodingData data) {
    return ClearImportEvent();
  }

  @override
  final Function instantiate = _instantiate;

  static ClearImportEvent fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ClearImportEvent>(map);
  }

  static ClearImportEvent fromJson(String json) {
    return ensureInitialized().decodeJson<ClearImportEvent>(json);
  }
}

mixin ClearImportEventMappable {
  String toJson() {
    return ClearImportEventMapper.ensureInitialized()
        .encodeJson<ClearImportEvent>(this as ClearImportEvent);
  }

  Map<String, dynamic> toMap() {
    return ClearImportEventMapper.ensureInitialized()
        .encodeMap<ClearImportEvent>(this as ClearImportEvent);
  }

  ClearImportEventCopyWith<ClearImportEvent, ClearImportEvent, ClearImportEvent>
  get copyWith =>
      _ClearImportEventCopyWithImpl<ClearImportEvent, ClearImportEvent>(
        this as ClearImportEvent,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return ClearImportEventMapper.ensureInitialized().stringifyValue(
      this as ClearImportEvent,
    );
  }

  @override
  bool operator ==(Object other) {
    return ClearImportEventMapper.ensureInitialized().equalsValue(
      this as ClearImportEvent,
      other,
    );
  }

  @override
  int get hashCode {
    return ClearImportEventMapper.ensureInitialized().hashValue(
      this as ClearImportEvent,
    );
  }
}

extension ClearImportEventValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ClearImportEvent, $Out> {
  ClearImportEventCopyWith<$R, ClearImportEvent, $Out>
  get $asClearImportEvent =>
      $base.as((v, t, t2) => _ClearImportEventCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class ClearImportEventCopyWith<$R, $In extends ClearImportEvent, $Out>
    implements ArbImportEventCopyWith<$R, $In, $Out> {
  @override
  $R call();
  ClearImportEventCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _ClearImportEventCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ClearImportEvent, $Out>
    implements ClearImportEventCopyWith<$R, ClearImportEvent, $Out> {
  _ClearImportEventCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ClearImportEvent> $mapper =
      ClearImportEventMapper.ensureInitialized();
  @override
  $R call() => $apply(FieldCopyWithData({}));
  @override
  ClearImportEvent $make(CopyWithData data) => ClearImportEvent();

  @override
  ClearImportEventCopyWith<$R2, ClearImportEvent, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _ClearImportEventCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class ArbImportStateMapper extends ClassMapperBase<ArbImportState> {
  ArbImportStateMapper._();

  static ArbImportStateMapper? _instance;
  static ArbImportStateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ArbImportStateMapper._());
      ArbImportInitialStateMapper.ensureInitialized();
      ArbImportLoadingStateMapper.ensureInitialized();
      ArbImportSuccessStateMapper.ensureInitialized();
      ArbImportErrorStateMapper.ensureInitialized();
      RecentFilesLoadedStateMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'ArbImportState';

  @override
  final MappableFields<ArbImportState> fields = const {};

  static ArbImportState _instantiate(DecodingData data) {
    throw MapperException.missingConstructor('ArbImportState');
  }

  @override
  final Function instantiate = _instantiate;

  static ArbImportState fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ArbImportState>(map);
  }

  static ArbImportState fromJson(String json) {
    return ensureInitialized().decodeJson<ArbImportState>(json);
  }
}

mixin ArbImportStateMappable {
  String toJson();
  Map<String, dynamic> toMap();
  ArbImportStateCopyWith<ArbImportState, ArbImportState, ArbImportState>
  get copyWith;
}

abstract class ArbImportStateCopyWith<$R, $In extends ArbImportState, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call();
  ArbImportStateCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class ArbImportInitialStateMapper
    extends ClassMapperBase<ArbImportInitialState> {
  ArbImportInitialStateMapper._();

  static ArbImportInitialStateMapper? _instance;
  static ArbImportInitialStateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ArbImportInitialStateMapper._());
      ArbImportStateMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'ArbImportInitialState';

  @override
  final MappableFields<ArbImportInitialState> fields = const {};

  static ArbImportInitialState _instantiate(DecodingData data) {
    return ArbImportInitialState();
  }

  @override
  final Function instantiate = _instantiate;

  static ArbImportInitialState fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ArbImportInitialState>(map);
  }

  static ArbImportInitialState fromJson(String json) {
    return ensureInitialized().decodeJson<ArbImportInitialState>(json);
  }
}

mixin ArbImportInitialStateMappable {
  String toJson() {
    return ArbImportInitialStateMapper.ensureInitialized()
        .encodeJson<ArbImportInitialState>(this as ArbImportInitialState);
  }

  Map<String, dynamic> toMap() {
    return ArbImportInitialStateMapper.ensureInitialized()
        .encodeMap<ArbImportInitialState>(this as ArbImportInitialState);
  }

  ArbImportInitialStateCopyWith<
    ArbImportInitialState,
    ArbImportInitialState,
    ArbImportInitialState
  >
  get copyWith =>
      _ArbImportInitialStateCopyWithImpl<
        ArbImportInitialState,
        ArbImportInitialState
      >(this as ArbImportInitialState, $identity, $identity);
  @override
  String toString() {
    return ArbImportInitialStateMapper.ensureInitialized().stringifyValue(
      this as ArbImportInitialState,
    );
  }

  @override
  bool operator ==(Object other) {
    return ArbImportInitialStateMapper.ensureInitialized().equalsValue(
      this as ArbImportInitialState,
      other,
    );
  }

  @override
  int get hashCode {
    return ArbImportInitialStateMapper.ensureInitialized().hashValue(
      this as ArbImportInitialState,
    );
  }
}

extension ArbImportInitialStateValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ArbImportInitialState, $Out> {
  ArbImportInitialStateCopyWith<$R, ArbImportInitialState, $Out>
  get $asArbImportInitialState => $base.as(
    (v, t, t2) => _ArbImportInitialStateCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class ArbImportInitialStateCopyWith<
  $R,
  $In extends ArbImportInitialState,
  $Out
>
    implements ArbImportStateCopyWith<$R, $In, $Out> {
  @override
  $R call();
  ArbImportInitialStateCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _ArbImportInitialStateCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ArbImportInitialState, $Out>
    implements ArbImportInitialStateCopyWith<$R, ArbImportInitialState, $Out> {
  _ArbImportInitialStateCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ArbImportInitialState> $mapper =
      ArbImportInitialStateMapper.ensureInitialized();
  @override
  $R call() => $apply(FieldCopyWithData({}));
  @override
  ArbImportInitialState $make(CopyWithData data) => ArbImportInitialState();

  @override
  ArbImportInitialStateCopyWith<$R2, ArbImportInitialState, $Out2>
  $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _ArbImportInitialStateCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class ArbImportLoadingStateMapper
    extends ClassMapperBase<ArbImportLoadingState> {
  ArbImportLoadingStateMapper._();

  static ArbImportLoadingStateMapper? _instance;
  static ArbImportLoadingStateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ArbImportLoadingStateMapper._());
      ArbImportStateMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'ArbImportLoadingState';

  static String _$operation(ArbImportLoadingState v) => v.operation;
  static const Field<ArbImportLoadingState, String> _f$operation = Field(
    'operation',
    _$operation,
  );
  static double? _$progress(ArbImportLoadingState v) => v.progress;
  static const Field<ArbImportLoadingState, double> _f$progress = Field(
    'progress',
    _$progress,
    opt: true,
  );

  @override
  final MappableFields<ArbImportLoadingState> fields = const {
    #operation: _f$operation,
    #progress: _f$progress,
  };

  static ArbImportLoadingState _instantiate(DecodingData data) {
    return ArbImportLoadingState(
      operation: data.dec(_f$operation),
      progress: data.dec(_f$progress),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static ArbImportLoadingState fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ArbImportLoadingState>(map);
  }

  static ArbImportLoadingState fromJson(String json) {
    return ensureInitialized().decodeJson<ArbImportLoadingState>(json);
  }
}

mixin ArbImportLoadingStateMappable {
  String toJson() {
    return ArbImportLoadingStateMapper.ensureInitialized()
        .encodeJson<ArbImportLoadingState>(this as ArbImportLoadingState);
  }

  Map<String, dynamic> toMap() {
    return ArbImportLoadingStateMapper.ensureInitialized()
        .encodeMap<ArbImportLoadingState>(this as ArbImportLoadingState);
  }

  ArbImportLoadingStateCopyWith<
    ArbImportLoadingState,
    ArbImportLoadingState,
    ArbImportLoadingState
  >
  get copyWith =>
      _ArbImportLoadingStateCopyWithImpl<
        ArbImportLoadingState,
        ArbImportLoadingState
      >(this as ArbImportLoadingState, $identity, $identity);
  @override
  String toString() {
    return ArbImportLoadingStateMapper.ensureInitialized().stringifyValue(
      this as ArbImportLoadingState,
    );
  }

  @override
  bool operator ==(Object other) {
    return ArbImportLoadingStateMapper.ensureInitialized().equalsValue(
      this as ArbImportLoadingState,
      other,
    );
  }

  @override
  int get hashCode {
    return ArbImportLoadingStateMapper.ensureInitialized().hashValue(
      this as ArbImportLoadingState,
    );
  }
}

extension ArbImportLoadingStateValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ArbImportLoadingState, $Out> {
  ArbImportLoadingStateCopyWith<$R, ArbImportLoadingState, $Out>
  get $asArbImportLoadingState => $base.as(
    (v, t, t2) => _ArbImportLoadingStateCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class ArbImportLoadingStateCopyWith<
  $R,
  $In extends ArbImportLoadingState,
  $Out
>
    implements ArbImportStateCopyWith<$R, $In, $Out> {
  @override
  $R call({String? operation, double? progress});
  ArbImportLoadingStateCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _ArbImportLoadingStateCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ArbImportLoadingState, $Out>
    implements ArbImportLoadingStateCopyWith<$R, ArbImportLoadingState, $Out> {
  _ArbImportLoadingStateCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ArbImportLoadingState> $mapper =
      ArbImportLoadingStateMapper.ensureInitialized();
  @override
  $R call({String? operation, Object? progress = $none}) => $apply(
    FieldCopyWithData({
      if (operation != null) #operation: operation,
      if (progress != $none) #progress: progress,
    }),
  );
  @override
  ArbImportLoadingState $make(CopyWithData data) => ArbImportLoadingState(
    operation: data.get(#operation, or: $value.operation),
    progress: data.get(#progress, or: $value.progress),
  );

  @override
  ArbImportLoadingStateCopyWith<$R2, ArbImportLoadingState, $Out2>
  $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _ArbImportLoadingStateCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class ArbImportSuccessStateMapper
    extends ClassMapperBase<ArbImportSuccessState> {
  ArbImportSuccessStateMapper._();

  static ArbImportSuccessStateMapper? _instance;
  static ArbImportSuccessStateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ArbImportSuccessStateMapper._());
      ArbImportStateMapper.ensureInitialized();
      ArbFileMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'ArbImportSuccessState';

  static Map<String, ArbFile> _$files(ArbImportSuccessState v) => v.files;
  static const Field<ArbImportSuccessState, Map<String, ArbFile>> _f$files =
      Field('files', _$files);
  static Map<String, ValidationResult> _$validationResults(
    ArbImportSuccessState v,
  ) => v.validationResults;
  static const Field<ArbImportSuccessState, Map<String, ValidationResult>>
  _f$validationResults = Field('validationResults', _$validationResults);
  static List<String>? _$recentFiles(ArbImportSuccessState v) => v.recentFiles;
  static const Field<ArbImportSuccessState, List<String>> _f$recentFiles =
      Field('recentFiles', _$recentFiles, opt: true);
  static bool _$hasValidationIssues(ArbImportSuccessState v) =>
      v.hasValidationIssues;
  static const Field<ArbImportSuccessState, bool> _f$hasValidationIssues =
      Field(
        'hasValidationIssues',
        _$hasValidationIssues,
        mode: FieldMode.member,
      );
  static bool _$hasCriticalIssues(ArbImportSuccessState v) =>
      v.hasCriticalIssues;
  static const Field<ArbImportSuccessState, bool> _f$hasCriticalIssues = Field(
    'hasCriticalIssues',
    _$hasCriticalIssues,
    mode: FieldMode.member,
  );
  static Map<String, ValidationResult> _$filesWithIssues(
    ArbImportSuccessState v,
  ) => v.filesWithIssues;
  static const Field<ArbImportSuccessState, Map<String, ValidationResult>>
  _f$filesWithIssues = Field(
    'filesWithIssues',
    _$filesWithIssues,
    mode: FieldMode.member,
  );

  @override
  final MappableFields<ArbImportSuccessState> fields = const {
    #files: _f$files,
    #validationResults: _f$validationResults,
    #recentFiles: _f$recentFiles,
    #hasValidationIssues: _f$hasValidationIssues,
    #hasCriticalIssues: _f$hasCriticalIssues,
    #filesWithIssues: _f$filesWithIssues,
  };

  static ArbImportSuccessState _instantiate(DecodingData data) {
    return ArbImportSuccessState(
      files: data.dec(_f$files),
      validationResults: data.dec(_f$validationResults),
      recentFiles: data.dec(_f$recentFiles),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static ArbImportSuccessState fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ArbImportSuccessState>(map);
  }

  static ArbImportSuccessState fromJson(String json) {
    return ensureInitialized().decodeJson<ArbImportSuccessState>(json);
  }
}

mixin ArbImportSuccessStateMappable {
  String toJson() {
    return ArbImportSuccessStateMapper.ensureInitialized()
        .encodeJson<ArbImportSuccessState>(this as ArbImportSuccessState);
  }

  Map<String, dynamic> toMap() {
    return ArbImportSuccessStateMapper.ensureInitialized()
        .encodeMap<ArbImportSuccessState>(this as ArbImportSuccessState);
  }

  ArbImportSuccessStateCopyWith<
    ArbImportSuccessState,
    ArbImportSuccessState,
    ArbImportSuccessState
  >
  get copyWith =>
      _ArbImportSuccessStateCopyWithImpl<
        ArbImportSuccessState,
        ArbImportSuccessState
      >(this as ArbImportSuccessState, $identity, $identity);
  @override
  String toString() {
    return ArbImportSuccessStateMapper.ensureInitialized().stringifyValue(
      this as ArbImportSuccessState,
    );
  }

  @override
  bool operator ==(Object other) {
    return ArbImportSuccessStateMapper.ensureInitialized().equalsValue(
      this as ArbImportSuccessState,
      other,
    );
  }

  @override
  int get hashCode {
    return ArbImportSuccessStateMapper.ensureInitialized().hashValue(
      this as ArbImportSuccessState,
    );
  }
}

extension ArbImportSuccessStateValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ArbImportSuccessState, $Out> {
  ArbImportSuccessStateCopyWith<$R, ArbImportSuccessState, $Out>
  get $asArbImportSuccessState => $base.as(
    (v, t, t2) => _ArbImportSuccessStateCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class ArbImportSuccessStateCopyWith<
  $R,
  $In extends ArbImportSuccessState,
  $Out
>
    implements ArbImportStateCopyWith<$R, $In, $Out> {
  MapCopyWith<$R, String, ArbFile, ArbFileCopyWith<$R, ArbFile, ArbFile>>
  get files;
  MapCopyWith<
    $R,
    String,
    ValidationResult,
    ObjectCopyWith<$R, ValidationResult, ValidationResult>
  >
  get validationResults;
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>? get recentFiles;
  @override
  $R call({
    Map<String, ArbFile>? files,
    Map<String, ValidationResult>? validationResults,
    List<String>? recentFiles,
  });
  ArbImportSuccessStateCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _ArbImportSuccessStateCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ArbImportSuccessState, $Out>
    implements ArbImportSuccessStateCopyWith<$R, ArbImportSuccessState, $Out> {
  _ArbImportSuccessStateCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ArbImportSuccessState> $mapper =
      ArbImportSuccessStateMapper.ensureInitialized();
  @override
  MapCopyWith<$R, String, ArbFile, ArbFileCopyWith<$R, ArbFile, ArbFile>>
  get files => MapCopyWith(
    $value.files,
    (v, t) => v.copyWith.$chain(t),
    (v) => call(files: v),
  );
  @override
  MapCopyWith<
    $R,
    String,
    ValidationResult,
    ObjectCopyWith<$R, ValidationResult, ValidationResult>
  >
  get validationResults => MapCopyWith(
    $value.validationResults,
    (v, t) => ObjectCopyWith(v, $identity, t),
    (v) => call(validationResults: v),
  );
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>?
  get recentFiles => $value.recentFiles != null
      ? ListCopyWith(
          $value.recentFiles!,
          (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(recentFiles: v),
        )
      : null;
  @override
  $R call({
    Map<String, ArbFile>? files,
    Map<String, ValidationResult>? validationResults,
    Object? recentFiles = $none,
  }) => $apply(
    FieldCopyWithData({
      if (files != null) #files: files,
      if (validationResults != null) #validationResults: validationResults,
      if (recentFiles != $none) #recentFiles: recentFiles,
    }),
  );
  @override
  ArbImportSuccessState $make(CopyWithData data) => ArbImportSuccessState(
    files: data.get(#files, or: $value.files),
    validationResults: data.get(
      #validationResults,
      or: $value.validationResults,
    ),
    recentFiles: data.get(#recentFiles, or: $value.recentFiles),
  );

  @override
  ArbImportSuccessStateCopyWith<$R2, ArbImportSuccessState, $Out2>
  $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _ArbImportSuccessStateCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class ArbImportErrorStateMapper extends ClassMapperBase<ArbImportErrorState> {
  ArbImportErrorStateMapper._();

  static ArbImportErrorStateMapper? _instance;
  static ArbImportErrorStateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ArbImportErrorStateMapper._());
      ArbImportStateMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'ArbImportErrorState';

  static String _$message(ArbImportErrorState v) => v.message;
  static const Field<ArbImportErrorState, String> _f$message = Field(
    'message',
    _$message,
  );
  static String? _$filePath(ArbImportErrorState v) => v.filePath;
  static const Field<ArbImportErrorState, String> _f$filePath = Field(
    'filePath',
    _$filePath,
    opt: true,
  );
  static List<String>? _$recentFiles(ArbImportErrorState v) => v.recentFiles;
  static const Field<ArbImportErrorState, List<String>> _f$recentFiles = Field(
    'recentFiles',
    _$recentFiles,
    opt: true,
  );

  @override
  final MappableFields<ArbImportErrorState> fields = const {
    #message: _f$message,
    #filePath: _f$filePath,
    #recentFiles: _f$recentFiles,
  };

  static ArbImportErrorState _instantiate(DecodingData data) {
    return ArbImportErrorState(
      message: data.dec(_f$message),
      filePath: data.dec(_f$filePath),
      recentFiles: data.dec(_f$recentFiles),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static ArbImportErrorState fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ArbImportErrorState>(map);
  }

  static ArbImportErrorState fromJson(String json) {
    return ensureInitialized().decodeJson<ArbImportErrorState>(json);
  }
}

mixin ArbImportErrorStateMappable {
  String toJson() {
    return ArbImportErrorStateMapper.ensureInitialized()
        .encodeJson<ArbImportErrorState>(this as ArbImportErrorState);
  }

  Map<String, dynamic> toMap() {
    return ArbImportErrorStateMapper.ensureInitialized()
        .encodeMap<ArbImportErrorState>(this as ArbImportErrorState);
  }

  ArbImportErrorStateCopyWith<
    ArbImportErrorState,
    ArbImportErrorState,
    ArbImportErrorState
  >
  get copyWith =>
      _ArbImportErrorStateCopyWithImpl<
        ArbImportErrorState,
        ArbImportErrorState
      >(this as ArbImportErrorState, $identity, $identity);
  @override
  String toString() {
    return ArbImportErrorStateMapper.ensureInitialized().stringifyValue(
      this as ArbImportErrorState,
    );
  }

  @override
  bool operator ==(Object other) {
    return ArbImportErrorStateMapper.ensureInitialized().equalsValue(
      this as ArbImportErrorState,
      other,
    );
  }

  @override
  int get hashCode {
    return ArbImportErrorStateMapper.ensureInitialized().hashValue(
      this as ArbImportErrorState,
    );
  }
}

extension ArbImportErrorStateValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ArbImportErrorState, $Out> {
  ArbImportErrorStateCopyWith<$R, ArbImportErrorState, $Out>
  get $asArbImportErrorState => $base.as(
    (v, t, t2) => _ArbImportErrorStateCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class ArbImportErrorStateCopyWith<
  $R,
  $In extends ArbImportErrorState,
  $Out
>
    implements ArbImportStateCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>? get recentFiles;
  @override
  $R call({String? message, String? filePath, List<String>? recentFiles});
  ArbImportErrorStateCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _ArbImportErrorStateCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ArbImportErrorState, $Out>
    implements ArbImportErrorStateCopyWith<$R, ArbImportErrorState, $Out> {
  _ArbImportErrorStateCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ArbImportErrorState> $mapper =
      ArbImportErrorStateMapper.ensureInitialized();
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>?
  get recentFiles => $value.recentFiles != null
      ? ListCopyWith(
          $value.recentFiles!,
          (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(recentFiles: v),
        )
      : null;
  @override
  $R call({
    String? message,
    Object? filePath = $none,
    Object? recentFiles = $none,
  }) => $apply(
    FieldCopyWithData({
      if (message != null) #message: message,
      if (filePath != $none) #filePath: filePath,
      if (recentFiles != $none) #recentFiles: recentFiles,
    }),
  );
  @override
  ArbImportErrorState $make(CopyWithData data) => ArbImportErrorState(
    message: data.get(#message, or: $value.message),
    filePath: data.get(#filePath, or: $value.filePath),
    recentFiles: data.get(#recentFiles, or: $value.recentFiles),
  );

  @override
  ArbImportErrorStateCopyWith<$R2, ArbImportErrorState, $Out2>
  $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _ArbImportErrorStateCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class RecentFilesLoadedStateMapper
    extends ClassMapperBase<RecentFilesLoadedState> {
  RecentFilesLoadedStateMapper._();

  static RecentFilesLoadedStateMapper? _instance;
  static RecentFilesLoadedStateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = RecentFilesLoadedStateMapper._());
      ArbImportStateMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'RecentFilesLoadedState';

  static List<String> _$recentFiles(RecentFilesLoadedState v) => v.recentFiles;
  static const Field<RecentFilesLoadedState, List<String>> _f$recentFiles =
      Field('recentFiles', _$recentFiles);

  @override
  final MappableFields<RecentFilesLoadedState> fields = const {
    #recentFiles: _f$recentFiles,
  };

  static RecentFilesLoadedState _instantiate(DecodingData data) {
    return RecentFilesLoadedState(data.dec(_f$recentFiles));
  }

  @override
  final Function instantiate = _instantiate;

  static RecentFilesLoadedState fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<RecentFilesLoadedState>(map);
  }

  static RecentFilesLoadedState fromJson(String json) {
    return ensureInitialized().decodeJson<RecentFilesLoadedState>(json);
  }
}

mixin RecentFilesLoadedStateMappable {
  String toJson() {
    return RecentFilesLoadedStateMapper.ensureInitialized()
        .encodeJson<RecentFilesLoadedState>(this as RecentFilesLoadedState);
  }

  Map<String, dynamic> toMap() {
    return RecentFilesLoadedStateMapper.ensureInitialized()
        .encodeMap<RecentFilesLoadedState>(this as RecentFilesLoadedState);
  }

  RecentFilesLoadedStateCopyWith<
    RecentFilesLoadedState,
    RecentFilesLoadedState,
    RecentFilesLoadedState
  >
  get copyWith =>
      _RecentFilesLoadedStateCopyWithImpl<
        RecentFilesLoadedState,
        RecentFilesLoadedState
      >(this as RecentFilesLoadedState, $identity, $identity);
  @override
  String toString() {
    return RecentFilesLoadedStateMapper.ensureInitialized().stringifyValue(
      this as RecentFilesLoadedState,
    );
  }

  @override
  bool operator ==(Object other) {
    return RecentFilesLoadedStateMapper.ensureInitialized().equalsValue(
      this as RecentFilesLoadedState,
      other,
    );
  }

  @override
  int get hashCode {
    return RecentFilesLoadedStateMapper.ensureInitialized().hashValue(
      this as RecentFilesLoadedState,
    );
  }
}

extension RecentFilesLoadedStateValueCopy<$R, $Out>
    on ObjectCopyWith<$R, RecentFilesLoadedState, $Out> {
  RecentFilesLoadedStateCopyWith<$R, RecentFilesLoadedState, $Out>
  get $asRecentFilesLoadedState => $base.as(
    (v, t, t2) => _RecentFilesLoadedStateCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class RecentFilesLoadedStateCopyWith<
  $R,
  $In extends RecentFilesLoadedState,
  $Out
>
    implements ArbImportStateCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get recentFiles;
  @override
  $R call({List<String>? recentFiles});
  RecentFilesLoadedStateCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _RecentFilesLoadedStateCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, RecentFilesLoadedState, $Out>
    implements
        RecentFilesLoadedStateCopyWith<$R, RecentFilesLoadedState, $Out> {
  _RecentFilesLoadedStateCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<RecentFilesLoadedState> $mapper =
      RecentFilesLoadedStateMapper.ensureInitialized();
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>
  get recentFiles => ListCopyWith(
    $value.recentFiles,
    (v, t) => ObjectCopyWith(v, $identity, t),
    (v) => call(recentFiles: v),
  );
  @override
  $R call({List<String>? recentFiles}) => $apply(
    FieldCopyWithData({if (recentFiles != null) #recentFiles: recentFiles}),
  );
  @override
  RecentFilesLoadedState $make(CopyWithData data) =>
      RecentFilesLoadedState(data.get(#recentFiles, or: $value.recentFiles));

  @override
  RecentFilesLoadedStateCopyWith<$R2, RecentFilesLoadedState, $Out2>
  $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _RecentFilesLoadedStateCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

