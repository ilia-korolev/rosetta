// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'translation_session.dart';

class ChangeTypeMapper extends EnumMapper<ChangeType> {
  ChangeTypeMapper._();

  static ChangeTypeMapper? _instance;
  static ChangeTypeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ChangeTypeMapper._());
    }
    return _instance!;
  }

  static ChangeType fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  ChangeType decode(dynamic value) {
    switch (value) {
      case r'add':
        return ChangeType.add;
      case r'edit':
        return ChangeType.edit;
      case r'delete':
        return ChangeType.delete;
      case r'metadata':
        return ChangeType.metadata;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(ChangeType self) {
    switch (self) {
      case ChangeType.add:
        return r'add';
      case ChangeType.edit:
        return r'edit';
      case ChangeType.delete:
        return r'delete';
      case ChangeType.metadata:
        return r'metadata';
    }
  }
}

extension ChangeTypeMapperExtension on ChangeType {
  String toValue() {
    ChangeTypeMapper.ensureInitialized();
    return MapperContainer.globals.toValue<ChangeType>(this) as String;
  }
}

class SessionStateMapper extends EnumMapper<SessionState> {
  SessionStateMapper._();

  static SessionStateMapper? _instance;
  static SessionStateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = SessionStateMapper._());
    }
    return _instance!;
  }

  static SessionState fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  SessionState decode(dynamic value) {
    switch (value) {
      case r'idle':
        return SessionState.idle;
      case r'editing':
        return SessionState.editing;
      case r'validating':
        return SessionState.validating;
      case r'saving':
        return SessionState.saving;
      case r'exporting':
        return SessionState.exporting;
      case r'error':
        return SessionState.error;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(SessionState self) {
    switch (self) {
      case SessionState.idle:
        return r'idle';
      case SessionState.editing:
        return r'editing';
      case SessionState.validating:
        return r'validating';
      case SessionState.saving:
        return r'saving';
      case SessionState.exporting:
        return r'exporting';
      case SessionState.error:
        return r'error';
    }
  }
}

extension SessionStateMapperExtension on SessionState {
  String toValue() {
    SessionStateMapper.ensureInitialized();
    return MapperContainer.globals.toValue<SessionState>(this) as String;
  }
}

class TranslationChangeMapper extends ClassMapperBase<TranslationChange> {
  TranslationChangeMapper._();

  static TranslationChangeMapper? _instance;
  static TranslationChangeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = TranslationChangeMapper._());
      ChangeTypeMapper.ensureInitialized();
      ArbEntryMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'TranslationChange';

  static String _$changeId(TranslationChange v) => v.changeId;
  static const Field<TranslationChange, String> _f$changeId = Field(
    'changeId',
    _$changeId,
  );
  static DateTime _$timestamp(TranslationChange v) => v.timestamp;
  static const Field<TranslationChange, DateTime> _f$timestamp = Field(
    'timestamp',
    _$timestamp,
  );
  static ChangeType _$type(TranslationChange v) => v.type;
  static const Field<TranslationChange, ChangeType> _f$type = Field(
    'type',
    _$type,
  );
  static String _$entryKey(TranslationChange v) => v.entryKey;
  static const Field<TranslationChange, String> _f$entryKey = Field(
    'entryKey',
    _$entryKey,
  );
  static String _$fileLocale(TranslationChange v) => v.fileLocale;
  static const Field<TranslationChange, String> _f$fileLocale = Field(
    'fileLocale',
    _$fileLocale,
  );
  static String? _$oldValue(TranslationChange v) => v.oldValue;
  static const Field<TranslationChange, String> _f$oldValue = Field(
    'oldValue',
    _$oldValue,
    opt: true,
  );
  static String? _$newValue(TranslationChange v) => v.newValue;
  static const Field<TranslationChange, String> _f$newValue = Field(
    'newValue',
    _$newValue,
    opt: true,
  );
  static ArbEntry? _$oldEntry(TranslationChange v) => v.oldEntry;
  static const Field<TranslationChange, ArbEntry> _f$oldEntry = Field(
    'oldEntry',
    _$oldEntry,
    opt: true,
  );
  static ArbEntry? _$newEntry(TranslationChange v) => v.newEntry;
  static const Field<TranslationChange, ArbEntry> _f$newEntry = Field(
    'newEntry',
    _$newEntry,
    opt: true,
  );
  static String? _$description(TranslationChange v) => v.description;
  static const Field<TranslationChange, String> _f$description = Field(
    'description',
    _$description,
    opt: true,
  );

  @override
  final MappableFields<TranslationChange> fields = const {
    #changeId: _f$changeId,
    #timestamp: _f$timestamp,
    #type: _f$type,
    #entryKey: _f$entryKey,
    #fileLocale: _f$fileLocale,
    #oldValue: _f$oldValue,
    #newValue: _f$newValue,
    #oldEntry: _f$oldEntry,
    #newEntry: _f$newEntry,
    #description: _f$description,
  };

  static TranslationChange _instantiate(DecodingData data) {
    return TranslationChange(
      changeId: data.dec(_f$changeId),
      timestamp: data.dec(_f$timestamp),
      type: data.dec(_f$type),
      entryKey: data.dec(_f$entryKey),
      fileLocale: data.dec(_f$fileLocale),
      oldValue: data.dec(_f$oldValue),
      newValue: data.dec(_f$newValue),
      oldEntry: data.dec(_f$oldEntry),
      newEntry: data.dec(_f$newEntry),
      description: data.dec(_f$description),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static TranslationChange fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<TranslationChange>(map);
  }

  static TranslationChange fromJson(String json) {
    return ensureInitialized().decodeJson<TranslationChange>(json);
  }
}

mixin TranslationChangeMappable {
  String toJson() {
    return TranslationChangeMapper.ensureInitialized()
        .encodeJson<TranslationChange>(this as TranslationChange);
  }

  Map<String, dynamic> toMap() {
    return TranslationChangeMapper.ensureInitialized()
        .encodeMap<TranslationChange>(this as TranslationChange);
  }

  TranslationChangeCopyWith<
    TranslationChange,
    TranslationChange,
    TranslationChange
  >
  get copyWith =>
      _TranslationChangeCopyWithImpl<TranslationChange, TranslationChange>(
        this as TranslationChange,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return TranslationChangeMapper.ensureInitialized().stringifyValue(
      this as TranslationChange,
    );
  }

  @override
  bool operator ==(Object other) {
    return TranslationChangeMapper.ensureInitialized().equalsValue(
      this as TranslationChange,
      other,
    );
  }

  @override
  int get hashCode {
    return TranslationChangeMapper.ensureInitialized().hashValue(
      this as TranslationChange,
    );
  }
}

extension TranslationChangeValueCopy<$R, $Out>
    on ObjectCopyWith<$R, TranslationChange, $Out> {
  TranslationChangeCopyWith<$R, TranslationChange, $Out>
  get $asTranslationChange => $base.as(
    (v, t, t2) => _TranslationChangeCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class TranslationChangeCopyWith<
  $R,
  $In extends TranslationChange,
  $Out
>
    implements ClassCopyWith<$R, $In, $Out> {
  ArbEntryCopyWith<$R, ArbEntry, ArbEntry>? get oldEntry;
  ArbEntryCopyWith<$R, ArbEntry, ArbEntry>? get newEntry;
  $R call({
    String? changeId,
    DateTime? timestamp,
    ChangeType? type,
    String? entryKey,
    String? fileLocale,
    String? oldValue,
    String? newValue,
    ArbEntry? oldEntry,
    ArbEntry? newEntry,
    String? description,
  });
  TranslationChangeCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _TranslationChangeCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, TranslationChange, $Out>
    implements TranslationChangeCopyWith<$R, TranslationChange, $Out> {
  _TranslationChangeCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<TranslationChange> $mapper =
      TranslationChangeMapper.ensureInitialized();
  @override
  ArbEntryCopyWith<$R, ArbEntry, ArbEntry>? get oldEntry =>
      $value.oldEntry?.copyWith.$chain((v) => call(oldEntry: v));
  @override
  ArbEntryCopyWith<$R, ArbEntry, ArbEntry>? get newEntry =>
      $value.newEntry?.copyWith.$chain((v) => call(newEntry: v));
  @override
  $R call({
    String? changeId,
    DateTime? timestamp,
    ChangeType? type,
    String? entryKey,
    String? fileLocale,
    Object? oldValue = $none,
    Object? newValue = $none,
    Object? oldEntry = $none,
    Object? newEntry = $none,
    Object? description = $none,
  }) => $apply(
    FieldCopyWithData({
      if (changeId != null) #changeId: changeId,
      if (timestamp != null) #timestamp: timestamp,
      if (type != null) #type: type,
      if (entryKey != null) #entryKey: entryKey,
      if (fileLocale != null) #fileLocale: fileLocale,
      if (oldValue != $none) #oldValue: oldValue,
      if (newValue != $none) #newValue: newValue,
      if (oldEntry != $none) #oldEntry: oldEntry,
      if (newEntry != $none) #newEntry: newEntry,
      if (description != $none) #description: description,
    }),
  );
  @override
  TranslationChange $make(CopyWithData data) => TranslationChange(
    changeId: data.get(#changeId, or: $value.changeId),
    timestamp: data.get(#timestamp, or: $value.timestamp),
    type: data.get(#type, or: $value.type),
    entryKey: data.get(#entryKey, or: $value.entryKey),
    fileLocale: data.get(#fileLocale, or: $value.fileLocale),
    oldValue: data.get(#oldValue, or: $value.oldValue),
    newValue: data.get(#newValue, or: $value.newValue),
    oldEntry: data.get(#oldEntry, or: $value.oldEntry),
    newEntry: data.get(#newEntry, or: $value.newEntry),
    description: data.get(#description, or: $value.description),
  );

  @override
  TranslationChangeCopyWith<$R2, TranslationChange, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _TranslationChangeCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class SessionStatisticsMapper extends ClassMapperBase<SessionStatistics> {
  SessionStatisticsMapper._();

  static SessionStatisticsMapper? _instance;
  static SessionStatisticsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = SessionStatisticsMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'SessionStatistics';

  static int _$totalChanges(SessionStatistics v) => v.totalChanges;
  static const Field<SessionStatistics, int> _f$totalChanges = Field(
    'totalChanges',
    _$totalChanges,
  );
  static int _$addedEntries(SessionStatistics v) => v.addedEntries;
  static const Field<SessionStatistics, int> _f$addedEntries = Field(
    'addedEntries',
    _$addedEntries,
  );
  static int _$editedEntries(SessionStatistics v) => v.editedEntries;
  static const Field<SessionStatistics, int> _f$editedEntries = Field(
    'editedEntries',
    _$editedEntries,
  );
  static int _$deletedEntries(SessionStatistics v) => v.deletedEntries;
  static const Field<SessionStatistics, int> _f$deletedEntries = Field(
    'deletedEntries',
    _$deletedEntries,
  );
  static int _$filesModified(SessionStatistics v) => v.filesModified;
  static const Field<SessionStatistics, int> _f$filesModified = Field(
    'filesModified',
    _$filesModified,
  );
  static Duration _$sessionDuration(SessionStatistics v) => v.sessionDuration;
  static const Field<SessionStatistics, Duration> _f$sessionDuration = Field(
    'sessionDuration',
    _$sessionDuration,
  );

  @override
  final MappableFields<SessionStatistics> fields = const {
    #totalChanges: _f$totalChanges,
    #addedEntries: _f$addedEntries,
    #editedEntries: _f$editedEntries,
    #deletedEntries: _f$deletedEntries,
    #filesModified: _f$filesModified,
    #sessionDuration: _f$sessionDuration,
  };

  static SessionStatistics _instantiate(DecodingData data) {
    return SessionStatistics(
      totalChanges: data.dec(_f$totalChanges),
      addedEntries: data.dec(_f$addedEntries),
      editedEntries: data.dec(_f$editedEntries),
      deletedEntries: data.dec(_f$deletedEntries),
      filesModified: data.dec(_f$filesModified),
      sessionDuration: data.dec(_f$sessionDuration),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static SessionStatistics fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<SessionStatistics>(map);
  }

  static SessionStatistics fromJson(String json) {
    return ensureInitialized().decodeJson<SessionStatistics>(json);
  }
}

mixin SessionStatisticsMappable {
  String toJson() {
    return SessionStatisticsMapper.ensureInitialized()
        .encodeJson<SessionStatistics>(this as SessionStatistics);
  }

  Map<String, dynamic> toMap() {
    return SessionStatisticsMapper.ensureInitialized()
        .encodeMap<SessionStatistics>(this as SessionStatistics);
  }

  SessionStatisticsCopyWith<
    SessionStatistics,
    SessionStatistics,
    SessionStatistics
  >
  get copyWith =>
      _SessionStatisticsCopyWithImpl<SessionStatistics, SessionStatistics>(
        this as SessionStatistics,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return SessionStatisticsMapper.ensureInitialized().stringifyValue(
      this as SessionStatistics,
    );
  }

  @override
  bool operator ==(Object other) {
    return SessionStatisticsMapper.ensureInitialized().equalsValue(
      this as SessionStatistics,
      other,
    );
  }

  @override
  int get hashCode {
    return SessionStatisticsMapper.ensureInitialized().hashValue(
      this as SessionStatistics,
    );
  }
}

extension SessionStatisticsValueCopy<$R, $Out>
    on ObjectCopyWith<$R, SessionStatistics, $Out> {
  SessionStatisticsCopyWith<$R, SessionStatistics, $Out>
  get $asSessionStatistics => $base.as(
    (v, t, t2) => _SessionStatisticsCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class SessionStatisticsCopyWith<
  $R,
  $In extends SessionStatistics,
  $Out
>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({
    int? totalChanges,
    int? addedEntries,
    int? editedEntries,
    int? deletedEntries,
    int? filesModified,
    Duration? sessionDuration,
  });
  SessionStatisticsCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _SessionStatisticsCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, SessionStatistics, $Out>
    implements SessionStatisticsCopyWith<$R, SessionStatistics, $Out> {
  _SessionStatisticsCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<SessionStatistics> $mapper =
      SessionStatisticsMapper.ensureInitialized();
  @override
  $R call({
    int? totalChanges,
    int? addedEntries,
    int? editedEntries,
    int? deletedEntries,
    int? filesModified,
    Duration? sessionDuration,
  }) => $apply(
    FieldCopyWithData({
      if (totalChanges != null) #totalChanges: totalChanges,
      if (addedEntries != null) #addedEntries: addedEntries,
      if (editedEntries != null) #editedEntries: editedEntries,
      if (deletedEntries != null) #deletedEntries: deletedEntries,
      if (filesModified != null) #filesModified: filesModified,
      if (sessionDuration != null) #sessionDuration: sessionDuration,
    }),
  );
  @override
  SessionStatistics $make(CopyWithData data) => SessionStatistics(
    totalChanges: data.get(#totalChanges, or: $value.totalChanges),
    addedEntries: data.get(#addedEntries, or: $value.addedEntries),
    editedEntries: data.get(#editedEntries, or: $value.editedEntries),
    deletedEntries: data.get(#deletedEntries, or: $value.deletedEntries),
    filesModified: data.get(#filesModified, or: $value.filesModified),
    sessionDuration: data.get(#sessionDuration, or: $value.sessionDuration),
  );

  @override
  SessionStatisticsCopyWith<$R2, SessionStatistics, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _SessionStatisticsCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class TranslationSessionMapper extends ClassMapperBase<TranslationSession> {
  TranslationSessionMapper._();

  static TranslationSessionMapper? _instance;
  static TranslationSessionMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = TranslationSessionMapper._());
      ArbFileMapper.ensureInitialized();
      SessionStateMapper.ensureInitialized();
      TranslationChangeMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'TranslationSession';

  static String _$sessionId(TranslationSession v) => v.sessionId;
  static const Field<TranslationSession, String> _f$sessionId = Field(
    'sessionId',
    _$sessionId,
  );
  static DateTime _$createdAt(TranslationSession v) => v.createdAt;
  static const Field<TranslationSession, DateTime> _f$createdAt = Field(
    'createdAt',
    _$createdAt,
  );
  static Map<String, ArbFile> _$files(TranslationSession v) => v.files;
  static const Field<TranslationSession, Map<String, ArbFile>> _f$files = Field(
    'files',
    _$files,
  );
  static SessionState _$state(TranslationSession v) => v.state;
  static const Field<TranslationSession, SessionState> _f$state = Field(
    'state',
    _$state,
  );
  static List<TranslationChange> _$changes(TranslationSession v) => v.changes;
  static const Field<TranslationSession, List<TranslationChange>> _f$changes =
      Field('changes', _$changes, opt: true, def: const []);
  static List<TranslationChange> _$undoStack(TranslationSession v) =>
      v.undoStack;
  static const Field<TranslationSession, List<TranslationChange>> _f$undoStack =
      Field('undoStack', _$undoStack, opt: true, def: const []);
  static List<TranslationChange> _$redoStack(TranslationSession v) =>
      v.redoStack;
  static const Field<TranslationSession, List<TranslationChange>> _f$redoStack =
      Field('redoStack', _$redoStack, opt: true, def: const []);
  static String? _$currentFileLocale(TranslationSession v) =>
      v.currentFileLocale;
  static const Field<TranslationSession, String> _f$currentFileLocale = Field(
    'currentFileLocale',
    _$currentFileLocale,
    opt: true,
  );
  static String? _$selectedEntryKey(TranslationSession v) => v.selectedEntryKey;
  static const Field<TranslationSession, String> _f$selectedEntryKey = Field(
    'selectedEntryKey',
    _$selectedEntryKey,
    opt: true,
  );
  static bool _$hasUnsavedChanges(TranslationSession v) => v.hasUnsavedChanges;
  static const Field<TranslationSession, bool> _f$hasUnsavedChanges = Field(
    'hasUnsavedChanges',
    _$hasUnsavedChanges,
    opt: true,
    def: false,
  );
  static DateTime? _$lastAutoSave(TranslationSession v) => v.lastAutoSave;
  static const Field<TranslationSession, DateTime> _f$lastAutoSave = Field(
    'lastAutoSave',
    _$lastAutoSave,
    opt: true,
  );
  static List<String> _$locales(TranslationSession v) => v.locales;
  static const Field<TranslationSession, List<String>> _f$locales = Field(
    'locales',
    _$locales,
    mode: FieldMode.member,
  );
  static ArbFile? _$currentFile(TranslationSession v) => v.currentFile;
  static const Field<TranslationSession, ArbFile> _f$currentFile = Field(
    'currentFile',
    _$currentFile,
    mode: FieldMode.member,
  );
  static ArbEntry? _$selectedEntry(TranslationSession v) => v.selectedEntry;
  static const Field<TranslationSession, ArbEntry> _f$selectedEntry = Field(
    'selectedEntry',
    _$selectedEntry,
    mode: FieldMode.member,
  );
  static bool _$canUndo(TranslationSession v) => v.canUndo;
  static const Field<TranslationSession, bool> _f$canUndo = Field(
    'canUndo',
    _$canUndo,
    mode: FieldMode.member,
  );
  static bool _$canRedo(TranslationSession v) => v.canRedo;
  static const Field<TranslationSession, bool> _f$canRedo = Field(
    'canRedo',
    _$canRedo,
    mode: FieldMode.member,
  );
  static Duration _$sessionDuration(TranslationSession v) => v.sessionDuration;
  static const Field<TranslationSession, Duration> _f$sessionDuration = Field(
    'sessionDuration',
    _$sessionDuration,
    mode: FieldMode.member,
  );

  @override
  final MappableFields<TranslationSession> fields = const {
    #sessionId: _f$sessionId,
    #createdAt: _f$createdAt,
    #files: _f$files,
    #state: _f$state,
    #changes: _f$changes,
    #undoStack: _f$undoStack,
    #redoStack: _f$redoStack,
    #currentFileLocale: _f$currentFileLocale,
    #selectedEntryKey: _f$selectedEntryKey,
    #hasUnsavedChanges: _f$hasUnsavedChanges,
    #lastAutoSave: _f$lastAutoSave,
    #locales: _f$locales,
    #currentFile: _f$currentFile,
    #selectedEntry: _f$selectedEntry,
    #canUndo: _f$canUndo,
    #canRedo: _f$canRedo,
    #sessionDuration: _f$sessionDuration,
  };

  static TranslationSession _instantiate(DecodingData data) {
    return TranslationSession(
      sessionId: data.dec(_f$sessionId),
      createdAt: data.dec(_f$createdAt),
      files: data.dec(_f$files),
      state: data.dec(_f$state),
      changes: data.dec(_f$changes),
      undoStack: data.dec(_f$undoStack),
      redoStack: data.dec(_f$redoStack),
      currentFileLocale: data.dec(_f$currentFileLocale),
      selectedEntryKey: data.dec(_f$selectedEntryKey),
      hasUnsavedChanges: data.dec(_f$hasUnsavedChanges),
      lastAutoSave: data.dec(_f$lastAutoSave),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static TranslationSession fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<TranslationSession>(map);
  }

  static TranslationSession fromJson(String json) {
    return ensureInitialized().decodeJson<TranslationSession>(json);
  }
}

mixin TranslationSessionMappable {
  String toJson() {
    return TranslationSessionMapper.ensureInitialized()
        .encodeJson<TranslationSession>(this as TranslationSession);
  }

  Map<String, dynamic> toMap() {
    return TranslationSessionMapper.ensureInitialized()
        .encodeMap<TranslationSession>(this as TranslationSession);
  }

  TranslationSessionCopyWith<
    TranslationSession,
    TranslationSession,
    TranslationSession
  >
  get copyWith =>
      _TranslationSessionCopyWithImpl<TranslationSession, TranslationSession>(
        this as TranslationSession,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return TranslationSessionMapper.ensureInitialized().stringifyValue(
      this as TranslationSession,
    );
  }

  @override
  bool operator ==(Object other) {
    return TranslationSessionMapper.ensureInitialized().equalsValue(
      this as TranslationSession,
      other,
    );
  }

  @override
  int get hashCode {
    return TranslationSessionMapper.ensureInitialized().hashValue(
      this as TranslationSession,
    );
  }
}

extension TranslationSessionValueCopy<$R, $Out>
    on ObjectCopyWith<$R, TranslationSession, $Out> {
  TranslationSessionCopyWith<$R, TranslationSession, $Out>
  get $asTranslationSession => $base.as(
    (v, t, t2) => _TranslationSessionCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class TranslationSessionCopyWith<
  $R,
  $In extends TranslationSession,
  $Out
>
    implements ClassCopyWith<$R, $In, $Out> {
  MapCopyWith<$R, String, ArbFile, ArbFileCopyWith<$R, ArbFile, ArbFile>>
  get files;
  ListCopyWith<
    $R,
    TranslationChange,
    TranslationChangeCopyWith<$R, TranslationChange, TranslationChange>
  >
  get changes;
  ListCopyWith<
    $R,
    TranslationChange,
    TranslationChangeCopyWith<$R, TranslationChange, TranslationChange>
  >
  get undoStack;
  ListCopyWith<
    $R,
    TranslationChange,
    TranslationChangeCopyWith<$R, TranslationChange, TranslationChange>
  >
  get redoStack;
  $R call({
    String? sessionId,
    DateTime? createdAt,
    Map<String, ArbFile>? files,
    SessionState? state,
    List<TranslationChange>? changes,
    List<TranslationChange>? undoStack,
    List<TranslationChange>? redoStack,
    String? currentFileLocale,
    String? selectedEntryKey,
    bool? hasUnsavedChanges,
    DateTime? lastAutoSave,
  });
  TranslationSessionCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _TranslationSessionCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, TranslationSession, $Out>
    implements TranslationSessionCopyWith<$R, TranslationSession, $Out> {
  _TranslationSessionCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<TranslationSession> $mapper =
      TranslationSessionMapper.ensureInitialized();
  @override
  MapCopyWith<$R, String, ArbFile, ArbFileCopyWith<$R, ArbFile, ArbFile>>
  get files => MapCopyWith(
    $value.files,
    (v, t) => v.copyWith.$chain(t),
    (v) => call(files: v),
  );
  @override
  ListCopyWith<
    $R,
    TranslationChange,
    TranslationChangeCopyWith<$R, TranslationChange, TranslationChange>
  >
  get changes => ListCopyWith(
    $value.changes,
    (v, t) => v.copyWith.$chain(t),
    (v) => call(changes: v),
  );
  @override
  ListCopyWith<
    $R,
    TranslationChange,
    TranslationChangeCopyWith<$R, TranslationChange, TranslationChange>
  >
  get undoStack => ListCopyWith(
    $value.undoStack,
    (v, t) => v.copyWith.$chain(t),
    (v) => call(undoStack: v),
  );
  @override
  ListCopyWith<
    $R,
    TranslationChange,
    TranslationChangeCopyWith<$R, TranslationChange, TranslationChange>
  >
  get redoStack => ListCopyWith(
    $value.redoStack,
    (v, t) => v.copyWith.$chain(t),
    (v) => call(redoStack: v),
  );
  @override
  $R call({
    String? sessionId,
    DateTime? createdAt,
    Map<String, ArbFile>? files,
    SessionState? state,
    List<TranslationChange>? changes,
    List<TranslationChange>? undoStack,
    List<TranslationChange>? redoStack,
    Object? currentFileLocale = $none,
    Object? selectedEntryKey = $none,
    bool? hasUnsavedChanges,
    Object? lastAutoSave = $none,
  }) => $apply(
    FieldCopyWithData({
      if (sessionId != null) #sessionId: sessionId,
      if (createdAt != null) #createdAt: createdAt,
      if (files != null) #files: files,
      if (state != null) #state: state,
      if (changes != null) #changes: changes,
      if (undoStack != null) #undoStack: undoStack,
      if (redoStack != null) #redoStack: redoStack,
      if (currentFileLocale != $none) #currentFileLocale: currentFileLocale,
      if (selectedEntryKey != $none) #selectedEntryKey: selectedEntryKey,
      if (hasUnsavedChanges != null) #hasUnsavedChanges: hasUnsavedChanges,
      if (lastAutoSave != $none) #lastAutoSave: lastAutoSave,
    }),
  );
  @override
  TranslationSession $make(CopyWithData data) => TranslationSession(
    sessionId: data.get(#sessionId, or: $value.sessionId),
    createdAt: data.get(#createdAt, or: $value.createdAt),
    files: data.get(#files, or: $value.files),
    state: data.get(#state, or: $value.state),
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
    lastAutoSave: data.get(#lastAutoSave, or: $value.lastAutoSave),
  );

  @override
  TranslationSessionCopyWith<$R2, TranslationSession, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _TranslationSessionCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

