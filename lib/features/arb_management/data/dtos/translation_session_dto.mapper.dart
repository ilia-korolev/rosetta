// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'translation_session_dto.dart';

class TranslationSessionDtoMapper
    extends ClassMapperBase<TranslationSessionDto> {
  TranslationSessionDtoMapper._();

  static TranslationSessionDtoMapper? _instance;
  static TranslationSessionDtoMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = TranslationSessionDtoMapper._());
      SessionStateMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'TranslationSessionDto';

  static String _$sessionId(TranslationSessionDto v) => v.sessionId;
  static const Field<TranslationSessionDto, String> _f$sessionId = Field(
    'sessionId',
    _$sessionId,
  );
  static String _$createdAtIso(TranslationSessionDto v) => v.createdAtIso;
  static const Field<TranslationSessionDto, String> _f$createdAtIso = Field(
    'createdAtIso',
    _$createdAtIso,
  );
  static SessionState _$state(TranslationSessionDto v) => v.state;
  static const Field<TranslationSessionDto, SessionState> _f$state = Field(
    'state',
    _$state,
  );
  static Map<String, Map<String, dynamic>> _$files(TranslationSessionDto v) =>
      v.files;
  static const Field<TranslationSessionDto, Map<String, Map<String, dynamic>>>
  _f$files = Field('files', _$files);
  static List<Map<String, dynamic>> _$changes(TranslationSessionDto v) =>
      v.changes;
  static const Field<TranslationSessionDto, List<Map<String, dynamic>>>
  _f$changes = Field('changes', _$changes);
  static List<Map<String, dynamic>> _$undoStack(TranslationSessionDto v) =>
      v.undoStack;
  static const Field<TranslationSessionDto, List<Map<String, dynamic>>>
  _f$undoStack = Field('undoStack', _$undoStack);
  static List<Map<String, dynamic>> _$redoStack(TranslationSessionDto v) =>
      v.redoStack;
  static const Field<TranslationSessionDto, List<Map<String, dynamic>>>
  _f$redoStack = Field('redoStack', _$redoStack);
  static String? _$currentFileLocale(TranslationSessionDto v) =>
      v.currentFileLocale;
  static const Field<TranslationSessionDto, String> _f$currentFileLocale =
      Field('currentFileLocale', _$currentFileLocale, opt: true);
  static String? _$selectedEntryKey(TranslationSessionDto v) =>
      v.selectedEntryKey;
  static const Field<TranslationSessionDto, String> _f$selectedEntryKey = Field(
    'selectedEntryKey',
    _$selectedEntryKey,
    opt: true,
  );
  static bool _$hasUnsavedChanges(TranslationSessionDto v) =>
      v.hasUnsavedChanges;
  static const Field<TranslationSessionDto, bool> _f$hasUnsavedChanges = Field(
    'hasUnsavedChanges',
    _$hasUnsavedChanges,
    opt: true,
    def: false,
  );
  static String? _$lastAutoSaveIso(TranslationSessionDto v) =>
      v.lastAutoSaveIso;
  static const Field<TranslationSessionDto, String> _f$lastAutoSaveIso = Field(
    'lastAutoSaveIso',
    _$lastAutoSaveIso,
    opt: true,
  );

  @override
  final MappableFields<TranslationSessionDto> fields = const {
    #sessionId: _f$sessionId,
    #createdAtIso: _f$createdAtIso,
    #state: _f$state,
    #files: _f$files,
    #changes: _f$changes,
    #undoStack: _f$undoStack,
    #redoStack: _f$redoStack,
    #currentFileLocale: _f$currentFileLocale,
    #selectedEntryKey: _f$selectedEntryKey,
    #hasUnsavedChanges: _f$hasUnsavedChanges,
    #lastAutoSaveIso: _f$lastAutoSaveIso,
  };

  static TranslationSessionDto _instantiate(DecodingData data) {
    return TranslationSessionDto(
      sessionId: data.dec(_f$sessionId),
      createdAtIso: data.dec(_f$createdAtIso),
      state: data.dec(_f$state),
      files: data.dec(_f$files),
      changes: data.dec(_f$changes),
      undoStack: data.dec(_f$undoStack),
      redoStack: data.dec(_f$redoStack),
      currentFileLocale: data.dec(_f$currentFileLocale),
      selectedEntryKey: data.dec(_f$selectedEntryKey),
      hasUnsavedChanges: data.dec(_f$hasUnsavedChanges),
      lastAutoSaveIso: data.dec(_f$lastAutoSaveIso),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static TranslationSessionDto fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<TranslationSessionDto>(map);
  }

  static TranslationSessionDto fromJson(String json) {
    return ensureInitialized().decodeJson<TranslationSessionDto>(json);
  }
}

