// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'translation_editor_bloc.dart';

class TranslationEditorEventMapper
    extends ClassMapperBase<TranslationEditorEvent> {
  TranslationEditorEventMapper._();

  static TranslationEditorEventMapper? _instance;
  static TranslationEditorEventMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = TranslationEditorEventMapper._());
      InitializeSessionEventMapper.ensureInitialized();
      LoadSessionEventMapper.ensureInitialized();
      SelectEntryEventMapper.ensureInitialized();
      UpdateEntryValueEventMapper.ensureInitialized();
      UpdateEntryEventMapper.ensureInitialized();
      AddEntryEventMapper.ensureInitialized();
      DeleteEntryEventMapper.ensureInitialized();
      UndoEventMapper.ensureInitialized();
      RedoEventMapper.ensureInitialized();
      SaveSessionEventMapper.ensureInitialized();
      AutoSaveEventMapper.ensureInitialized();
      ValidateEntryEventMapper.ensureInitialized();
      FilterEntriesEventMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'TranslationEditorEvent';

  @override
  final MappableFields<TranslationEditorEvent> fields = const {};

  static TranslationEditorEvent _instantiate(DecodingData data) {
    throw MapperException.missingConstructor('TranslationEditorEvent');
  }

  @override
  final Function instantiate = _instantiate;

  static TranslationEditorEvent fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<TranslationEditorEvent>(map);
  }

  static TranslationEditorEvent fromJson(String json) {
    return ensureInitialized().decodeJson<TranslationEditorEvent>(json);
  }
}

mixin TranslationEditorEventMappable {
  String toJson();
  Map<String, dynamic> toMap();
  TranslationEditorEventCopyWith<
    TranslationEditorEvent,
    TranslationEditorEvent,
    TranslationEditorEvent
  >
  get copyWith;
}

abstract class TranslationEditorEventCopyWith<
  $R,
  $In extends TranslationEditorEvent,
  $Out
>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call();
  TranslationEditorEventCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class InitializeSessionEventMapper
    extends ClassMapperBase<InitializeSessionEvent> {
  InitializeSessionEventMapper._();

  static InitializeSessionEventMapper? _instance;
  static InitializeSessionEventMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = InitializeSessionEventMapper._());
      TranslationEditorEventMapper.ensureInitialized();
      ArbFileMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'InitializeSessionEvent';

  static Map<String, ArbFile> _$files(InitializeSessionEvent v) => v.files;
  static const Field<InitializeSessionEvent, Map<String, ArbFile>> _f$files =
      Field('files', _$files);

  @override
  final MappableFields<InitializeSessionEvent> fields = const {
    #files: _f$files,
  };

  static InitializeSessionEvent _instantiate(DecodingData data) {
    return InitializeSessionEvent(data.dec(_f$files));
  }

  @override
  final Function instantiate = _instantiate;

  static InitializeSessionEvent fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<InitializeSessionEvent>(map);
  }

  static InitializeSessionEvent fromJson(String json) {
    return ensureInitialized().decodeJson<InitializeSessionEvent>(json);
  }
}

mixin InitializeSessionEventMappable {
  String toJson() {
    return InitializeSessionEventMapper.ensureInitialized()
        .encodeJson<InitializeSessionEvent>(this as InitializeSessionEvent);
  }

  Map<String, dynamic> toMap() {
    return InitializeSessionEventMapper.ensureInitialized()
        .encodeMap<InitializeSessionEvent>(this as InitializeSessionEvent);
  }

  InitializeSessionEventCopyWith<
    InitializeSessionEvent,
    InitializeSessionEvent,
    InitializeSessionEvent
  >
  get copyWith =>
      _InitializeSessionEventCopyWithImpl<
        InitializeSessionEvent,
        InitializeSessionEvent
      >(this as InitializeSessionEvent, $identity, $identity);
  @override
  String toString() {
    return InitializeSessionEventMapper.ensureInitialized().stringifyValue(
      this as InitializeSessionEvent,
    );
  }

  @override
  bool operator ==(Object other) {
    return InitializeSessionEventMapper.ensureInitialized().equalsValue(
      this as InitializeSessionEvent,
      other,
    );
  }

  @override
  int get hashCode {
    return InitializeSessionEventMapper.ensureInitialized().hashValue(
      this as InitializeSessionEvent,
    );
  }
}

