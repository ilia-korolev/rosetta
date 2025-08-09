// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'arb_file.dart';

class ArbFileMetadataMapper extends ClassMapperBase<ArbFileMetadata> {
  ArbFileMetadataMapper._();

  static ArbFileMetadataMapper? _instance;
  static ArbFileMetadataMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ArbFileMetadataMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'ArbFileMetadata';

  static String _$locale(ArbFileMetadata v) => v.locale;
  static const Field<ArbFileMetadata, String> _f$locale = Field(
    'locale',
    _$locale,
  );
  static DateTime? _$lastModified(ArbFileMetadata v) => v.lastModified;
  static const Field<ArbFileMetadata, DateTime> _f$lastModified = Field(
    'lastModified',
    _$lastModified,
    opt: true,
  );
  static String? _$context(ArbFileMetadata v) => v.context;
  static const Field<ArbFileMetadata, String> _f$context = Field(
    'context',
    _$context,
    opt: true,
  );
  static String? _$author(ArbFileMetadata v) => v.author;
  static const Field<ArbFileMetadata, String> _f$author = Field(
    'author',
    _$author,
    opt: true,
  );
  static String? _$version(ArbFileMetadata v) => v.version;
  static const Field<ArbFileMetadata, String> _f$version = Field(
    'version',
    _$version,
    opt: true,
  );

  @override
  final MappableFields<ArbFileMetadata> fields = const {
    #locale: _f$locale,
    #lastModified: _f$lastModified,
    #context: _f$context,
    #author: _f$author,
    #version: _f$version,
  };