mixin TranslationSessionDtoMappable {
  String toJson() {
    return TranslationSessionDtoMapper.ensureInitialized()
        .encodeJson<TranslationSessionDto>(this as TranslationSessionDto);
  }

  Map<String, dynamic> toMap() {
    return TranslationSessionDtoMapper.ensureInitialized()
        .encodeMap<TranslationSessionDto>(this as TranslationSessionDto);
  }

  TranslationSessionDtoCopyWith<
    TranslationSessionDto,
    TranslationSessionDto,
    TranslationSessionDto
  >
  get copyWith =>
      _TranslationSessionDtoCopyWithImpl<
        TranslationSessionDto,
        TranslationSessionDto
      >(this as TranslationSessionDto, $identity, $identity);
  @override
  String toString() {
    return TranslationSessionDtoMapper.ensureInitialized().stringifyValue(
      this as TranslationSessionDto,
    );
  }

  @override
  bool operator ==(Object other) {
    return TranslationSessionDtoMapper.ensureInitialized().equalsValue(
      this as TranslationSessionDto,
      other,
    );
  }

  @override
  int get hashCode {
    return TranslationSessionDtoMapper.ensureInitialized().hashValue(
      this as TranslationSessionDto,
    );
  }
}

extension TranslationSessionDtoValueCopy<$R, $Out>
    on ObjectCopyWith<$R, TranslationSessionDto, $Out> {
  TranslationSessionDtoCopyWith<$R, TranslationSessionDto, $Out>
  get $asTranslationSessionDto => $base.as(
    (v, t, t2) => _TranslationSessionDtoCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class TranslationSessionDtoCopyWith<
  $R,
  $In extends TranslationSessionDto,
  $Out
>
    implements ClassCopyWith<$R, $In, $Out> {
  MapCopyWith<
    $R,
    String,
    Map<String, dynamic>,
    ObjectCopyWith<$R, Map<String, dynamic>, Map<String, dynamic>>
  >
  get files;
  ListCopyWith<
    $R,
    Map<String, dynamic>,
    ObjectCopyWith<$R, Map<String, dynamic>, Map<String, dynamic>>
  >
  get changes;
  ListCopyWith<
    $R,
    Map<String, dynamic>,
    ObjectCopyWith<$R, Map<String, dynamic>, Map<String, dynamic>>
  >
  get undoStack;
  ListCopyWith<
    $R,
    Map<String, dynamic>,
    ObjectCopyWith<$R, Map<String, dynamic>, Map<String, dynamic>>
  >
  get redoStack;
  $R call({
    String? sessionId,
    String? createdAtIso,
    SessionState? state,
    Map<String, Map<String, dynamic>>? files,
    List<Map<String, dynamic>>? changes,
    List<Map<String, dynamic>>? undoStack,
    List<Map<String, dynamic>>? redoStack,
    String? currentFileLocale,
    String? selectedEntryKey,
    bool? hasUnsavedChanges,
    String? lastAutoSaveIso,
  });
  TranslationSessionDtoCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _TranslationSessionDtoCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, TranslationSessionDto, $Out>
    implements TranslationSessionDtoCopyWith<$R, TranslationSessionDto, $Out> {
  _TranslationSessionDtoCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<TranslationSessionDto> $mapper =
      TranslationSessionDtoMapper.ensureInitialized();
  @override
  MapCopyWith<
    $R,
    String,
    Map<String, dynamic>,
    ObjectCopyWith<$R, Map<String, dynamic>, Map<String, dynamic>>
  >
  get files => MapCopyWith(
    $value.files,
    (v, t) => ObjectCopyWith(v, $identity, t),
    (v) => call(files: v),
  );
  @override
  ListCopyWith<
    $R,
    Map<String, dynamic>,
    ObjectCopyWith<$R, Map<String, dynamic>, Map<String, dynamic>>
  >
  get changes => ListCopyWith(
    $value.changes,
    (v, t) => ObjectCopyWith(v, $identity, t),
    (v) => call(changes: v),
  );
  @override
  ListCopyWith<
    $R,
    Map<String, dynamic>,
    ObjectCopyWith<$R, Map<String, dynamic>, Map<String, dynamic>>
  >
  get undoStack => ListCopyWith(
    $value.undoStack,
    (v, t) => ObjectCopyWith(v, $identity, t),
    (v) => call(undoStack: v),
  );
  @override
  ListCopyWith<
    $R,
    Map<String, dynamic>,
    ObjectCopyWith<$R, Map<String, dynamic>, Map<String, dynamic>>
  >
  get redoStack => ListCopyWith(
    $value.redoStack,
    (v, t) => ObjectCopyWith(v, $identity, t),
    (v) => call(redoStack: v),
  );
  @override
  $R call({
    String? sessionId,
    String? createdAtIso,
    SessionState? state,
    Map<String, Map<String, dynamic>>? files,
    List<Map<String, dynamic>>? changes,
    List<Map<String, dynamic>>? undoStack,
    List<Map<String, dynamic>>? redoStack,
    Object? currentFileLocale = $none,
    Object? selectedEntryKey = $none,
    bool? hasUnsavedChanges,
    Object? lastAutoSaveIso = $none,
  }) => $apply(
    FieldCopyWithData({
      if (sessionId != null) #sessionId: sessionId,
      if (createdAtIso != null) #createdAtIso: createdAtIso,
      if (state != null) #state: state,
      if (files != null) #files: files,
      if (changes != null) #changes: changes,
      if (undoStack != null) #undoStack: undoStack,
      if (redoStack != null) #redoStack: redoStack,
      if (currentFileLocale != $none) #currentFileLocale: currentFileLocale,
      if (selectedEntryKey != $none) #selectedEntryKey: selectedEntryKey,
      if (hasUnsavedChanges != null) #hasUnsavedChanges: hasUnsavedChanges,
      if (lastAutoSaveIso != $none) #lastAutoSaveIso: lastAutoSaveIso,
    }),
  );
  @override
  TranslationSessionDto $make(CopyWithData data) => TranslationSessionDto(
    sessionId: data.get(#sessionId, or: $value.sessionId),
    createdAtIso: data.get(#createdAtIso, or: $value.createdAtIso),
    state: data.get(#state, or: $value.state),
    files: data.get(#files, or: $value.files),
    changes: data.get(#changes, or: $value.changes),
    undoStack: data.get(#undoStack, or: $value.undoStack),
    redoStack: data.get(#redoStack, or: $value.redoStack),
    currentFileLocale: data.get(
      #currentFileLocale,
      or: $value.currentFileLocale,
    ),
    selectedEntryKey: data.get(#selectedEntryKey, or: $value.selectedEntryKey),
    hasUnsavedChanges: data.get(
      #hasUnsavedChanges,
      or: $value.hasUnsavedChanges,
    ),
    lastAutoSaveIso: data.get(#lastAutoSaveIso, or: $value.lastAutoSaveIso),
  );

  @override
  TranslationSessionDtoCopyWith<$R2, TranslationSessionDto, $Out2>
  $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _TranslationSessionDtoCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

