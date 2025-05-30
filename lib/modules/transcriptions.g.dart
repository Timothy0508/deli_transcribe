// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transcriptions.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetTranscriptionsCollection on Isar {
  IsarCollection<Transcriptions> get transcriptions => this.collection();
}

const TranscriptionsSchema = CollectionSchema(
  name: r'Transcriptions',
  id: -4008012052870429867,
  properties: {
    r'File Path': PropertySchema(
      id: 0,
      name: r'File Path',
      type: IsarType.string,
    ),
    r'Is Video': PropertySchema(
      id: 1,
      name: r'Is Video',
      type: IsarType.bool,
    ),
    r'Title': PropertySchema(
      id: 2,
      name: r'Title',
      type: IsarType.string,
    ),
    r'Transcription': PropertySchema(
      id: 3,
      name: r'Transcription',
      type: IsarType.string,
    )
  },
  estimateSize: _transcriptionsEstimateSize,
  serialize: _transcriptionsSerialize,
  deserialize: _transcriptionsDeserialize,
  deserializeProp: _transcriptionsDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _transcriptionsGetId,
  getLinks: _transcriptionsGetLinks,
  attach: _transcriptionsAttach,
  version: '3.1.0+1',
);

int _transcriptionsEstimateSize(
  Transcriptions object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.filePath;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.title;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.transcription;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _transcriptionsSerialize(
  Transcriptions object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.filePath);
  writer.writeBool(offsets[1], object.isVideo);
  writer.writeString(offsets[2], object.title);
  writer.writeString(offsets[3], object.transcription);
}

Transcriptions _transcriptionsDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Transcriptions();
  object.filePath = reader.readStringOrNull(offsets[0]);
  object.isVideo = reader.readBoolOrNull(offsets[1]);
  object.title = reader.readStringOrNull(offsets[2]);
  object.transcription = reader.readStringOrNull(offsets[3]);
  object.id = id;
  return object;
}