  static ArbFileMetadata _instantiate(DecodingData data) {
    return ArbFileMetadata(
      locale: data.dec(_f$locale),
      lastModified: data.dec(_f$lastModified),
      context: data.dec(_f$context),
      author: data.dec(_f$author),
      version: data.dec(_f$version),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static ArbFileMetadata fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ArbFileMetadata>(map);
  }

  static ArbFileMetadata fromJson(String json) {
    return ensureInitialized().decodeJson<ArbFileMetadata>(json);
  }
}

mixin ArbFileMetadataMappable {
  String toJson() {
    return ArbFileMetadataMapper.ensureInitialized()
        .encodeJson<ArbFileMetadata>(this as ArbFileMetadata);
  }

  Map<String, dynamic> toMap() {
    return ArbFileMetadataMapper.ensureInitialized().encodeMap<ArbFileMetadata>(
      this as ArbFileMetadata,
    );
  }

  ArbFileMetadataCopyWith<ArbFileMetadata, ArbFileMetadata, ArbFileMetadata>
  get copyWith =>
      _ArbFileMetadataCopyWithImpl<ArbFileMetadata, ArbFileMetadata>(
        this as ArbFileMetadata,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return ArbFileMetadataMapper.ensureInitialized().stringifyValue(
      this as ArbFileMetadata,
    );
  }

  @override
  bool operator ==(Object other) {
    return ArbFileMetadataMapper.ensureInitialized().equalsValue(
      this as ArbFileMetadata,
      other,
    );
  }

  @override
  int get hashCode {
    return ArbFileMetadataMapper.ensureInitialized().hashValue(
      this as ArbFileMetadata,
    );
  }
}

extension ArbFileMetadataValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ArbFileMetadata, $Out> {
  ArbFileMetadataCopyWith<$R, ArbFileMetadata, $Out> get $asArbFileMetadata =>
      $base.as((v, t, t2) => _ArbFileMetadataCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class ArbFileMetadataCopyWith<$R, $In extends ArbFileMetadata, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({
    String? locale,
    DateTime? lastModified,
    String? context,
    String? author,
    String? version,
  });
  ArbFileMetadataCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _ArbFileMetadataCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ArbFileMetadata, $Out>
    implements ArbFileMetadataCopyWith<$R, ArbFileMetadata, $Out> {
  _ArbFileMetadataCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ArbFileMetadata> $mapper =
      ArbFileMetadataMapper.ensureInitialized();
  @override
  $R call({
    String? locale,
    Object? lastModified = $none,
    Object? context = $none,
    Object? author = $none,
    Object? version = $none,
  }) => $apply(
    FieldCopyWithData({
      if (locale != null) #locale: locale,
      if (lastModified != $none) #lastModified: lastModified,
      if (context != $none) #context: context,
      if (author != $none) #author: author,
      if (version != $none) #version: version,
    }),
  );
  @override
  ArbFileMetadata $make(CopyWithData data) => ArbFileMetadata(
    locale: data.get(#locale, or: $value.locale),
    lastModified: data.get(#lastModified, or: $value.lastModified),
    context: data.get(#context, or: $value.context),
    author: data.get(#author, or: $value.author),
    version: data.get(#version, or: $value.version),
  );

  @override
  ArbFileMetadataCopyWith<$R2, ArbFileMetadata, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _ArbFileMetadataCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class ArbFileStatisticsMapper extends ClassMapperBase<ArbFileStatistics> {
  ArbFileStatisticsMapper._();

  static ArbFileStatisticsMapper? _instance;
  static ArbFileStatisticsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ArbFileStatisticsMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'ArbFileStatistics';

  static int _$totalEntries(ArbFileStatistics v) => v.totalEntries;
  static const Field<ArbFileStatistics, int> _f$totalEntries = Field(
    'totalEntries',
    _$totalEntries,
  );
  static int _$translatedEntries(ArbFileStatistics v) => v.translatedEntries;
  static const Field<ArbFileStatistics, int> _f$translatedEntries = Field(
    'translatedEntries',
    _$translatedEntries,
  );
  static int _$emptyEntries(ArbFileStatistics v) => v.emptyEntries;
  static const Field<ArbFileStatistics, int> _f$emptyEntries = Field(
    'emptyEntries',
    _$emptyEntries,
  );
  static int _$entriesWithPlurals(ArbFileStatistics v) => v.entriesWithPlurals;
  static const Field<ArbFileStatistics, int> _f$entriesWithPlurals = Field(
    'entriesWithPlurals',
    _$entriesWithPlurals,
  );
  static int _$entriesWithSelects(ArbFileStatistics v) => v.entriesWithSelects;
  static const Field<ArbFileStatistics, int> _f$entriesWithSelects = Field(
    'entriesWithSelects',
    _$entriesWithSelects,
  );
  static int _$entriesWithNumbers(ArbFileStatistics v) => v.entriesWithNumbers;
  static const Field<ArbFileStatistics, int> _f$entriesWithNumbers = Field(
    'entriesWithNumbers',
    _$entriesWithNumbers,
  );
  static int _$entriesWithDates(ArbFileStatistics v) => v.entriesWithDates;
  static const Field<ArbFileStatistics, int> _f$entriesWithDates = Field(
    'entriesWithDates',
    _$entriesWithDates,
  );
  static double _$completionPercentage(ArbFileStatistics v) =>
      v.completionPercentage;
  static const Field<ArbFileStatistics, double> _f$completionPercentage = Field(
    'completionPercentage',
    _$completionPercentage,
    mode: FieldMode.member,
  );
  static bool _$isComplete(ArbFileStatistics v) => v.isComplete;
  static const Field<ArbFileStatistics, bool> _f$isComplete = Field(
    'isComplete',
    _$isComplete,
    mode: FieldMode.member,
  );

  @override
  final MappableFields<ArbFileStatistics> fields = const {
    #totalEntries: _f$totalEntries,
    #translatedEntries: _f$translatedEntries,
    #emptyEntries: _f$emptyEntries,
    #entriesWithPlurals: _f$entriesWithPlurals,
    #entriesWithSelects: _f$entriesWithSelects,
    #entriesWithNumbers: _f$entriesWithNumbers,
    #entriesWithDates: _f$entriesWithDates,
    #completionPercentage: _f$completionPercentage,
    #isComplete: _f$isComplete,
  };

  static ArbFileStatistics _instantiate(DecodingData data) {
    return ArbFileStatistics(
      totalEntries: data.dec(_f$totalEntries),
      translatedEntries: data.dec(_f$translatedEntries),
      emptyEntries: data.dec(_f$emptyEntries),
      entriesWithPlurals: data.dec(_f$entriesWithPlurals),
      entriesWithSelects: data.dec(_f$entriesWithSelects),
      entriesWithNumbers: data.dec(_f$entriesWithNumbers),
      entriesWithDates: data.dec(_f$entriesWithDates),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static ArbFileStatistics fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ArbFileStatistics>(map);
  }

  static ArbFileStatistics fromJson(String json) {
    return ensureInitialized().decodeJson<ArbFileStatistics>(json);
  }
}

mixin ArbFileStatisticsMappable {
  String toJson() {
    return ArbFileStatisticsMapper.ensureInitialized()
        .encodeJson<ArbFileStatistics>(this as ArbFileStatistics);
  }

  Map<String, dynamic> toMap() {
    return ArbFileStatisticsMapper.ensureInitialized()
        .encodeMap<ArbFileStatistics>(this as ArbFileStatistics);
  }

  ArbFileStatisticsCopyWith<
    ArbFileStatistics,
    ArbFileStatistics,
    ArbFileStatistics
  >
  get copyWith =>
      _ArbFileStatisticsCopyWithImpl<ArbFileStatistics, ArbFileStatistics>(
        this as ArbFileStatistics,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return ArbFileStatisticsMapper.ensureInitialized().stringifyValue(
      this as ArbFileStatistics,
    );
  }

  @override
  bool operator ==(Object other) {
    return ArbFileStatisticsMapper.ensureInitialized().equalsValue(
      this as ArbFileStatistics,
      other,
    );
  }

  @override
  int get hashCode {
    return ArbFileStatisticsMapper.ensureInitialized().hashValue(
      this as ArbFileStatistics,
    );
  }
}

extension ArbFileStatisticsValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ArbFileStatistics, $Out> {
  ArbFileStatisticsCopyWith<$R, ArbFileStatistics, $Out>
  get $asArbFileStatistics => $base.as(
    (v, t, t2) => _ArbFileStatisticsCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class ArbFileStatisticsCopyWith<
  $R,
  $In extends ArbFileStatistics,
  $Out
>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({
    int? totalEntries,
    int? translatedEntries,
    int? emptyEntries,
    int? entriesWithPlurals,
    int? entriesWithSelects,
    int? entriesWithNumbers,
    int? entriesWithDates,
  });
  ArbFileStatisticsCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _ArbFileStatisticsCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ArbFileStatistics, $Out>
    implements ArbFileStatisticsCopyWith<$R, ArbFileStatistics, $Out> {
  _ArbFileStatisticsCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ArbFileStatistics> $mapper =
      ArbFileStatisticsMapper.ensureInitialized();
  @override
  $R call({
    int? totalEntries,
    int? translatedEntries,
    int? emptyEntries,
    int? entriesWithPlurals,
    int? entriesWithSelects,
    int? entriesWithNumbers,
    int? entriesWithDates,
  }) => $apply(
    FieldCopyWithData({
      if (totalEntries != null) #totalEntries: totalEntries,
      if (translatedEntries != null) #translatedEntries: translatedEntries,
      if (emptyEntries != null) #emptyEntries: emptyEntries,
      if (entriesWithPlurals != null) #entriesWithPlurals: entriesWithPlurals,
      if (entriesWithSelects != null) #entriesWithSelects: entriesWithSelects,
      if (entriesWithNumbers != null) #entriesWithNumbers: entriesWithNumbers,
      if (entriesWithDates != null) #entriesWithDates: entriesWithDates,
    }),
  );
  @override
  ArbFileStatistics $make(CopyWithData data) => ArbFileStatistics(
    totalEntries: data.get(#totalEntries, or: $value.totalEntries),
    translatedEntries: data.get(
      #translatedEntries,
      or: $value.translatedEntries,
    ),
    emptyEntries: data.get(#emptyEntries, or: $value.emptyEntries),
    entriesWithPlurals: data.get(
      #entriesWithPlurals,
      or: $value.entriesWithPlurals,
    ),
    entriesWithSelects: data.get(
      #entriesWithSelects,
      or: $value.entriesWithSelects,
    ),
    entriesWithNumbers: data.get(
      #entriesWithNumbers,
      or: $value.entriesWithNumbers,
    ),
    entriesWithDates: data.get(#entriesWithDates, or: $value.entriesWithDates),
  );

  @override
  ArbFileStatisticsCopyWith<$R2, ArbFileStatistics, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _ArbFileStatisticsCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class ArbFileMapper extends ClassMapperBase<ArbFile> {
  ArbFileMapper._();

  static ArbFileMapper? _instance;
  static ArbFileMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ArbFileMapper._());
      ArbEntryMapper.ensureInitialized();
      ArbFileMetadataMapper.ensureInitialized();
      ArbFileStatisticsMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'ArbFile';

  static String _$filePath(ArbFile v) => v.filePath;
  static const Field<ArbFile, String> _f$filePath = Field(
    'filePath',
    _$filePath,
  );
  static Map<String, ArbEntry> _$entries(ArbFile v) => v.entries;
  static const Field<ArbFile, Map<String, ArbEntry>> _f$entries = Field(
    'entries',
    _$entries,
  );
  static ArbFileMetadata _$metadata(ArbFile v) => v.metadata;
  static const Field<ArbFile, ArbFileMetadata> _f$metadata = Field(
    'metadata',
    _$metadata,
  );
  static ArbFileStatistics? _$statistics(ArbFile v) => v.statistics;
  static const Field<ArbFile, ArbFileStatistics> _f$statistics = Field(
    'statistics',
    _$statistics,
    opt: true,
  );
  static DateTime? _$lastSaved(ArbFile v) => v.lastSaved;
  static const Field<ArbFile, DateTime> _f$lastSaved = Field(
    'lastSaved',
    _$lastSaved,
    opt: true,
  );
  static bool _$hasUnsavedChanges(ArbFile v) => v.hasUnsavedChanges;
  static const Field<ArbFile, bool> _f$hasUnsavedChanges = Field(
    'hasUnsavedChanges',
    _$hasUnsavedChanges,
    opt: true,
    def: false,
  );
  static String _$locale(ArbFile v) => v.locale;
  static const Field<ArbFile, String> _f$locale = Field(
    'locale',
    _$locale,
    mode: FieldMode.member,
  );
  static String _$fileName(ArbFile v) => v.fileName;
  static const Field<ArbFile, String> _f$fileName = Field(
    'fileName',
    _$fileName,
    mode: FieldMode.member,
  );
  static List<String> _$keys(ArbFile v) => v.keys;
  static const Field<ArbFile, List<String>> _f$keys = Field(
    'keys',
    _$keys,
    mode: FieldMode.member,
  );
  static List<ArbEntry> _$entriesWithPlaceholders(ArbFile v) =>
      v.entriesWithPlaceholders;
  static const Field<ArbFile, List<ArbEntry>> _f$entriesWithPlaceholders =
      Field(
        'entriesWithPlaceholders',
        _$entriesWithPlaceholders,
        mode: FieldMode.member,
      );
  static List<ArbEntry> _$pluralEntries(ArbFile v) => v.pluralEntries;
  static const Field<ArbFile, List<ArbEntry>> _f$pluralEntries = Field(
    'pluralEntries',
    _$pluralEntries,
    mode: FieldMode.member,
  );
  static List<ArbEntry> _$selectEntries(ArbFile v) => v.selectEntries;
  static const Field<ArbFile, List<ArbEntry>> _f$selectEntries = Field(
    'selectEntries',
    _$selectEntries,
    mode: FieldMode.member,
  );
  static List<ArbEntry> _$invalidIcuEntries(ArbFile v) => v.invalidIcuEntries;
  static const Field<ArbFile, List<ArbEntry>> _f$invalidIcuEntries = Field(
    'invalidIcuEntries',
    _$invalidIcuEntries,
    mode: FieldMode.member,
  );

  @override
  final MappableFields<ArbFile> fields = const {
    #filePath: _f$filePath,
    #entries: _f$entries,
    #metadata: _f$metadata,
    #statistics: _f$statistics,
    #lastSaved: _f$lastSaved,
    #hasUnsavedChanges: _f$hasUnsavedChanges,
    #locale: _f$locale,
    #fileName: _f$fileName,
    #keys: _f$keys,
    #entriesWithPlaceholders: _f$entriesWithPlaceholders,
    #pluralEntries: _f$pluralEntries,
    #selectEntries: _f$selectEntries,
    #invalidIcuEntries: _f$invalidIcuEntries,
  };

  static ArbFile _instantiate(DecodingData data) {
    return ArbFile(
      filePath: data.dec(_f$filePath),
      entries: data.dec(_f$entries),
      metadata: data.dec(_f$metadata),
      statistics: data.dec(_f$statistics),
      lastSaved: data.dec(_f$lastSaved),
      hasUnsavedChanges: data.dec(_f$hasUnsavedChanges),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static ArbFile fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ArbFile>(map);
  }

  static ArbFile fromJson(String json) {
    return ensureInitialized().decodeJson<ArbFile>(json);
  }
}

mixin ArbFileMappable {
  String toJson() {
    return ArbFileMapper.ensureInitialized().encodeJson<ArbFile>(
      this as ArbFile,
    );
  }

  Map<String, dynamic> toMap() {
    return ArbFileMapper.ensureInitialized().encodeMap<ArbFile>(
      this as ArbFile,
    );
  }

  ArbFileCopyWith<ArbFile, ArbFile, ArbFile> get copyWith =>
      _ArbFileCopyWithImpl<ArbFile, ArbFile>(
        this as ArbFile,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return ArbFileMapper.ensureInitialized().stringifyValue(this as ArbFile);
  }

  @override
  bool operator ==(Object other) {
    return ArbFileMapper.ensureInitialized().equalsValue(
      this as ArbFile,
      other,
    );
  }

  @override
  int get hashCode {
    return ArbFileMapper.ensureInitialized().hashValue(this as ArbFile);
  }
}

extension ArbFileValueCopy<$R, $Out> on ObjectCopyWith<$R, ArbFile, $Out> {
  ArbFileCopyWith<$R, ArbFile, $Out> get $asArbFile =>
      $base.as((v, t, t2) => _ArbFileCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class ArbFileCopyWith<$R, $In extends ArbFile, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  MapCopyWith<$R, String, ArbEntry, ArbEntryCopyWith<$R, ArbEntry, ArbEntry>>
  get entries;
  ArbFileMetadataCopyWith<$R, ArbFileMetadata, ArbFileMetadata> get metadata;
  ArbFileStatisticsCopyWith<$R, ArbFileStatistics, ArbFileStatistics>?
  get statistics;
  $R call({
    String? filePath,
    Map<String, ArbEntry>? entries,
    ArbFileMetadata? metadata,
    ArbFileStatistics? statistics,
    DateTime? lastSaved,
    bool? hasUnsavedChanges,
  });
  ArbFileCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ArbFileCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ArbFile, $Out>
    implements ArbFileCopyWith<$R, ArbFile, $Out> {
  _ArbFileCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ArbFile> $mapper =
      ArbFileMapper.ensureInitialized();
  @override
  MapCopyWith<$R, String, ArbEntry, ArbEntryCopyWith<$R, ArbEntry, ArbEntry>>
  get entries => MapCopyWith(
    $value.entries,
    (v, t) => v.copyWith.$chain(t),
    (v) => call(entries: v),
  );
  @override
  ArbFileMetadataCopyWith<$R, ArbFileMetadata, ArbFileMetadata> get metadata =>
      $value.metadata.copyWith.$chain((v) => call(metadata: v));
  @override
  ArbFileStatisticsCopyWith<$R, ArbFileStatistics, ArbFileStatistics>?
  get statistics =>
      $value.statistics?.copyWith.$chain((v) => call(statistics: v));
  @override
  $R call({
    String? filePath,
    Map<String, ArbEntry>? entries,
    ArbFileMetadata? metadata,
    Object? statistics = $none,
    Object? lastSaved = $none,
    bool? hasUnsavedChanges,
  }) => $apply(
    FieldCopyWithData({
      if (filePath != null) #filePath: filePath,
      if (entries != null) #entries: entries,
      if (metadata != null) #metadata: metadata,
      if (statistics != $none) #statistics: statistics,
      if (lastSaved != $none) #lastSaved: lastSaved,
      if (hasUnsavedChanges != null) #hasUnsavedChanges: hasUnsavedChanges,
    }),
  );
  @override
  ArbFile $make(CopyWithData data) => ArbFile(
    filePath: data.get(#filePath, or: $value.filePath),
    entries: data.get(#entries, or: $value.entries),
    metadata: data.get(#metadata, or: $value.metadata),
    statistics: data.get(#statistics, or: $value.statistics),
    lastSaved: data.get(#lastSaved, or: $value.lastSaved),
    hasUnsavedChanges: data.get(
      #hasUnsavedChanges,
      or: $value.hasUnsavedChanges,
    ),
  );

  @override
  ArbFileCopyWith<$R2, ArbFile, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _ArbFileCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