extension InitializeSessionEventValueCopy<$R, $Out>
    on ObjectCopyWith<$R, InitializeSessionEvent, $Out> {
  InitializeSessionEventCopyWith<$R, InitializeSessionEvent, $Out>
  get $asInitializeSessionEvent => $base.as(
    (v, t, t2) => _InitializeSessionEventCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class InitializeSessionEventCopyWith<
  $R,
  $In extends InitializeSessionEvent,
  $Out
>
    implements TranslationEditorEventCopyWith<$R, $In, $Out> {
  MapCopyWith<$R, String, ArbFile, ArbFileCopyWith<$R, ArbFile, ArbFile>>
  get files;
  @override
  $R call({Map<String, ArbFile>? files});
  InitializeSessionEventCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _InitializeSessionEventCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, InitializeSessionEvent, $Out>
    implements
        InitializeSessionEventCopyWith<$R, InitializeSessionEvent, $Out> {
  _InitializeSessionEventCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<InitializeSessionEvent> $mapper =
      InitializeSessionEventMapper.ensureInitialized();
  @override
  MapCopyWith<$R, String, ArbFile, ArbFileCopyWith<$R, ArbFile, ArbFile>>
  get files => MapCopyWith(
    $value.files,
    (v, t) => v.copyWith.$chain(t),
    (v) => call(files: v),
  );
  @override
  $R call({Map<String, ArbFile>? files}) =>
      $apply(FieldCopyWithData({if (files != null) #files: files}));
  @override
  InitializeSessionEvent $make(CopyWithData data) =>
      InitializeSessionEvent(data.get(#files, or: $value.files));

  @override
  InitializeSessionEventCopyWith<$R2, InitializeSessionEvent, $Out2>
  $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _InitializeSessionEventCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class LoadSessionEventMapper extends ClassMapperBase<LoadSessionEvent> {
  LoadSessionEventMapper._();

  static LoadSessionEventMapper? _instance;
  static LoadSessionEventMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = LoadSessionEventMapper._());
      TranslationEditorEventMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'LoadSessionEvent';

  static String _$sessionId(LoadSessionEvent v) => v.sessionId;
  static const Field<LoadSessionEvent, String> _f$sessionId = Field(
    'sessionId',
    _$sessionId,
  );

  @override
  final MappableFields<LoadSessionEvent> fields = const {
    #sessionId: _f$sessionId,
  };

  static LoadSessionEvent _instantiate(DecodingData data) {
    return LoadSessionEvent(data.dec(_f$sessionId));
  }

  @override
  final Function instantiate = _instantiate;

  static LoadSessionEvent fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<LoadSessionEvent>(map);
  }

  static LoadSessionEvent fromJson(String json) {
    return ensureInitialized().decodeJson<LoadSessionEvent>(json);
  }
}

mixin LoadSessionEventMappable {
  String toJson() {
    return LoadSessionEventMapper.ensureInitialized()
        .encodeJson<LoadSessionEvent>(this as LoadSessionEvent);
  }

  Map<String, dynamic> toMap() {
    return LoadSessionEventMapper.ensureInitialized()
        .encodeMap<LoadSessionEvent>(this as LoadSessionEvent);
  }

  LoadSessionEventCopyWith<LoadSessionEvent, LoadSessionEvent, LoadSessionEvent>
  get copyWith =>
      _LoadSessionEventCopyWithImpl<LoadSessionEvent, LoadSessionEvent>(
        this as LoadSessionEvent,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return LoadSessionEventMapper.ensureInitialized().stringifyValue(
      this as LoadSessionEvent,
    );
  }

  @override
  bool operator ==(Object other) {
    return LoadSessionEventMapper.ensureInitialized().equalsValue(
      this as LoadSessionEvent,
      other,
    );
  }

  @override
  int get hashCode {
    return LoadSessionEventMapper.ensureInitialized().hashValue(
      this as LoadSessionEvent,
    );
  }
}

extension LoadSessionEventValueCopy<$R, $Out>
    on ObjectCopyWith<$R, LoadSessionEvent, $Out> {
  LoadSessionEventCopyWith<$R, LoadSessionEvent, $Out>
  get $asLoadSessionEvent =>
      $base.as((v, t, t2) => _LoadSessionEventCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class LoadSessionEventCopyWith<$R, $In extends LoadSessionEvent, $Out>
    implements TranslationEditorEventCopyWith<$R, $In, $Out> {
  @override
  $R call({String? sessionId});
  LoadSessionEventCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _LoadSessionEventCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, LoadSessionEvent, $Out>
    implements LoadSessionEventCopyWith<$R, LoadSessionEvent, $Out> {
  _LoadSessionEventCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<LoadSessionEvent> $mapper =
      LoadSessionEventMapper.ensureInitialized();
  @override
  $R call({String? sessionId}) =>
      $apply(FieldCopyWithData({if (sessionId != null) #sessionId: sessionId}));
  @override
  LoadSessionEvent $make(CopyWithData data) =>
      LoadSessionEvent(data.get(#sessionId, or: $value.sessionId));

  @override
  LoadSessionEventCopyWith<$R2, LoadSessionEvent, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _LoadSessionEventCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class SelectEntryEventMapper extends ClassMapperBase<SelectEntryEvent> {
  SelectEntryEventMapper._();

  static SelectEntryEventMapper? _instance;
  static SelectEntryEventMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = SelectEntryEventMapper._());
      TranslationEditorEventMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'SelectEntryEvent';

  static String _$fileLocale(SelectEntryEvent v) => v.fileLocale;
  static const Field<SelectEntryEvent, String> _f$fileLocale = Field(
    'fileLocale',
    _$fileLocale,
  );
  static String _$entryKey(SelectEntryEvent v) => v.entryKey;
  static const Field<SelectEntryEvent, String> _f$entryKey = Field(
    'entryKey',
    _$entryKey,
  );

  @override
  final MappableFields<SelectEntryEvent> fields = const {
    #fileLocale: _f$fileLocale,
    #entryKey: _f$entryKey,
  };

  static SelectEntryEvent _instantiate(DecodingData data) {
    return SelectEntryEvent(
      fileLocale: data.dec(_f$fileLocale),
      entryKey: data.dec(_f$entryKey),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static SelectEntryEvent fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<SelectEntryEvent>(map);
  }

  static SelectEntryEvent fromJson(String json) {
    return ensureInitialized().decodeJson<SelectEntryEvent>(json);
  }
}

mixin SelectEntryEventMappable {
  String toJson() {
    return SelectEntryEventMapper.ensureInitialized()
        .encodeJson<SelectEntryEvent>(this as SelectEntryEvent);
  }

  Map<String, dynamic> toMap() {
    return SelectEntryEventMapper.ensureInitialized()
        .encodeMap<SelectEntryEvent>(this as SelectEntryEvent);
  }

  SelectEntryEventCopyWith<SelectEntryEvent, SelectEntryEvent, SelectEntryEvent>
  get copyWith =>
      _SelectEntryEventCopyWithImpl<SelectEntryEvent, SelectEntryEvent>(
        this as SelectEntryEvent,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return SelectEntryEventMapper.ensureInitialized().stringifyValue(
      this as SelectEntryEvent,
    );
  }

  @override
  bool operator ==(Object other) {
    return SelectEntryEventMapper.ensureInitialized().equalsValue(
      this as SelectEntryEvent,
      other,
    );
  }

  @override
  int get hashCode {
    return SelectEntryEventMapper.ensureInitialized().hashValue(
      this as SelectEntryEvent,
    );
  }
}

extension SelectEntryEventValueCopy<$R, $Out>
    on ObjectCopyWith<$R, SelectEntryEvent, $Out> {
  SelectEntryEventCopyWith<$R, SelectEntryEvent, $Out>
  get $asSelectEntryEvent =>
      $base.as((v, t, t2) => _SelectEntryEventCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class SelectEntryEventCopyWith<$R, $In extends SelectEntryEvent, $Out>
    implements TranslationEditorEventCopyWith<$R, $In, $Out> {
  @override
  $R call({String? fileLocale, String? entryKey});
  SelectEntryEventCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _SelectEntryEventCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, SelectEntryEvent, $Out>
    implements SelectEntryEventCopyWith<$R, SelectEntryEvent, $Out> {
  _SelectEntryEventCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<SelectEntryEvent> $mapper =
      SelectEntryEventMapper.ensureInitialized();
  @override
  $R call({String? fileLocale, String? entryKey}) => $apply(
    FieldCopyWithData({
      if (fileLocale != null) #fileLocale: fileLocale,
      if (entryKey != null) #entryKey: entryKey,
    }),
  );
  @override
  SelectEntryEvent $make(CopyWithData data) => SelectEntryEvent(
    fileLocale: data.get(#fileLocale, or: $value.fileLocale),
    entryKey: data.get(#entryKey, or: $value.entryKey),
  );

  @override
  SelectEntryEventCopyWith<$R2, SelectEntryEvent, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _SelectEntryEventCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class UpdateEntryValueEventMapper
    extends ClassMapperBase<UpdateEntryValueEvent> {
  UpdateEntryValueEventMapper._();

  static UpdateEntryValueEventMapper? _instance;
  static UpdateEntryValueEventMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = UpdateEntryValueEventMapper._());
      TranslationEditorEventMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'UpdateEntryValueEvent';

  static String _$fileLocale(UpdateEntryValueEvent v) => v.fileLocale;
  static const Field<UpdateEntryValueEvent, String> _f$fileLocale = Field(
    'fileLocale',
    _$fileLocale,
  );
  static String _$entryKey(UpdateEntryValueEvent v) => v.entryKey;
  static const Field<UpdateEntryValueEvent, String> _f$entryKey = Field(
    'entryKey',
    _$entryKey,
  );
  static String _$newValue(UpdateEntryValueEvent v) => v.newValue;
  static const Field<UpdateEntryValueEvent, String> _f$newValue = Field(
    'newValue',
    _$newValue,
  );

  @override
  final MappableFields<UpdateEntryValueEvent> fields = const {
    #fileLocale: _f$fileLocale,
    #entryKey: _f$entryKey,
    #newValue: _f$newValue,
  };

  static UpdateEntryValueEvent _instantiate(DecodingData data) {
    return UpdateEntryValueEvent(
      fileLocale: data.dec(_f$fileLocale),
      entryKey: data.dec(_f$entryKey),
      newValue: data.dec(_f$newValue),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static UpdateEntryValueEvent fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<UpdateEntryValueEvent>(map);
  }

  static UpdateEntryValueEvent fromJson(String json) {
    return ensureInitialized().decodeJson<UpdateEntryValueEvent>(json);
  }
}

mixin UpdateEntryValueEventMappable {
  String toJson() {
    return UpdateEntryValueEventMapper.ensureInitialized()
        .encodeJson<UpdateEntryValueEvent>(this as UpdateEntryValueEvent);
  }

  Map<String, dynamic> toMap() {
    return UpdateEntryValueEventMapper.ensureInitialized()
        .encodeMap<UpdateEntryValueEvent>(this as UpdateEntryValueEvent);
  }

  UpdateEntryValueEventCopyWith<
    UpdateEntryValueEvent,
    UpdateEntryValueEvent,
    UpdateEntryValueEvent
  >
  get copyWith =>
      _UpdateEntryValueEventCopyWithImpl<
        UpdateEntryValueEvent,
        UpdateEntryValueEvent
      >(this as UpdateEntryValueEvent, $identity, $identity);
  @override
  String toString() {
    return UpdateEntryValueEventMapper.ensureInitialized().stringifyValue(
      this as UpdateEntryValueEvent,
    );
  }

  @override
  bool operator ==(Object other) {
    return UpdateEntryValueEventMapper.ensureInitialized().equalsValue(
      this as UpdateEntryValueEvent,
      other,
    );
  }

  @override
  int get hashCode {
    return UpdateEntryValueEventMapper.ensureInitialized().hashValue(
      this as UpdateEntryValueEvent,
    );
  }
}

extension UpdateEntryValueEventValueCopy<$R, $Out>
    on ObjectCopyWith<$R, UpdateEntryValueEvent, $Out> {
  UpdateEntryValueEventCopyWith<$R, UpdateEntryValueEvent, $Out>
  get $asUpdateEntryValueEvent => $base.as(
    (v, t, t2) => _UpdateEntryValueEventCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class UpdateEntryValueEventCopyWith<
  $R,
  $In extends UpdateEntryValueEvent,
  $Out
>
    implements TranslationEditorEventCopyWith<$R, $In, $Out> {
  @override
  $R call({String? fileLocale, String? entryKey, String? newValue});
  UpdateEntryValueEventCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _UpdateEntryValueEventCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, UpdateEntryValueEvent, $Out>
    implements UpdateEntryValueEventCopyWith<$R, UpdateEntryValueEvent, $Out> {
  _UpdateEntryValueEventCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<UpdateEntryValueEvent> $mapper =
      UpdateEntryValueEventMapper.ensureInitialized();
  @override
  $R call({String? fileLocale, String? entryKey, String? newValue}) => $apply(
    FieldCopyWithData({
      if (fileLocale != null) #fileLocale: fileLocale,
      if (entryKey != null) #entryKey: entryKey,
      if (newValue != null) #newValue: newValue,
    }),
  );
  @override
  UpdateEntryValueEvent $make(CopyWithData data) => UpdateEntryValueEvent(
    fileLocale: data.get(#fileLocale, or: $value.fileLocale),
    entryKey: data.get(#entryKey, or: $value.entryKey),
    newValue: data.get(#newValue, or: $value.newValue),
  );

  @override
  UpdateEntryValueEventCopyWith<$R2, UpdateEntryValueEvent, $Out2>
  $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _UpdateEntryValueEventCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class UpdateEntryEventMapper extends ClassMapperBase<UpdateEntryEvent> {
  UpdateEntryEventMapper._();

  static UpdateEntryEventMapper? _instance;
  static UpdateEntryEventMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = UpdateEntryEventMapper._());
      TranslationEditorEventMapper.ensureInitialized();
      ArbEntryMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'UpdateEntryEvent';

  static String _$fileLocale(UpdateEntryEvent v) => v.fileLocale;
  static const Field<UpdateEntryEvent, String> _f$fileLocale = Field(
    'fileLocale',
    _$fileLocale,
  );
  static String _$entryKey(UpdateEntryEvent v) => v.entryKey;
  static const Field<UpdateEntryEvent, String> _f$entryKey = Field(
    'entryKey',
    _$entryKey,
  );
  static ArbEntry _$entry(UpdateEntryEvent v) => v.entry;
  static const Field<UpdateEntryEvent, ArbEntry> _f$entry = Field(
    'entry',
    _$entry,
  );

  @override
  final MappableFields<UpdateEntryEvent> fields = const {
    #fileLocale: _f$fileLocale,
    #entryKey: _f$entryKey,
    #entry: _f$entry,
  };

  static UpdateEntryEvent _instantiate(DecodingData data) {
    return UpdateEntryEvent(
      fileLocale: data.dec(_f$fileLocale),
      entryKey: data.dec(_f$entryKey),
      entry: data.dec(_f$entry),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static UpdateEntryEvent fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<UpdateEntryEvent>(map);
  }

  static UpdateEntryEvent fromJson(String json) {
    return ensureInitialized().decodeJson<UpdateEntryEvent>(json);
  }
}

mixin UpdateEntryEventMappable {
  String toJson() {
    return UpdateEntryEventMapper.ensureInitialized()
        .encodeJson<UpdateEntryEvent>(this as UpdateEntryEvent);
  }

  Map<String, dynamic> toMap() {
    return UpdateEntryEventMapper.ensureInitialized()
        .encodeMap<UpdateEntryEvent>(this as UpdateEntryEvent);
  }

  UpdateEntryEventCopyWith<UpdateEntryEvent, UpdateEntryEvent, UpdateEntryEvent>
  get copyWith =>
      _UpdateEntryEventCopyWithImpl<UpdateEntryEvent, UpdateEntryEvent>(
        this as UpdateEntryEvent,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return UpdateEntryEventMapper.ensureInitialized().stringifyValue(
      this as UpdateEntryEvent,
    );
  }

  @override
  bool operator ==(Object other) {
    return UpdateEntryEventMapper.ensureInitialized().equalsValue(
      this as UpdateEntryEvent,
      other,
    );
  }

  @override
  int get hashCode {
    return UpdateEntryEventMapper.ensureInitialized().hashValue(
      this as UpdateEntryEvent,
    );
  }
}

extension UpdateEntryEventValueCopy<$R, $Out>
    on ObjectCopyWith<$R, UpdateEntryEvent, $Out> {
  UpdateEntryEventCopyWith<$R, UpdateEntryEvent, $Out>
  get $asUpdateEntryEvent =>
      $base.as((v, t, t2) => _UpdateEntryEventCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class UpdateEntryEventCopyWith<$R, $In extends UpdateEntryEvent, $Out>
    implements TranslationEditorEventCopyWith<$R, $In, $Out> {
  ArbEntryCopyWith<$R, ArbEntry, ArbEntry> get entry;
  @override
  $R call({String? fileLocale, String? entryKey, ArbEntry? entry});
  UpdateEntryEventCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _UpdateEntryEventCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, UpdateEntryEvent, $Out>
    implements UpdateEntryEventCopyWith<$R, UpdateEntryEvent, $Out> {
  _UpdateEntryEventCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<UpdateEntryEvent> $mapper =
      UpdateEntryEventMapper.ensureInitialized();
  @override
  ArbEntryCopyWith<$R, ArbEntry, ArbEntry> get entry =>
      $value.entry.copyWith.$chain((v) => call(entry: v));
  @override
  $R call({String? fileLocale, String? entryKey, ArbEntry? entry}) => $apply(
    FieldCopyWithData({
      if (fileLocale != null) #fileLocale: fileLocale,
      if (entryKey != null) #entryKey: entryKey,
      if (entry != null) #entry: entry,
    }),
  );
  @override
  UpdateEntryEvent $make(CopyWithData data) => UpdateEntryEvent(
    fileLocale: data.get(#fileLocale, or: $value.fileLocale),
    entryKey: data.get(#entryKey, or: $value.entryKey),
    entry: data.get(#entry, or: $value.entry),
  );

  @override
  UpdateEntryEventCopyWith<$R2, UpdateEntryEvent, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _UpdateEntryEventCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class AddEntryEventMapper extends ClassMapperBase<AddEntryEvent> {
  AddEntryEventMapper._();

  static AddEntryEventMapper? _instance;
  static AddEntryEventMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AddEntryEventMapper._());
      TranslationEditorEventMapper.ensureInitialized();
      ArbEntryMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'AddEntryEvent';

  static String _$fileLocale(AddEntryEvent v) => v.fileLocale;
  static const Field<AddEntryEvent, String> _f$fileLocale = Field(
    'fileLocale',
    _$fileLocale,
  );
  static ArbEntry _$entry(AddEntryEvent v) => v.entry;
  static const Field<AddEntryEvent, ArbEntry> _f$entry = Field(
    'entry',
    _$entry,
  );

  @override
  final MappableFields<AddEntryEvent> fields = const {
    #fileLocale: _f$fileLocale,
    #entry: _f$entry,
  };

  static AddEntryEvent _instantiate(DecodingData data) {
    return AddEntryEvent(
      fileLocale: data.dec(_f$fileLocale),
      entry: data.dec(_f$entry),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static AddEntryEvent fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<AddEntryEvent>(map);
  }

  static AddEntryEvent fromJson(String json) {
    return ensureInitialized().decodeJson<AddEntryEvent>(json);
  }
}

mixin AddEntryEventMappable {
  String toJson() {
    return AddEntryEventMapper.ensureInitialized().encodeJson<AddEntryEvent>(
      this as AddEntryEvent,
    );
  }

  Map<String, dynamic> toMap() {
    return AddEntryEventMapper.ensureInitialized().encodeMap<AddEntryEvent>(
      this as AddEntryEvent,
    );
  }

  AddEntryEventCopyWith<AddEntryEvent, AddEntryEvent, AddEntryEvent>
  get copyWith => _AddEntryEventCopyWithImpl<AddEntryEvent, AddEntryEvent>(
    this as AddEntryEvent,
    $identity,
    $identity,
  );
  @override
  String toString() {
    return AddEntryEventMapper.ensureInitialized().stringifyValue(
      this as AddEntryEvent,
    );
  }

  @override
  bool operator ==(Object other) {
    return AddEntryEventMapper.ensureInitialized().equalsValue(
      this as AddEntryEvent,
      other,
    );
  }

  @override
  int get hashCode {
    return AddEntryEventMapper.ensureInitialized().hashValue(
      this as AddEntryEvent,
    );
  }
}

extension AddEntryEventValueCopy<$R, $Out>
    on ObjectCopyWith<$R, AddEntryEvent, $Out> {
  AddEntryEventCopyWith<$R, AddEntryEvent, $Out> get $asAddEntryEvent =>
      $base.as((v, t, t2) => _AddEntryEventCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class AddEntryEventCopyWith<$R, $In extends AddEntryEvent, $Out>
    implements TranslationEditorEventCopyWith<$R, $In, $Out> {
  ArbEntryCopyWith<$R, ArbEntry, ArbEntry> get entry;
  @override
  $R call({String? fileLocale, ArbEntry? entry});
  AddEntryEventCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _AddEntryEventCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, AddEntryEvent, $Out>
    implements AddEntryEventCopyWith<$R, AddEntryEvent, $Out> {
  _AddEntryEventCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<AddEntryEvent> $mapper =
      AddEntryEventMapper.ensureInitialized();
  @override
  ArbEntryCopyWith<$R, ArbEntry, ArbEntry> get entry =>
      $value.entry.copyWith.$chain((v) => call(entry: v));
  @override
  $R call({String? fileLocale, ArbEntry? entry}) => $apply(
    FieldCopyWithData({
      if (fileLocale != null) #fileLocale: fileLocale,
      if (entry != null) #entry: entry,
    }),
  );
  @override
  AddEntryEvent $make(CopyWithData data) => AddEntryEvent(
    fileLocale: data.get(#fileLocale, or: $value.fileLocale),
    entry: data.get(#entry, or: $value.entry),
  );

  @override
  AddEntryEventCopyWith<$R2, AddEntryEvent, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _AddEntryEventCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class DeleteEntryEventMapper extends ClassMapperBase<DeleteEntryEvent> {
  DeleteEntryEventMapper._();

  static DeleteEntryEventMapper? _instance;
  static DeleteEntryEventMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = DeleteEntryEventMapper._());
      TranslationEditorEventMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'DeleteEntryEvent';

  static String _$fileLocale(DeleteEntryEvent v) => v.fileLocale;
  static const Field<DeleteEntryEvent, String> _f$fileLocale = Field(
    'fileLocale',
    _$fileLocale,
  );
  static String _$entryKey(DeleteEntryEvent v) => v.entryKey;
  static const Field<DeleteEntryEvent, String> _f$entryKey = Field(
    'entryKey',
    _$entryKey,
  );

  @override
  final MappableFields<DeleteEntryEvent> fields = const {
    #fileLocale: _f$fileLocale,
    #entryKey: _f$entryKey,
  };

  static DeleteEntryEvent _instantiate(DecodingData data) {
    return DeleteEntryEvent(
      fileLocale: data.dec(_f$fileLocale),
      entryKey: data.dec(_f$entryKey),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static DeleteEntryEvent fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<DeleteEntryEvent>(map);
  }

  static DeleteEntryEvent fromJson(String json) {
    return ensureInitialized().decodeJson<DeleteEntryEvent>(json);
  }
}

mixin DeleteEntryEventMappable {
  String toJson() {
    return DeleteEntryEventMapper.ensureInitialized()
        .encodeJson<DeleteEntryEvent>(this as DeleteEntryEvent);
  }

  Map<String, dynamic> toMap() {
    return DeleteEntryEventMapper.ensureInitialized()
        .encodeMap<DeleteEntryEvent>(this as DeleteEntryEvent);
  }

  DeleteEntryEventCopyWith<DeleteEntryEvent, DeleteEntryEvent, DeleteEntryEvent>
  get copyWith =>
      _DeleteEntryEventCopyWithImpl<DeleteEntryEvent, DeleteEntryEvent>(
        this as DeleteEntryEvent,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return DeleteEntryEventMapper.ensureInitialized().stringifyValue(
      this as DeleteEntryEvent,
    );
  }

  @override
  bool operator ==(Object other) {
    return DeleteEntryEventMapper.ensureInitialized().equalsValue(
      this as DeleteEntryEvent,
      other,
    );
  }

  @override
  int get hashCode {
    return DeleteEntryEventMapper.ensureInitialized().hashValue(
      this as DeleteEntryEvent,
    );
  }
}

extension DeleteEntryEventValueCopy<$R, $Out>
    on ObjectCopyWith<$R, DeleteEntryEvent, $Out> {
  DeleteEntryEventCopyWith<$R, DeleteEntryEvent, $Out>
  get $asDeleteEntryEvent =>
      $base.as((v, t, t2) => _DeleteEntryEventCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class DeleteEntryEventCopyWith<$R, $In extends DeleteEntryEvent, $Out>
    implements TranslationEditorEventCopyWith<$R, $In, $Out> {
  @override
  $R call({String? fileLocale, String? entryKey});
  DeleteEntryEventCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _DeleteEntryEventCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, DeleteEntryEvent, $Out>
    implements DeleteEntryEventCopyWith<$R, DeleteEntryEvent, $Out> {
  _DeleteEntryEventCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<DeleteEntryEvent> $mapper =
      DeleteEntryEventMapper.ensureInitialized();
  @override
  $R call({String? fileLocale, String? entryKey}) => $apply(
    FieldCopyWithData({
      if (fileLocale != null) #fileLocale: fileLocale,
      if (entryKey != null) #entryKey: entryKey,
    }),
  );
  @override
  DeleteEntryEvent $make(CopyWithData data) => DeleteEntryEvent(
    fileLocale: data.get(#fileLocale, or: $value.fileLocale),
    entryKey: data.get(#entryKey, or: $value.entryKey),
  );

  @override
  DeleteEntryEventCopyWith<$R2, DeleteEntryEvent, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _DeleteEntryEventCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class UndoEventMapper extends ClassMapperBase<UndoEvent> {
  UndoEventMapper._();

  static UndoEventMapper? _instance;
  static UndoEventMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = UndoEventMapper._());
      TranslationEditorEventMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'UndoEvent';

  @override
  final MappableFields<UndoEvent> fields = const {};

  static UndoEvent _instantiate(DecodingData data) {
    return UndoEvent();
  }

  @override
  final Function instantiate = _instantiate;

  static UndoEvent fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<UndoEvent>(map);
  }

  static UndoEvent fromJson(String json) {
    return ensureInitialized().decodeJson<UndoEvent>(json);
  }
}

mixin UndoEventMappable {
  String toJson() {
    return UndoEventMapper.ensureInitialized().encodeJson<UndoEvent>(
      this as UndoEvent,
    );
  }

  Map<String, dynamic> toMap() {
    return UndoEventMapper.ensureInitialized().encodeMap<UndoEvent>(
      this as UndoEvent,
    );
  }

  UndoEventCopyWith<UndoEvent, UndoEvent, UndoEvent> get copyWith =>
      _UndoEventCopyWithImpl<UndoEvent, UndoEvent>(
        this as UndoEvent,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return UndoEventMapper.ensureInitialized().stringifyValue(
      this as UndoEvent,
    );
  }

  @override
  bool operator ==(Object other) {
    return UndoEventMapper.ensureInitialized().equalsValue(
      this as UndoEvent,
      other,
    );
  }

  @override
  int get hashCode {
    return UndoEventMapper.ensureInitialized().hashValue(this as UndoEvent);
  }
}

extension UndoEventValueCopy<$R, $Out> on ObjectCopyWith<$R, UndoEvent, $Out> {
  UndoEventCopyWith<$R, UndoEvent, $Out> get $asUndoEvent =>
      $base.as((v, t, t2) => _UndoEventCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class UndoEventCopyWith<$R, $In extends UndoEvent, $Out>
    implements TranslationEditorEventCopyWith<$R, $In, $Out> {
  @override
  $R call();
  UndoEventCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _UndoEventCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, UndoEvent, $Out>
    implements UndoEventCopyWith<$R, UndoEvent, $Out> {
  _UndoEventCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<UndoEvent> $mapper =
      UndoEventMapper.ensureInitialized();
  @override
  $R call() => $apply(FieldCopyWithData({}));
  @override
  UndoEvent $make(CopyWithData data) => UndoEvent();

  @override
  UndoEventCopyWith<$R2, UndoEvent, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _UndoEventCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class RedoEventMapper extends ClassMapperBase<RedoEvent> {
  RedoEventMapper._();

  static RedoEventMapper? _instance;
  static RedoEventMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = RedoEventMapper._());
      TranslationEditorEventMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'RedoEvent';

  @override
  final MappableFields<RedoEvent> fields = const {};

  static RedoEvent _instantiate(DecodingData data) {
    return RedoEvent();
  }

  @override
  final Function instantiate = _instantiate;

  static RedoEvent fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<RedoEvent>(map);
  }

  static RedoEvent fromJson(String json) {
    return ensureInitialized().decodeJson<RedoEvent>(json);
  }
}

mixin RedoEventMappable {
  String toJson() {
    return RedoEventMapper.ensureInitialized().encodeJson<RedoEvent>(
      this as RedoEvent,
    );
  }

  Map<String, dynamic> toMap() {
    return RedoEventMapper.ensureInitialized().encodeMap<RedoEvent>(
      this as RedoEvent,
    );
  }

  RedoEventCopyWith<RedoEvent, RedoEvent, RedoEvent> get copyWith =>
      _RedoEventCopyWithImpl<RedoEvent, RedoEvent>(
        this as RedoEvent,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return RedoEventMapper.ensureInitialized().stringifyValue(
      this as RedoEvent,
    );
  }

  @override
  bool operator ==(Object other) {
    return RedoEventMapper.ensureInitialized().equalsValue(
      this as RedoEvent,
      other,
    );
  }

  @override
  int get hashCode {
    return RedoEventMapper.ensureInitialized().hashValue(this as RedoEvent);
  }
}

extension RedoEventValueCopy<$R, $Out> on ObjectCopyWith<$R, RedoEvent, $Out> {
  RedoEventCopyWith<$R, RedoEvent, $Out> get $asRedoEvent =>
      $base.as((v, t, t2) => _RedoEventCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class RedoEventCopyWith<$R, $In extends RedoEvent, $Out>
    implements TranslationEditorEventCopyWith<$R, $In, $Out> {
  @override
  $R call();
  RedoEventCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _RedoEventCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, RedoEvent, $Out>
    implements RedoEventCopyWith<$R, RedoEvent, $Out> {
  _RedoEventCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<RedoEvent> $mapper =
      RedoEventMapper.ensureInitialized();
  @override
  $R call() => $apply(FieldCopyWithData({}));
  @override
  RedoEvent $make(CopyWithData data) => RedoEvent();

  @override
  RedoEventCopyWith<$R2, RedoEvent, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _RedoEventCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class SaveSessionEventMapper extends ClassMapperBase<SaveSessionEvent> {
  SaveSessionEventMapper._();

  static SaveSessionEventMapper? _instance;
  static SaveSessionEventMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = SaveSessionEventMapper._());
      TranslationEditorEventMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'SaveSessionEvent';

  @override
  final MappableFields<SaveSessionEvent> fields = const {};

  static SaveSessionEvent _instantiate(DecodingData data) {
    return SaveSessionEvent();
  }

  @override
  final Function instantiate = _instantiate;

  static SaveSessionEvent fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<SaveSessionEvent>(map);
  }

  static SaveSessionEvent fromJson(String json) {
    return ensureInitialized().decodeJson<SaveSessionEvent>(json);
  }
}

mixin SaveSessionEventMappable {
  String toJson() {
    return SaveSessionEventMapper.ensureInitialized()
        .encodeJson<SaveSessionEvent>(this as SaveSessionEvent);
  }

  Map<String, dynamic> toMap() {
    return SaveSessionEventMapper.ensureInitialized()
        .encodeMap<SaveSessionEvent>(this as SaveSessionEvent);
  }

  SaveSessionEventCopyWith<SaveSessionEvent, SaveSessionEvent, SaveSessionEvent>
  get copyWith =>
      _SaveSessionEventCopyWithImpl<SaveSessionEvent, SaveSessionEvent>(
        this as SaveSessionEvent,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return SaveSessionEventMapper.ensureInitialized().stringifyValue(
      this as SaveSessionEvent,
    );
  }

  @override
  bool operator ==(Object other) {
    return SaveSessionEventMapper.ensureInitialized().equalsValue(
      this as SaveSessionEvent,
      other,
    );
  }

  @override
  int get hashCode {
    return SaveSessionEventMapper.ensureInitialized().hashValue(
      this as SaveSessionEvent,
    );
  }
}

extension SaveSessionEventValueCopy<$R, $Out>
    on ObjectCopyWith<$R, SaveSessionEvent, $Out> {
  SaveSessionEventCopyWith<$R, SaveSessionEvent, $Out>
  get $asSaveSessionEvent =>
      $base.as((v, t, t2) => _SaveSessionEventCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class SaveSessionEventCopyWith<$R, $In extends SaveSessionEvent, $Out>
    implements TranslationEditorEventCopyWith<$R, $In, $Out> {
  @override
  $R call();
  SaveSessionEventCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _SaveSessionEventCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, SaveSessionEvent, $Out>
    implements SaveSessionEventCopyWith<$R, SaveSessionEvent, $Out> {
  _SaveSessionEventCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<SaveSessionEvent> $mapper =
      SaveSessionEventMapper.ensureInitialized();
  @override
  $R call() => $apply(FieldCopyWithData({}));
  @override
  SaveSessionEvent $make(CopyWithData data) => SaveSessionEvent();

  @override
  SaveSessionEventCopyWith<$R2, SaveSessionEvent, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _SaveSessionEventCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class AutoSaveEventMapper extends ClassMapperBase<AutoSaveEvent> {
  AutoSaveEventMapper._();

  static AutoSaveEventMapper? _instance;
  static AutoSaveEventMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AutoSaveEventMapper._());
      TranslationEditorEventMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'AutoSaveEvent';

  @override
  final MappableFields<AutoSaveEvent> fields = const {};

  static AutoSaveEvent _instantiate(DecodingData data) {
    return AutoSaveEvent();
  }

  @override
  final Function instantiate = _instantiate;

  static AutoSaveEvent fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<AutoSaveEvent>(map);
  }

  static AutoSaveEvent fromJson(String json) {
    return ensureInitialized().decodeJson<AutoSaveEvent>(json);
  }
}

mixin AutoSaveEventMappable {
  String toJson() {
    return AutoSaveEventMapper.ensureInitialized().encodeJson<AutoSaveEvent>(
      this as AutoSaveEvent,
    );
  }

  Map<String, dynamic> toMap() {
    return AutoSaveEventMapper.ensureInitialized().encodeMap<AutoSaveEvent>(
      this as AutoSaveEvent,
    );
  }

  AutoSaveEventCopyWith<AutoSaveEvent, AutoSaveEvent, AutoSaveEvent>
  get copyWith => _AutoSaveEventCopyWithImpl<AutoSaveEvent, AutoSaveEvent>(
    this as AutoSaveEvent,
    $identity,
    $identity,
  );
  @override
  String toString() {
    return AutoSaveEventMapper.ensureInitialized().stringifyValue(
      this as AutoSaveEvent,
    );
  }

  @override
  bool operator ==(Object other) {
    return AutoSaveEventMapper.ensureInitialized().equalsValue(
      this as AutoSaveEvent,
      other,
    );
  }

  @override
  int get hashCode {
    return AutoSaveEventMapper.ensureInitialized().hashValue(
      this as AutoSaveEvent,
    );
  }
}

extension AutoSaveEventValueCopy<$R, $Out>
    on ObjectCopyWith<$R, AutoSaveEvent, $Out> {
  AutoSaveEventCopyWith<$R, AutoSaveEvent, $Out> get $asAutoSaveEvent =>
      $base.as((v, t, t2) => _AutoSaveEventCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class AutoSaveEventCopyWith<$R, $In extends AutoSaveEvent, $Out>
    implements TranslationEditorEventCopyWith<$R, $In, $Out> {
  @override
  $R call();
  AutoSaveEventCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _AutoSaveEventCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, AutoSaveEvent, $Out>
    implements AutoSaveEventCopyWith<$R, AutoSaveEvent, $Out> {
  _AutoSaveEventCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<AutoSaveEvent> $mapper =
      AutoSaveEventMapper.ensureInitialized();
  @override
  $R call() => $apply(FieldCopyWithData({}));
  @override
  AutoSaveEvent $make(CopyWithData data) => AutoSaveEvent();

  @override
  AutoSaveEventCopyWith<$R2, AutoSaveEvent, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _AutoSaveEventCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class ValidateEntryEventMapper extends ClassMapperBase<ValidateEntryEvent> {
  ValidateEntryEventMapper._();

  static ValidateEntryEventMapper? _instance;
  static ValidateEntryEventMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ValidateEntryEventMapper._());
      TranslationEditorEventMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'ValidateEntryEvent';

  static String _$fileLocale(ValidateEntryEvent v) => v.fileLocale;
  static const Field<ValidateEntryEvent, String> _f$fileLocale = Field(
    'fileLocale',
    _$fileLocale,
  );
  static String _$entryKey(ValidateEntryEvent v) => v.entryKey;
  static const Field<ValidateEntryEvent, String> _f$entryKey = Field(
    'entryKey',
    _$entryKey,
  );

  @override
  final MappableFields<ValidateEntryEvent> fields = const {
    #fileLocale: _f$fileLocale,
    #entryKey: _f$entryKey,
  };

  static ValidateEntryEvent _instantiate(DecodingData data) {
    return ValidateEntryEvent(
      fileLocale: data.dec(_f$fileLocale),
      entryKey: data.dec(_f$entryKey),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static ValidateEntryEvent fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ValidateEntryEvent>(map);
  }

  static ValidateEntryEvent fromJson(String json) {
    return ensureInitialized().decodeJson<ValidateEntryEvent>(json);
  }
}

mixin ValidateEntryEventMappable {
  String toJson() {
    return ValidateEntryEventMapper.ensureInitialized()
        .encodeJson<ValidateEntryEvent>(this as ValidateEntryEvent);
  }

  Map<String, dynamic> toMap() {
    return ValidateEntryEventMapper.ensureInitialized()
        .encodeMap<ValidateEntryEvent>(this as ValidateEntryEvent);
  }

  ValidateEntryEventCopyWith<
    ValidateEntryEvent,
    ValidateEntryEvent,
    ValidateEntryEvent
  >
  get copyWith =>
      _ValidateEntryEventCopyWithImpl<ValidateEntryEvent, ValidateEntryEvent>(
        this as ValidateEntryEvent,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return ValidateEntryEventMapper.ensureInitialized().stringifyValue(
      this as ValidateEntryEvent,
    );
  }

  @override
  bool operator ==(Object other) {
    return ValidateEntryEventMapper.ensureInitialized().equalsValue(
      this as ValidateEntryEvent,
      other,
    );
  }

  @override
  int get hashCode {
    return ValidateEntryEventMapper.ensureInitialized().hashValue(
      this as ValidateEntryEvent,
    );
  }
}

extension ValidateEntryEventValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ValidateEntryEvent, $Out> {
  ValidateEntryEventCopyWith<$R, ValidateEntryEvent, $Out>
  get $asValidateEntryEvent => $base.as(
    (v, t, t2) => _ValidateEntryEventCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class ValidateEntryEventCopyWith<
  $R,
  $In extends ValidateEntryEvent,
  $Out
>
    implements TranslationEditorEventCopyWith<$R, $In, $Out> {
  @override
  $R call({String? fileLocale, String? entryKey});
  ValidateEntryEventCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _ValidateEntryEventCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ValidateEntryEvent, $Out>
    implements ValidateEntryEventCopyWith<$R, ValidateEntryEvent, $Out> {
  _ValidateEntryEventCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ValidateEntryEvent> $mapper =
      ValidateEntryEventMapper.ensureInitialized();
  @override
  $R call({String? fileLocale, String? entryKey}) => $apply(
    FieldCopyWithData({
      if (fileLocale != null) #fileLocale: fileLocale,
      if (entryKey != null) #entryKey: entryKey,
    }),
  );
  @override
  ValidateEntryEvent $make(CopyWithData data) => ValidateEntryEvent(
    fileLocale: data.get(#fileLocale, or: $value.fileLocale),
    entryKey: data.get(#entryKey, or: $value.entryKey),
  );

  @override
  ValidateEntryEventCopyWith<$R2, ValidateEntryEvent, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _ValidateEntryEventCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class FilterEntriesEventMapper extends ClassMapperBase<FilterEntriesEvent> {
  FilterEntriesEventMapper._();

  static FilterEntriesEventMapper? _instance;
  static FilterEntriesEventMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = FilterEntriesEventMapper._());
      TranslationEditorEventMapper.ensureInitialized();
      ArbEntryTypeMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'FilterEntriesEvent';

  static String? _$searchTerm(FilterEntriesEvent v) => v.searchTerm;
  static const Field<FilterEntriesEvent, String> _f$searchTerm = Field(
    'searchTerm',
    _$searchTerm,
    opt: true,
  );
  static ArbEntryType? _$entryType(FilterEntriesEvent v) => v.entryType;
  static const Field<FilterEntriesEvent, ArbEntryType> _f$entryType = Field(
    'entryType',
    _$entryType,
    opt: true,
  );
  static bool? _$hasIssues(FilterEntriesEvent v) => v.hasIssues;
  static const Field<FilterEntriesEvent, bool> _f$hasIssues = Field(
    'hasIssues',
    _$hasIssues,
    opt: true,
  );
  static bool? _$isTranslated(FilterEntriesEvent v) => v.isTranslated;
  static const Field<FilterEntriesEvent, bool> _f$isTranslated = Field(
    'isTranslated',
    _$isTranslated,
    opt: true,
  );

  @override
  final MappableFields<FilterEntriesEvent> fields = const {
    #searchTerm: _f$searchTerm,
    #entryType: _f$entryType,
    #hasIssues: _f$hasIssues,
    #isTranslated: _f$isTranslated,
  };

  static FilterEntriesEvent _instantiate(DecodingData data) {
    return FilterEntriesEvent(
      searchTerm: data.dec(_f$searchTerm),
      entryType: data.dec(_f$entryType),
      hasIssues: data.dec(_f$hasIssues),
      isTranslated: data.dec(_f$isTranslated),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static FilterEntriesEvent fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<FilterEntriesEvent>(map);
  }

  static FilterEntriesEvent fromJson(String json) {
    return ensureInitialized().decodeJson<FilterEntriesEvent>(json);
  }
}

mixin FilterEntriesEventMappable {
  String toJson() {
    return FilterEntriesEventMapper.ensureInitialized()
        .encodeJson<FilterEntriesEvent>(this as FilterEntriesEvent);
  }

  Map<String, dynamic> toMap() {
    return FilterEntriesEventMapper.ensureInitialized()
        .encodeMap<FilterEntriesEvent>(this as FilterEntriesEvent);
  }

  FilterEntriesEventCopyWith<
    FilterEntriesEvent,
    FilterEntriesEvent,
    FilterEntriesEvent
  >
  get copyWith =>
      _FilterEntriesEventCopyWithImpl<FilterEntriesEvent, FilterEntriesEvent>(
        this as FilterEntriesEvent,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return FilterEntriesEventMapper.ensureInitialized().stringifyValue(
      this as FilterEntriesEvent,
    );
  }

  @override
  bool operator ==(Object other) {
    return FilterEntriesEventMapper.ensureInitialized().equalsValue(
      this as FilterEntriesEvent,
      other,
    );
  }

  @override
  int get hashCode {
    return FilterEntriesEventMapper.ensureInitialized().hashValue(
      this as FilterEntriesEvent,
    );
  }
}

extension FilterEntriesEventValueCopy<$R, $Out>
    on ObjectCopyWith<$R, FilterEntriesEvent, $Out> {
  FilterEntriesEventCopyWith<$R, FilterEntriesEvent, $Out>
  get $asFilterEntriesEvent => $base.as(
    (v, t, t2) => _FilterEntriesEventCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class FilterEntriesEventCopyWith<
  $R,
  $In extends FilterEntriesEvent,
  $Out
>
    implements TranslationEditorEventCopyWith<$R, $In, $Out> {
  @override
  $R call({
    String? searchTerm,
    ArbEntryType? entryType,
    bool? hasIssues,
    bool? isTranslated,
  });
  FilterEntriesEventCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _FilterEntriesEventCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, FilterEntriesEvent, $Out>
    implements FilterEntriesEventCopyWith<$R, FilterEntriesEvent, $Out> {
  _FilterEntriesEventCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<FilterEntriesEvent> $mapper =
      FilterEntriesEventMapper.ensureInitialized();
  @override
  $R call({
    Object? searchTerm = $none,
    Object? entryType = $none,
    Object? hasIssues = $none,
    Object? isTranslated = $none,
  }) => $apply(
    FieldCopyWithData({
      if (searchTerm != $none) #searchTerm: searchTerm,
      if (entryType != $none) #entryType: entryType,
      if (hasIssues != $none) #hasIssues: hasIssues,
      if (isTranslated != $none) #isTranslated: isTranslated,
    }),
  );
  @override
  FilterEntriesEvent $make(CopyWithData data) => FilterEntriesEvent(
    searchTerm: data.get(#searchTerm, or: $value.searchTerm),
    entryType: data.get(#entryType, or: $value.entryType),
    hasIssues: data.get(#hasIssues, or: $value.hasIssues),
    isTranslated: data.get(#isTranslated, or: $value.isTranslated),
  );

  @override
  FilterEntriesEventCopyWith<$R2, FilterEntriesEvent, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _FilterEntriesEventCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class TranslationEditorStateMapper
    extends ClassMapperBase<TranslationEditorState> {
  TranslationEditorStateMapper._();

  static TranslationEditorStateMapper? _instance;
  static TranslationEditorStateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = TranslationEditorStateMapper._());
      TranslationEditorInitialStateMapper.ensureInitialized();
      TranslationEditorLoadingStateMapper.ensureInitialized();
      TranslationEditorLoadedStateMapper.ensureInitialized();
      TranslationEditorErrorStateMapper.ensureInitialized();
      TranslationEditorSavedStateMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'TranslationEditorState';

  @override
  final MappableFields<TranslationEditorState> fields = const {};

  static TranslationEditorState _instantiate(DecodingData data) {
    throw MapperException.missingConstructor('TranslationEditorState');
  }

  @override
  final Function instantiate = _instantiate;

  static TranslationEditorState fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<TranslationEditorState>(map);
  }

  static TranslationEditorState fromJson(String json) {
    return ensureInitialized().decodeJson<TranslationEditorState>(json);
  }
}

mixin TranslationEditorStateMappable {
  String toJson();
  Map<String, dynamic> toMap();
  TranslationEditorStateCopyWith<
    TranslationEditorState,
    TranslationEditorState,
    TranslationEditorState
  >
  get copyWith;
}

abstract class TranslationEditorStateCopyWith<
  $R,
  $In extends TranslationEditorState,
  $Out
>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call();
  TranslationEditorStateCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class TranslationEditorInitialStateMapper
    extends ClassMapperBase<TranslationEditorInitialState> {
  TranslationEditorInitialStateMapper._();

  static TranslationEditorInitialStateMapper? _instance;
  static TranslationEditorInitialStateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(
        _instance = TranslationEditorInitialStateMapper._(),
      );
      TranslationEditorStateMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'TranslationEditorInitialState';

  @override
  final MappableFields<TranslationEditorInitialState> fields = const {};

  static TranslationEditorInitialState _instantiate(DecodingData data) {
    return TranslationEditorInitialState();
  }

  @override
  final Function instantiate = _instantiate;

  static TranslationEditorInitialState fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<TranslationEditorInitialState>(map);
  }

  static TranslationEditorInitialState fromJson(String json) {
    return ensureInitialized().decodeJson<TranslationEditorInitialState>(json);
  }
}

mixin TranslationEditorInitialStateMappable {
  String toJson() {
    return TranslationEditorInitialStateMapper.ensureInitialized()
        .encodeJson<TranslationEditorInitialState>(
          this as TranslationEditorInitialState,
        );
  }

  Map<String, dynamic> toMap() {
    return TranslationEditorInitialStateMapper.ensureInitialized()
        .encodeMap<TranslationEditorInitialState>(
          this as TranslationEditorInitialState,
        );
  }

  TranslationEditorInitialStateCopyWith<
    TranslationEditorInitialState,
    TranslationEditorInitialState,
    TranslationEditorInitialState
  >
  get copyWith =>
      _TranslationEditorInitialStateCopyWithImpl<
        TranslationEditorInitialState,
        TranslationEditorInitialState
      >(this as TranslationEditorInitialState, $identity, $identity);
  @override
  String toString() {
    return TranslationEditorInitialStateMapper.ensureInitialized()
        .stringifyValue(this as TranslationEditorInitialState);
  }

  @override
  bool operator ==(Object other) {
    return TranslationEditorInitialStateMapper.ensureInitialized().equalsValue(
      this as TranslationEditorInitialState,
      other,
    );
  }

  @override
  int get hashCode {
    return TranslationEditorInitialStateMapper.ensureInitialized().hashValue(
      this as TranslationEditorInitialState,
    );
  }
}

extension TranslationEditorInitialStateValueCopy<$R, $Out>
    on ObjectCopyWith<$R, TranslationEditorInitialState, $Out> {
  TranslationEditorInitialStateCopyWith<$R, TranslationEditorInitialState, $Out>
  get $asTranslationEditorInitialState => $base.as(
    (v, t, t2) =>
        _TranslationEditorInitialStateCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class TranslationEditorInitialStateCopyWith<
  $R,
  $In extends TranslationEditorInitialState,
  $Out
>
    implements TranslationEditorStateCopyWith<$R, $In, $Out> {
  @override
  $R call();
  TranslationEditorInitialStateCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _TranslationEditorInitialStateCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, TranslationEditorInitialState, $Out>
    implements
        TranslationEditorInitialStateCopyWith<
          $R,
          TranslationEditorInitialState,
          $Out
        > {
  _TranslationEditorInitialStateCopyWithImpl(
    super.value,
    super.then,
    super.then2,
  );

  @override
  late final ClassMapperBase<TranslationEditorInitialState> $mapper =
      TranslationEditorInitialStateMapper.ensureInitialized();
  @override
  $R call() => $apply(FieldCopyWithData({}));
  @override
  TranslationEditorInitialState $make(CopyWithData data) =>
      TranslationEditorInitialState();

  @override
  TranslationEditorInitialStateCopyWith<
    $R2,
    TranslationEditorInitialState,
    $Out2
  >
  $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _TranslationEditorInitialStateCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class TranslationEditorLoadingStateMapper
    extends ClassMapperBase<TranslationEditorLoadingState> {
  TranslationEditorLoadingStateMapper._();

  static TranslationEditorLoadingStateMapper? _instance;
  static TranslationEditorLoadingStateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(
        _instance = TranslationEditorLoadingStateMapper._(),
      );
      TranslationEditorStateMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'TranslationEditorLoadingState';

  static String _$operation(TranslationEditorLoadingState v) => v.operation;
  static const Field<TranslationEditorLoadingState, String> _f$operation =
      Field('operation', _$operation);
  static double? _$progress(TranslationEditorLoadingState v) => v.progress;
  static const Field<TranslationEditorLoadingState, double> _f$progress = Field(
    'progress',
    _$progress,
    opt: true,
  );

  @override
  final MappableFields<TranslationEditorLoadingState> fields = const {
    #operation: _f$operation,
    #progress: _f$progress,
  };

  static TranslationEditorLoadingState _instantiate(DecodingData data) {
    return TranslationEditorLoadingState(
      operation: data.dec(_f$operation),
      progress: data.dec(_f$progress),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static TranslationEditorLoadingState fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<TranslationEditorLoadingState>(map);
  }

  static TranslationEditorLoadingState fromJson(String json) {
    return ensureInitialized().decodeJson<TranslationEditorLoadingState>(json);
  }
}

mixin TranslationEditorLoadingStateMappable {
  String toJson() {
    return TranslationEditorLoadingStateMapper.ensureInitialized()
        .encodeJson<TranslationEditorLoadingState>(
          this as TranslationEditorLoadingState,
        );
  }

  Map<String, dynamic> toMap() {
    return TranslationEditorLoadingStateMapper.ensureInitialized()
        .encodeMap<TranslationEditorLoadingState>(
          this as TranslationEditorLoadingState,
        );
  }

  TranslationEditorLoadingStateCopyWith<
    TranslationEditorLoadingState,
    TranslationEditorLoadingState,
    TranslationEditorLoadingState
  >
  get copyWith =>
      _TranslationEditorLoadingStateCopyWithImpl<
        TranslationEditorLoadingState,
        TranslationEditorLoadingState
      >(this as TranslationEditorLoadingState, $identity, $identity);
  @override
  String toString() {
    return TranslationEditorLoadingStateMapper.ensureInitialized()
        .stringifyValue(this as TranslationEditorLoadingState);
  }

  @override
  bool operator ==(Object other) {
    return TranslationEditorLoadingStateMapper.ensureInitialized().equalsValue(
      this as TranslationEditorLoadingState,
      other,
    );
  }

  @override
  int get hashCode {
    return TranslationEditorLoadingStateMapper.ensureInitialized().hashValue(
      this as TranslationEditorLoadingState,
    );
  }
}

extension TranslationEditorLoadingStateValueCopy<$R, $Out>
    on ObjectCopyWith<$R, TranslationEditorLoadingState, $Out> {
  TranslationEditorLoadingStateCopyWith<$R, TranslationEditorLoadingState, $Out>
  get $asTranslationEditorLoadingState => $base.as(
    (v, t, t2) =>
        _TranslationEditorLoadingStateCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class TranslationEditorLoadingStateCopyWith<
  $R,
  $In extends TranslationEditorLoadingState,
  $Out
>
    implements TranslationEditorStateCopyWith<$R, $In, $Out> {
  @override
  $R call({String? operation, double? progress});
  TranslationEditorLoadingStateCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _TranslationEditorLoadingStateCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, TranslationEditorLoadingState, $Out>
    implements
        TranslationEditorLoadingStateCopyWith<
          $R,
          TranslationEditorLoadingState,
          $Out
        > {
  _TranslationEditorLoadingStateCopyWithImpl(
    super.value,
    super.then,
    super.then2,
  );

  @override
  late final ClassMapperBase<TranslationEditorLoadingState> $mapper =
      TranslationEditorLoadingStateMapper.ensureInitialized();
  @override
  $R call({String? operation, Object? progress = $none}) => $apply(
    FieldCopyWithData({
      if (operation != null) #operation: operation,
      if (progress != $none) #progress: progress,
    }),
  );
  @override
  TranslationEditorLoadingState $make(CopyWithData data) =>
      TranslationEditorLoadingState(
        operation: data.get(#operation, or: $value.operation),
        progress: data.get(#progress, or: $value.progress),
      );

  @override
  TranslationEditorLoadingStateCopyWith<
    $R2,
    TranslationEditorLoadingState,
    $Out2
  >
  $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _TranslationEditorLoadingStateCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class TranslationEditorLoadedStateMapper
    extends ClassMapperBase<TranslationEditorLoadedState> {
  TranslationEditorLoadedStateMapper._();

  static TranslationEditorLoadedStateMapper? _instance;
  static TranslationEditorLoadedStateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(
        _instance = TranslationEditorLoadedStateMapper._(),
      );
      TranslationEditorStateMapper.ensureInitialized();
      TranslationSessionMapper.ensureInitialized();
      EntryFilterMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'TranslationEditorLoadedState';

  static TranslationSession _$session(TranslationEditorLoadedState v) =>
      v.session;
  static const Field<TranslationEditorLoadedState, TranslationSession>
  _f$session = Field('session', _$session);
  static Map<String, List<String>>? _$filteredEntries(
    TranslationEditorLoadedState v,
  ) => v.filteredEntries;
  static const Field<TranslationEditorLoadedState, Map<String, List<String>>>
  _f$filteredEntries = Field('filteredEntries', _$filteredEntries, opt: true);
  static Map<String, Map<String, IcuValidationResult>>? _$validationResults(
    TranslationEditorLoadedState v,
  ) => v.validationResults;
  static const Field<
    TranslationEditorLoadedState,
    Map<String, Map<String, IcuValidationResult>>
  >
  _f$validationResults = Field(
    'validationResults',
    _$validationResults,
    opt: true,
  );
  static String? _$searchTerm(TranslationEditorLoadedState v) => v.searchTerm;
  static const Field<TranslationEditorLoadedState, String> _f$searchTerm =
      Field('searchTerm', _$searchTerm, opt: true);
  static EntryFilter? _$filter(TranslationEditorLoadedState v) => v.filter;
  static const Field<TranslationEditorLoadedState, EntryFilter> _f$filter =
      Field('filter', _$filter, opt: true);
  static ArbFile? _$currentFile(TranslationEditorLoadedState v) =>
      v.currentFile;
  static const Field<TranslationEditorLoadedState, ArbFile> _f$currentFile =
      Field('currentFile', _$currentFile, mode: FieldMode.member);
  static ArbEntry? _$selectedEntry(TranslationEditorLoadedState v) =>
      v.selectedEntry;
  static const Field<TranslationEditorLoadedState, ArbEntry> _f$selectedEntry =
      Field('selectedEntry', _$selectedEntry, mode: FieldMode.member);
  static List<String> _$locales(TranslationEditorLoadedState v) => v.locales;
  static const Field<TranslationEditorLoadedState, List<String>> _f$locales =
      Field('locales', _$locales, mode: FieldMode.member);
  static bool _$canUndo(TranslationEditorLoadedState v) => v.canUndo;
  static const Field<TranslationEditorLoadedState, bool> _f$canUndo = Field(
    'canUndo',
    _$canUndo,
    mode: FieldMode.member,
  );
  static bool _$canRedo(TranslationEditorLoadedState v) => v.canRedo;
  static const Field<TranslationEditorLoadedState, bool> _f$canRedo = Field(
    'canRedo',
    _$canRedo,
    mode: FieldMode.member,
  );
  static bool _$hasUnsavedChanges(TranslationEditorLoadedState v) =>
      v.hasUnsavedChanges;
  static const Field<TranslationEditorLoadedState, bool> _f$hasUnsavedChanges =
      Field('hasUnsavedChanges', _$hasUnsavedChanges, mode: FieldMode.member);
  static List<String> _$currentFileEntries(TranslationEditorLoadedState v) =>
      v.currentFileEntries;
  static const Field<TranslationEditorLoadedState, List<String>>
  _f$currentFileEntries = Field(
    'currentFileEntries',
    _$currentFileEntries,
    mode: FieldMode.member,
  );
  static IcuValidationResult? _$currentEntryValidation(
    TranslationEditorLoadedState v,
  ) => v.currentEntryValidation;
  static const Field<TranslationEditorLoadedState, IcuValidationResult>
  _f$currentEntryValidation = Field(
    'currentEntryValidation',
    _$currentEntryValidation,
    mode: FieldMode.member,
  );

  @override
  final MappableFields<TranslationEditorLoadedState> fields = const {
    #session: _f$session,
    #filteredEntries: _f$filteredEntries,
    #validationResults: _f$validationResults,
    #searchTerm: _f$searchTerm,
    #filter: _f$filter,
    #currentFile: _f$currentFile,
    #selectedEntry: _f$selectedEntry,
    #locales: _f$locales,
    #canUndo: _f$canUndo,
    #canRedo: _f$canRedo,
    #hasUnsavedChanges: _f$hasUnsavedChanges,
    #currentFileEntries: _f$currentFileEntries,
    #currentEntryValidation: _f$currentEntryValidation,
  };

  static TranslationEditorLoadedState _instantiate(DecodingData data) {
    return TranslationEditorLoadedState(
      session: data.dec(_f$session),
      filteredEntries: data.dec(_f$filteredEntries),
      validationResults: data.dec(_f$validationResults),
      searchTerm: data.dec(_f$searchTerm),
      filter: data.dec(_f$filter),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static TranslationEditorLoadedState fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<TranslationEditorLoadedState>(map);
  }

  static TranslationEditorLoadedState fromJson(String json) {
    return ensureInitialized().decodeJson<TranslationEditorLoadedState>(json);
  }
}

mixin TranslationEditorLoadedStateMappable {
  String toJson() {
    return TranslationEditorLoadedStateMapper.ensureInitialized()
        .encodeJson<TranslationEditorLoadedState>(
          this as TranslationEditorLoadedState,
        );
  }

  Map<String, dynamic> toMap() {
    return TranslationEditorLoadedStateMapper.ensureInitialized()
        .encodeMap<TranslationEditorLoadedState>(
          this as TranslationEditorLoadedState,
        );
  }

  TranslationEditorLoadedStateCopyWith<
    TranslationEditorLoadedState,
    TranslationEditorLoadedState,
    TranslationEditorLoadedState
  >
  get copyWith =>
      _TranslationEditorLoadedStateCopyWithImpl<
        TranslationEditorLoadedState,
        TranslationEditorLoadedState
      >(this as TranslationEditorLoadedState, $identity, $identity);
  @override
  String toString() {
    return TranslationEditorLoadedStateMapper.ensureInitialized()
        .stringifyValue(this as TranslationEditorLoadedState);
  }

  @override
  bool operator ==(Object other) {
    return TranslationEditorLoadedStateMapper.ensureInitialized().equalsValue(
      this as TranslationEditorLoadedState,
      other,
    );
  }

  @override
  int get hashCode {
    return TranslationEditorLoadedStateMapper.ensureInitialized().hashValue(
      this as TranslationEditorLoadedState,
    );
  }
}

extension TranslationEditorLoadedStateValueCopy<$R, $Out>
    on ObjectCopyWith<$R, TranslationEditorLoadedState, $Out> {
  TranslationEditorLoadedStateCopyWith<$R, TranslationEditorLoadedState, $Out>
  get $asTranslationEditorLoadedState => $base.as(
    (v, t, t2) => _TranslationEditorLoadedStateCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class TranslationEditorLoadedStateCopyWith<
  $R,
  $In extends TranslationEditorLoadedState,
  $Out
>
    implements TranslationEditorStateCopyWith<$R, $In, $Out> {
  TranslationSessionCopyWith<$R, TranslationSession, TranslationSession>
  get session;
  MapCopyWith<
    $R,
    String,
    List<String>,
    ObjectCopyWith<$R, List<String>, List<String>>
  >?
  get filteredEntries;
  MapCopyWith<
    $R,
    String,
    Map<String, IcuValidationResult>,
    ObjectCopyWith<
      $R,
      Map<String, IcuValidationResult>,
      Map<String, IcuValidationResult>
    >
  >?
  get validationResults;
  EntryFilterCopyWith<$R, EntryFilter, EntryFilter>? get filter;
  @override
  $R call({
    TranslationSession? session,
    Map<String, List<String>>? filteredEntries,
    Map<String, Map<String, IcuValidationResult>>? validationResults,
    String? searchTerm,
    EntryFilter? filter,
  });
  TranslationEditorLoadedStateCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _TranslationEditorLoadedStateCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, TranslationEditorLoadedState, $Out>
    implements
        TranslationEditorLoadedStateCopyWith<
          $R,
          TranslationEditorLoadedState,
          $Out
        > {
  _TranslationEditorLoadedStateCopyWithImpl(
    super.value,
    super.then,
    super.then2,
  );

  @override
  late final ClassMapperBase<TranslationEditorLoadedState> $mapper =
      TranslationEditorLoadedStateMapper.ensureInitialized();
  @override
  TranslationSessionCopyWith<$R, TranslationSession, TranslationSession>
  get session => $value.session.copyWith.$chain((v) => call(session: v));
  @override
  MapCopyWith<
    $R,
    String,
    List<String>,
    ObjectCopyWith<$R, List<String>, List<String>>
  >?
  get filteredEntries => $value.filteredEntries != null
      ? MapCopyWith(
          $value.filteredEntries!,
          (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(filteredEntries: v),
        )
      : null;
  @override
  MapCopyWith<
    $R,
    String,
    Map<String, IcuValidationResult>,
    ObjectCopyWith<
      $R,
      Map<String, IcuValidationResult>,
      Map<String, IcuValidationResult>
    >
  >?
  get validationResults => $value.validationResults != null
      ? MapCopyWith(
          $value.validationResults!,
          (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(validationResults: v),
        )
      : null;
  @override
  EntryFilterCopyWith<$R, EntryFilter, EntryFilter>? get filter =>
      $value.filter?.copyWith.$chain((v) => call(filter: v));
  @override
  $R call({
    TranslationSession? session,
    Object? filteredEntries = $none,
    Object? validationResults = $none,
    Object? searchTerm = $none,
    Object? filter = $none,
  }) => $apply(
    FieldCopyWithData({
      if (session != null) #session: session,
      if (filteredEntries != $none) #filteredEntries: filteredEntries,
      if (validationResults != $none) #validationResults: validationResults,
      if (searchTerm != $none) #searchTerm: searchTerm,
      if (filter != $none) #filter: filter,
    }),
  );
  @override
  TranslationEditorLoadedState $make(CopyWithData data) =>
      TranslationEditorLoadedState(
        session: data.get(#session, or: $value.session),
        filteredEntries: data.get(#filteredEntries, or: $value.filteredEntries),
        validationResults: data.get(
          #validationResults,
          or: $value.validationResults,
        ),
        searchTerm: data.get(#searchTerm, or: $value.searchTerm),
        filter: data.get(#filter, or: $value.filter),
      );

  @override
  TranslationEditorLoadedStateCopyWith<$R2, TranslationEditorLoadedState, $Out2>
  $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _TranslationEditorLoadedStateCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class EntryFilterMapper extends ClassMapperBase<EntryFilter> {
  EntryFilterMapper._();

  static EntryFilterMapper? _instance;
  static EntryFilterMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = EntryFilterMapper._());
      ArbEntryTypeMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'EntryFilter';

  static String? _$searchTerm(EntryFilter v) => v.searchTerm;
  static const Field<EntryFilter, String> _f$searchTerm = Field(
    'searchTerm',
    _$searchTerm,
    opt: true,
  );
  static ArbEntryType? _$entryType(EntryFilter v) => v.entryType;
  static const Field<EntryFilter, ArbEntryType> _f$entryType = Field(
    'entryType',
    _$entryType,
    opt: true,
  );
  static bool? _$hasIssues(EntryFilter v) => v.hasIssues;
  static const Field<EntryFilter, bool> _f$hasIssues = Field(
    'hasIssues',
    _$hasIssues,
    opt: true,
  );
  static bool? _$isTranslated(EntryFilter v) => v.isTranslated;
  static const Field<EntryFilter, bool> _f$isTranslated = Field(
    'isTranslated',
    _$isTranslated,
    opt: true,
  );

  @override
  final MappableFields<EntryFilter> fields = const {
    #searchTerm: _f$searchTerm,
    #entryType: _f$entryType,
    #hasIssues: _f$hasIssues,
    #isTranslated: _f$isTranslated,
  };

  static EntryFilter _instantiate(DecodingData data) {
    return EntryFilter(
      searchTerm: data.dec(_f$searchTerm),
      entryType: data.dec(_f$entryType),
      hasIssues: data.dec(_f$hasIssues),
      isTranslated: data.dec(_f$isTranslated),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static EntryFilter fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<EntryFilter>(map);
  }

  static EntryFilter fromJson(String json) {
    return ensureInitialized().decodeJson<EntryFilter>(json);
  }
}

mixin EntryFilterMappable {
  String toJson() {
    return EntryFilterMapper.ensureInitialized().encodeJson<EntryFilter>(
      this as EntryFilter,
    );
  }

  Map<String, dynamic> toMap() {
    return EntryFilterMapper.ensureInitialized().encodeMap<EntryFilter>(
      this as EntryFilter,
    );
  }

  EntryFilterCopyWith<EntryFilter, EntryFilter, EntryFilter> get copyWith =>
      _EntryFilterCopyWithImpl<EntryFilter, EntryFilter>(
        this as EntryFilter,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return EntryFilterMapper.ensureInitialized().stringifyValue(
      this as EntryFilter,
    );
  }

  @override
  bool operator ==(Object other) {
    return EntryFilterMapper.ensureInitialized().equalsValue(
      this as EntryFilter,
      other,
    );
  }

  @override
  int get hashCode {
    return EntryFilterMapper.ensureInitialized().hashValue(this as EntryFilter);
  }
}

extension EntryFilterValueCopy<$R, $Out>
    on ObjectCopyWith<$R, EntryFilter, $Out> {
  EntryFilterCopyWith<$R, EntryFilter, $Out> get $asEntryFilter =>
      $base.as((v, t, t2) => _EntryFilterCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class EntryFilterCopyWith<$R, $In extends EntryFilter, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({
    String? searchTerm,
    ArbEntryType? entryType,
    bool? hasIssues,
    bool? isTranslated,
  });
  EntryFilterCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _EntryFilterCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, EntryFilter, $Out>
    implements EntryFilterCopyWith<$R, EntryFilter, $Out> {
  _EntryFilterCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<EntryFilter> $mapper =
      EntryFilterMapper.ensureInitialized();
  @override
  $R call({
    Object? searchTerm = $none,
    Object? entryType = $none,
    Object? hasIssues = $none,
    Object? isTranslated = $none,
  }) => $apply(
    FieldCopyWithData({
      if (searchTerm != $none) #searchTerm: searchTerm,
      if (entryType != $none) #entryType: entryType,
      if (hasIssues != $none) #hasIssues: hasIssues,
      if (isTranslated != $none) #isTranslated: isTranslated,
    }),
  );
  @override
  EntryFilter $make(CopyWithData data) => EntryFilter(
    searchTerm: data.get(#searchTerm, or: $value.searchTerm),
    entryType: data.get(#entryType, or: $value.entryType),
    hasIssues: data.get(#hasIssues, or: $value.hasIssues),
    isTranslated: data.get(#isTranslated, or: $value.isTranslated),
  );

  @override
  EntryFilterCopyWith<$R2, EntryFilter, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _EntryFilterCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class TranslationEditorErrorStateMapper
    extends ClassMapperBase<TranslationEditorErrorState> {
  TranslationEditorErrorStateMapper._();

  static TranslationEditorErrorStateMapper? _instance;
  static TranslationEditorErrorStateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(
        _instance = TranslationEditorErrorStateMapper._(),
      );
      TranslationEditorStateMapper.ensureInitialized();
      TranslationSessionMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'TranslationEditorErrorState';

  static String _$message(TranslationEditorErrorState v) => v.message;
  static const Field<TranslationEditorErrorState, String> _f$message = Field(
    'message',
    _$message,
  );
  static TranslationSession? _$session(TranslationEditorErrorState v) =>
      v.session;
  static const Field<TranslationEditorErrorState, TranslationSession>
  _f$session = Field('session', _$session, opt: true);

  @override
  final MappableFields<TranslationEditorErrorState> fields = const {
    #message: _f$message,
    #session: _f$session,
  };

  static TranslationEditorErrorState _instantiate(DecodingData data) {
    return TranslationEditorErrorState(
      message: data.dec(_f$message),
      session: data.dec(_f$session),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static TranslationEditorErrorState fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<TranslationEditorErrorState>(map);
  }

  static TranslationEditorErrorState fromJson(String json) {
    return ensureInitialized().decodeJson<TranslationEditorErrorState>(json);
  }
}

mixin TranslationEditorErrorStateMappable {
  String toJson() {
    return TranslationEditorErrorStateMapper.ensureInitialized()
        .encodeJson<TranslationEditorErrorState>(
          this as TranslationEditorErrorState,
        );
  }

  Map<String, dynamic> toMap() {
    return TranslationEditorErrorStateMapper.ensureInitialized()
        .encodeMap<TranslationEditorErrorState>(
          this as TranslationEditorErrorState,
        );
  }

  TranslationEditorErrorStateCopyWith<
    TranslationEditorErrorState,
    TranslationEditorErrorState,
    TranslationEditorErrorState
  >
  get copyWith =>
      _TranslationEditorErrorStateCopyWithImpl<
        TranslationEditorErrorState,
        TranslationEditorErrorState
      >(this as TranslationEditorErrorState, $identity, $identity);
  @override
  String toString() {
    return TranslationEditorErrorStateMapper.ensureInitialized().stringifyValue(
      this as TranslationEditorErrorState,
    );
  }

  @override
  bool operator ==(Object other) {
    return TranslationEditorErrorStateMapper.ensureInitialized().equalsValue(
      this as TranslationEditorErrorState,
      other,
    );
  }

  @override
  int get hashCode {
    return TranslationEditorErrorStateMapper.ensureInitialized().hashValue(
      this as TranslationEditorErrorState,
    );
  }
}

extension TranslationEditorErrorStateValueCopy<$R, $Out>
    on ObjectCopyWith<$R, TranslationEditorErrorState, $Out> {
  TranslationEditorErrorStateCopyWith<$R, TranslationEditorErrorState, $Out>
  get $asTranslationEditorErrorState => $base.as(
    (v, t, t2) => _TranslationEditorErrorStateCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class TranslationEditorErrorStateCopyWith<
  $R,
  $In extends TranslationEditorErrorState,
  $Out
>
    implements TranslationEditorStateCopyWith<$R, $In, $Out> {
  TranslationSessionCopyWith<$R, TranslationSession, TranslationSession>?
  get session;
  @override
  $R call({String? message, TranslationSession? session});
  TranslationEditorErrorStateCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _TranslationEditorErrorStateCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, TranslationEditorErrorState, $Out>
    implements
        TranslationEditorErrorStateCopyWith<
          $R,
          TranslationEditorErrorState,
          $Out
        > {
  _TranslationEditorErrorStateCopyWithImpl(
    super.value,
    super.then,
    super.then2,
  );

  @override
  late final ClassMapperBase<TranslationEditorErrorState> $mapper =
      TranslationEditorErrorStateMapper.ensureInitialized();
  @override
  TranslationSessionCopyWith<$R, TranslationSession, TranslationSession>?
  get session => $value.session?.copyWith.$chain((v) => call(session: v));
  @override
  $R call({String? message, Object? session = $none}) => $apply(
    FieldCopyWithData({
      if (message != null) #message: message,
      if (session != $none) #session: session,
    }),
  );
  @override
  TranslationEditorErrorState $make(CopyWithData data) =>
      TranslationEditorErrorState(
        message: data.get(#message, or: $value.message),
        session: data.get(#session, or: $value.session),
      );

  @override
  TranslationEditorErrorStateCopyWith<$R2, TranslationEditorErrorState, $Out2>
  $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _TranslationEditorErrorStateCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class TranslationEditorSavedStateMapper
    extends ClassMapperBase<TranslationEditorSavedState> {
  TranslationEditorSavedStateMapper._();

  static TranslationEditorSavedStateMapper? _instance;
  static TranslationEditorSavedStateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(
        _instance = TranslationEditorSavedStateMapper._(),
      );
      TranslationEditorStateMapper.ensureInitialized();
      TranslationSessionMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'TranslationEditorSavedState';

  static TranslationSession _$session(TranslationEditorSavedState v) =>
      v.session;
  static const Field<TranslationEditorSavedState, TranslationSession>
  _f$session = Field('session', _$session);
  static String _$message(TranslationEditorSavedState v) => v.message;
  static const Field<TranslationEditorSavedState, String> _f$message = Field(
    'message',
    _$message,
  );

  @override
  final MappableFields<TranslationEditorSavedState> fields = const {
    #session: _f$session,
    #message: _f$message,
  };

  static TranslationEditorSavedState _instantiate(DecodingData data) {
    return TranslationEditorSavedState(
      session: data.dec(_f$session),
      message: data.dec(_f$message),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static TranslationEditorSavedState fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<TranslationEditorSavedState>(map);
  }

  static TranslationEditorSavedState fromJson(String json) {
    return ensureInitialized().decodeJson<TranslationEditorSavedState>(json);
  }
}

mixin TranslationEditorSavedStateMappable {
  String toJson() {
    return TranslationEditorSavedStateMapper.ensureInitialized()
        .encodeJson<TranslationEditorSavedState>(
          this as TranslationEditorSavedState,
        );
  }

  Map<String, dynamic> toMap() {
    return TranslationEditorSavedStateMapper.ensureInitialized()
        .encodeMap<TranslationEditorSavedState>(
          this as TranslationEditorSavedState,
        );
  }

  TranslationEditorSavedStateCopyWith<
    TranslationEditorSavedState,
    TranslationEditorSavedState,
    TranslationEditorSavedState
  >
  get copyWith =>
      _TranslationEditorSavedStateCopyWithImpl<
        TranslationEditorSavedState,
        TranslationEditorSavedState
      >(this as TranslationEditorSavedState, $identity, $identity);
  @override
  String toString() {
    return TranslationEditorSavedStateMapper.ensureInitialized().stringifyValue(
      this as TranslationEditorSavedState,
    );
  }

  @override
  bool operator ==(Object other) {
    return TranslationEditorSavedStateMapper.ensureInitialized().equalsValue(
      this as TranslationEditorSavedState,
      other,
    );
  }

  @override
  int get hashCode {
    return TranslationEditorSavedStateMapper.ensureInitialized().hashValue(
      this as TranslationEditorSavedState,
    );
  }
}

extension TranslationEditorSavedStateValueCopy<$R, $Out>
    on ObjectCopyWith<$R, TranslationEditorSavedState, $Out> {
  TranslationEditorSavedStateCopyWith<$R, TranslationEditorSavedState, $Out>
  get $asTranslationEditorSavedState => $base.as(
    (v, t, t2) => _TranslationEditorSavedStateCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class TranslationEditorSavedStateCopyWith<
  $R,
  $In extends TranslationEditorSavedState,
  $Out
>
    implements TranslationEditorStateCopyWith<$R, $In, $Out> {
  TranslationSessionCopyWith<$R, TranslationSession, TranslationSession>
  get session;
  @override
  $R call({TranslationSession? session, String? message});
  TranslationEditorSavedStateCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _TranslationEditorSavedStateCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, TranslationEditorSavedState, $Out>
    implements
        TranslationEditorSavedStateCopyWith<
          $R,
          TranslationEditorSavedState,
          $Out
        > {
  _TranslationEditorSavedStateCopyWithImpl(
    super.value,
    super.then,
    super.then2,
  );

  @override
  late final ClassMapperBase<TranslationEditorSavedState> $mapper =
      TranslationEditorSavedStateMapper.ensureInitialized();
  @override
  TranslationSessionCopyWith<$R, TranslationSession, TranslationSession>
  get session => $value.session.copyWith.$chain((v) => call(session: v));
  @override
  $R call({TranslationSession? session, String? message}) => $apply(
    FieldCopyWithData({
      if (session != null) #session: session,
      if (message != null) #message: message,
    }),
  );
  @override
  TranslationEditorSavedState $make(CopyWithData data) =>
      TranslationEditorSavedState(
        session: data.get(#session, or: $value.session),
        message: data.get(#message, or: $value.message),
      );

  @override
  TranslationEditorSavedStateCopyWith<$R2, TranslationEditorSavedState, $Out2>
  $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _TranslationEditorSavedStateCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