P _transcriptionsDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readBoolOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _transcriptionsGetId(Transcriptions object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _transcriptionsGetLinks(Transcriptions object) {
  return [];
}

void _transcriptionsAttach(
    IsarCollection<dynamic> col, Id id, Transcriptions object) {
  object.id = id;
}

extension TranscriptionsQueryWhereSort
    on QueryBuilder<Transcriptions, Transcriptions, QWhere> {
  QueryBuilder<Transcriptions, Transcriptions, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension TranscriptionsQueryWhere
    on QueryBuilder<Transcriptions, Transcriptions, QWhereClause> {
  QueryBuilder<Transcriptions, Transcriptions, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Transcriptions, Transcriptions, QAfterWhereClause> idNotEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<Transcriptions, Transcriptions, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Transcriptions, Transcriptions, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Transcriptions, Transcriptions, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension TranscriptionsQueryFilter
    on QueryBuilder<Transcriptions, Transcriptions, QFilterCondition> {
  QueryBuilder<Transcriptions, Transcriptions, QAfterFilterCondition>
      filePathIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'File Path',
      ));
    });
  }

  QueryBuilder<Transcriptions, Transcriptions, QAfterFilterCondition>
      filePathIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'File Path',
      ));
    });
  }

  QueryBuilder<Transcriptions, Transcriptions, QAfterFilterCondition>
      filePathEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'File Path',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Transcriptions, Transcriptions, QAfterFilterCondition>
      filePathGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'File Path',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Transcriptions, Transcriptions, QAfterFilterCondition>
      filePathLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'File Path',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Transcriptions, Transcriptions, QAfterFilterCondition>
      filePathBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'File Path',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Transcriptions, Transcriptions, QAfterFilterCondition>
      filePathStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'File Path',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Transcriptions, Transcriptions, QAfterFilterCondition>
      filePathEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'File Path',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Transcriptions, Transcriptions, QAfterFilterCondition>
      filePathContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'File Path',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Transcriptions, Transcriptions, QAfterFilterCondition>
      filePathMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'File Path',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Transcriptions, Transcriptions, QAfterFilterCondition>
      filePathIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'File Path',
        value: '',
      ));
    });
  }

  QueryBuilder<Transcriptions, Transcriptions, QAfterFilterCondition>
      filePathIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'File Path',
        value: '',
      ));
    });
  }

  QueryBuilder<Transcriptions, Transcriptions, QAfterFilterCondition>
      isVideoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'Is Video',
      ));
    });
  }

  QueryBuilder<Transcriptions, Transcriptions, QAfterFilterCondition>
      isVideoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'Is Video',
      ));
    });
  }

  QueryBuilder<Transcriptions, Transcriptions, QAfterFilterCondition>
      isVideoEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'Is Video',
        value: value,
      ));
    });
  }

  QueryBuilder<Transcriptions, Transcriptions, QAfterFilterCondition>
      titleIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'Title',
      ));
    });
  }

  QueryBuilder<Transcriptions, Transcriptions, QAfterFilterCondition>
      titleIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'Title',
      ));
    });
  }

  QueryBuilder<Transcriptions, Transcriptions, QAfterFilterCondition>
      titleEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'Title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Transcriptions, Transcriptions, QAfterFilterCondition>
      titleGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'Title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Transcriptions, Transcriptions, QAfterFilterCondition>
      titleLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'Title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Transcriptions, Transcriptions, QAfterFilterCondition>
      titleBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'Title',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Transcriptions, Transcriptions, QAfterFilterCondition>
      titleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'Title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Transcriptions, Transcriptions, QAfterFilterCondition>
      titleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'Title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Transcriptions, Transcriptions, QAfterFilterCondition>
      titleContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'Title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Transcriptions, Transcriptions, QAfterFilterCondition>
      titleMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'Title',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Transcriptions, Transcriptions, QAfterFilterCondition>
      titleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'Title',
        value: '',
      ));
    });
  }

  QueryBuilder<Transcriptions, Transcriptions, QAfterFilterCondition>
      titleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'Title',
        value: '',
      ));
    });
  }

  QueryBuilder<Transcriptions, Transcriptions, QAfterFilterCondition>
      transcriptionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'Transcription',
      ));
    });
  }

  QueryBuilder<Transcriptions, Transcriptions, QAfterFilterCondition>
      transcriptionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'Transcription',
      ));
    });
  }

  QueryBuilder<Transcriptions, Transcriptions, QAfterFilterCondition>
      transcriptionEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'Transcription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Transcriptions, Transcriptions, QAfterFilterCondition>
      transcriptionGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'Transcription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Transcriptions, Transcriptions, QAfterFilterCondition>
      transcriptionLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'Transcription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Transcriptions, Transcriptions, QAfterFilterCondition>
      transcriptionBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'Transcription',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Transcriptions, Transcriptions, QAfterFilterCondition>
      transcriptionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'Transcription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Transcriptions, Transcriptions, QAfterFilterCondition>
      transcriptionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'Transcription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Transcriptions, Transcriptions, QAfterFilterCondition>
      transcriptionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'Transcription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Transcriptions, Transcriptions, QAfterFilterCondition>
      transcriptionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'Transcription',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Transcriptions, Transcriptions, QAfterFilterCondition>
      transcriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'Transcription',
        value: '',
      ));
    });
  }

  QueryBuilder<Transcriptions, Transcriptions, QAfterFilterCondition>
      transcriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'Transcription',
        value: '',
      ));
    });
  }

  QueryBuilder<Transcriptions, Transcriptions, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Transcriptions, Transcriptions, QAfterFilterCondition>
      idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Transcriptions, Transcriptions, QAfterFilterCondition>
      idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Transcriptions, Transcriptions, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension TranscriptionsQueryObject
    on QueryBuilder<Transcriptions, Transcriptions, QFilterCondition> {}

extension TranscriptionsQueryLinks
    on QueryBuilder<Transcriptions, Transcriptions, QFilterCondition> {}

extension TranscriptionsQuerySortBy
    on QueryBuilder<Transcriptions, Transcriptions, QSortBy> {
  QueryBuilder<Transcriptions, Transcriptions, QAfterSortBy> sortByFilePath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'File Path', Sort.asc);
    });
  }

  QueryBuilder<Transcriptions, Transcriptions, QAfterSortBy>
      sortByFilePathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'File Path', Sort.desc);
    });
  }

  QueryBuilder<Transcriptions, Transcriptions, QAfterSortBy> sortByIsVideo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Is Video', Sort.asc);
    });
  }

  QueryBuilder<Transcriptions, Transcriptions, QAfterSortBy>
      sortByIsVideoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Is Video', Sort.desc);
    });
  }

  QueryBuilder<Transcriptions, Transcriptions, QAfterSortBy> sortByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Title', Sort.asc);
    });
  }

  QueryBuilder<Transcriptions, Transcriptions, QAfterSortBy> sortByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Title', Sort.desc);
    });
  }

  QueryBuilder<Transcriptions, Transcriptions, QAfterSortBy>
      sortByTranscription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Transcription', Sort.asc);
    });
  }

  QueryBuilder<Transcriptions, Transcriptions, QAfterSortBy>
      sortByTranscriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Transcription', Sort.desc);
    });
  }
}

extension TranscriptionsQuerySortThenBy
    on QueryBuilder<Transcriptions, Transcriptions, QSortThenBy> {
  QueryBuilder<Transcriptions, Transcriptions, QAfterSortBy> thenByFilePath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'File Path', Sort.asc);
    });
  }

  QueryBuilder<Transcriptions, Transcriptions, QAfterSortBy>
      thenByFilePathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'File Path', Sort.desc);
    });
  }

  QueryBuilder<Transcriptions, Transcriptions, QAfterSortBy> thenByIsVideo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Is Video', Sort.asc);
    });
  }

  QueryBuilder<Transcriptions, Transcriptions, QAfterSortBy>
      thenByIsVideoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Is Video', Sort.desc);
    });
  }

  QueryBuilder<Transcriptions, Transcriptions, QAfterSortBy> thenByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Title', Sort.asc);
    });
  }

  QueryBuilder<Transcriptions, Transcriptions, QAfterSortBy> thenByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Title', Sort.desc);
    });
  }

  QueryBuilder<Transcriptions, Transcriptions, QAfterSortBy>
      thenByTranscription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Transcription', Sort.asc);
    });
  }

  QueryBuilder<Transcriptions, Transcriptions, QAfterSortBy>
      thenByTranscriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Transcription', Sort.desc);
    });
  }

  QueryBuilder<Transcriptions, Transcriptions, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Transcriptions, Transcriptions, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }
}

extension TranscriptionsQueryWhereDistinct
    on QueryBuilder<Transcriptions, Transcriptions, QDistinct> {
  QueryBuilder<Transcriptions, Transcriptions, QDistinct> distinctByFilePath(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'File Path', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Transcriptions, Transcriptions, QDistinct> distinctByIsVideo() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'Is Video');
    });
  }

  QueryBuilder<Transcriptions, Transcriptions, QDistinct> distinctByTitle(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'Title', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Transcriptions, Transcriptions, QDistinct>
      distinctByTranscription({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'Transcription',
          caseSensitive: caseSensitive);
    });
  }
}

extension TranscriptionsQueryProperty
    on QueryBuilder<Transcriptions, Transcriptions, QQueryProperty> {
  QueryBuilder<Transcriptions, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Transcriptions, String?, QQueryOperations> filePathProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'File Path');
    });
  }

  QueryBuilder<Transcriptions, bool?, QQueryOperations> isVideoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'Is Video');
    });
  }

  QueryBuilder<Transcriptions, String?, QQueryOperations> titleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'Title');
    });
  }

  QueryBuilder<Transcriptions, String?, QQueryOperations>
      transcriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'Transcription');
    });
  }
}
