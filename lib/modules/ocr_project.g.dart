// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ocr_project.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetOcrProjectCollection on Isar {
  IsarCollection<OcrProject> get ocrProjects => this.collection();
}

const OcrProjectSchema = CollectionSchema(
  name: r'OcrProject',
  id: 5727851560862603018,
  properties: {
    r'Image Path': PropertySchema(
      id: 0,
      name: r'Image Path',
      type: IsarType.string,
    ),
    r'Result': PropertySchema(
      id: 1,
      name: r'Result',
      type: IsarType.string,
    ),
    r'Title': PropertySchema(
      id: 2,
      name: r'Title',
      type: IsarType.string,
    )
  },
  estimateSize: _ocrProjectEstimateSize,
  serialize: _ocrProjectSerialize,
  deserialize: _ocrProjectDeserialize,
  deserializeProp: _ocrProjectDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _ocrProjectGetId,
  getLinks: _ocrProjectGetLinks,
  attach: _ocrProjectAttach,
  version: '3.1.0+1',
);

int _ocrProjectEstimateSize(
  OcrProject object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.imagePath;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.result;
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
  return bytesCount;
}

void _ocrProjectSerialize(
  OcrProject object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.imagePath);
  writer.writeString(offsets[1], object.result);
  writer.writeString(offsets[2], object.title);
}

OcrProject _ocrProjectDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = OcrProject();
  object.imagePath = reader.readStringOrNull(offsets[0]);
  object.result = reader.readStringOrNull(offsets[1]);
  object.title = reader.readStringOrNull(offsets[2]);
  object.id = id;
  return object;
}

P _ocrProjectDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _ocrProjectGetId(OcrProject object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _ocrProjectGetLinks(OcrProject object) {
  return [];
}

void _ocrProjectAttach(IsarCollection<dynamic> col, Id id, OcrProject object) {
  object.id = id;
}

extension OcrProjectQueryWhereSort
    on QueryBuilder<OcrProject, OcrProject, QWhere> {
  QueryBuilder<OcrProject, OcrProject, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension OcrProjectQueryWhere
    on QueryBuilder<OcrProject, OcrProject, QWhereClause> {
  QueryBuilder<OcrProject, OcrProject, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<OcrProject, OcrProject, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<OcrProject, OcrProject, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<OcrProject, OcrProject, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<OcrProject, OcrProject, QAfterWhereClause> idBetween(
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

extension OcrProjectQueryFilter
    on QueryBuilder<OcrProject, OcrProject, QFilterCondition> {
  QueryBuilder<OcrProject, OcrProject, QAfterFilterCondition>
      imagePathIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'Image Path',
      ));
    });
  }

  QueryBuilder<OcrProject, OcrProject, QAfterFilterCondition>
      imagePathIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'Image Path',
      ));
    });
  }

  QueryBuilder<OcrProject, OcrProject, QAfterFilterCondition> imagePathEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'Image Path',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OcrProject, OcrProject, QAfterFilterCondition>
      imagePathGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'Image Path',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OcrProject, OcrProject, QAfterFilterCondition> imagePathLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'Image Path',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OcrProject, OcrProject, QAfterFilterCondition> imagePathBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'Image Path',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OcrProject, OcrProject, QAfterFilterCondition>
      imagePathStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'Image Path',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OcrProject, OcrProject, QAfterFilterCondition> imagePathEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'Image Path',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OcrProject, OcrProject, QAfterFilterCondition> imagePathContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'Image Path',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OcrProject, OcrProject, QAfterFilterCondition> imagePathMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'Image Path',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OcrProject, OcrProject, QAfterFilterCondition>
      imagePathIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'Image Path',
        value: '',
      ));
    });
  }

  QueryBuilder<OcrProject, OcrProject, QAfterFilterCondition>
      imagePathIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'Image Path',
        value: '',
      ));
    });
  }

  QueryBuilder<OcrProject, OcrProject, QAfterFilterCondition> resultIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'Result',
      ));
    });
  }

  QueryBuilder<OcrProject, OcrProject, QAfterFilterCondition>
      resultIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'Result',
      ));
    });
  }

  QueryBuilder<OcrProject, OcrProject, QAfterFilterCondition> resultEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'Result',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OcrProject, OcrProject, QAfterFilterCondition> resultGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'Result',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OcrProject, OcrProject, QAfterFilterCondition> resultLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'Result',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OcrProject, OcrProject, QAfterFilterCondition> resultBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'Result',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OcrProject, OcrProject, QAfterFilterCondition> resultStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'Result',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OcrProject, OcrProject, QAfterFilterCondition> resultEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'Result',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OcrProject, OcrProject, QAfterFilterCondition> resultContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'Result',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OcrProject, OcrProject, QAfterFilterCondition> resultMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'Result',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OcrProject, OcrProject, QAfterFilterCondition> resultIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'Result',
        value: '',
      ));
    });
  }

  QueryBuilder<OcrProject, OcrProject, QAfterFilterCondition>
      resultIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'Result',
        value: '',
      ));
    });
  }

  QueryBuilder<OcrProject, OcrProject, QAfterFilterCondition> titleIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'Title',
      ));
    });
  }

  QueryBuilder<OcrProject, OcrProject, QAfterFilterCondition> titleIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'Title',
      ));
    });
  }

  QueryBuilder<OcrProject, OcrProject, QAfterFilterCondition> titleEqualTo(
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

  QueryBuilder<OcrProject, OcrProject, QAfterFilterCondition> titleGreaterThan(
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

  QueryBuilder<OcrProject, OcrProject, QAfterFilterCondition> titleLessThan(
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

  QueryBuilder<OcrProject, OcrProject, QAfterFilterCondition> titleBetween(
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

  QueryBuilder<OcrProject, OcrProject, QAfterFilterCondition> titleStartsWith(
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

  QueryBuilder<OcrProject, OcrProject, QAfterFilterCondition> titleEndsWith(
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

  QueryBuilder<OcrProject, OcrProject, QAfterFilterCondition> titleContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'Title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OcrProject, OcrProject, QAfterFilterCondition> titleMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'Title',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OcrProject, OcrProject, QAfterFilterCondition> titleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'Title',
        value: '',
      ));
    });
  }

  QueryBuilder<OcrProject, OcrProject, QAfterFilterCondition>
      titleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'Title',
        value: '',
      ));
    });
  }

  QueryBuilder<OcrProject, OcrProject, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<OcrProject, OcrProject, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<OcrProject, OcrProject, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<OcrProject, OcrProject, QAfterFilterCondition> idBetween(
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

extension OcrProjectQueryObject
    on QueryBuilder<OcrProject, OcrProject, QFilterCondition> {}

extension OcrProjectQueryLinks
    on QueryBuilder<OcrProject, OcrProject, QFilterCondition> {}

extension OcrProjectQuerySortBy
    on QueryBuilder<OcrProject, OcrProject, QSortBy> {
  QueryBuilder<OcrProject, OcrProject, QAfterSortBy> sortByImagePath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Image Path', Sort.asc);
    });
  }

  QueryBuilder<OcrProject, OcrProject, QAfterSortBy> sortByImagePathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Image Path', Sort.desc);
    });
  }

  QueryBuilder<OcrProject, OcrProject, QAfterSortBy> sortByResult() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Result', Sort.asc);
    });
  }

  QueryBuilder<OcrProject, OcrProject, QAfterSortBy> sortByResultDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Result', Sort.desc);
    });
  }

  QueryBuilder<OcrProject, OcrProject, QAfterSortBy> sortByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Title', Sort.asc);
    });
  }

  QueryBuilder<OcrProject, OcrProject, QAfterSortBy> sortByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Title', Sort.desc);
    });
  }
}

extension OcrProjectQuerySortThenBy
    on QueryBuilder<OcrProject, OcrProject, QSortThenBy> {
  QueryBuilder<OcrProject, OcrProject, QAfterSortBy> thenByImagePath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Image Path', Sort.asc);
    });
  }

  QueryBuilder<OcrProject, OcrProject, QAfterSortBy> thenByImagePathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Image Path', Sort.desc);
    });
  }

  QueryBuilder<OcrProject, OcrProject, QAfterSortBy> thenByResult() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Result', Sort.asc);
    });
  }

  QueryBuilder<OcrProject, OcrProject, QAfterSortBy> thenByResultDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Result', Sort.desc);
    });
  }

  QueryBuilder<OcrProject, OcrProject, QAfterSortBy> thenByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Title', Sort.asc);
    });
  }

  QueryBuilder<OcrProject, OcrProject, QAfterSortBy> thenByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Title', Sort.desc);
    });
  }

  QueryBuilder<OcrProject, OcrProject, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<OcrProject, OcrProject, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }
}

extension OcrProjectQueryWhereDistinct
    on QueryBuilder<OcrProject, OcrProject, QDistinct> {
  QueryBuilder<OcrProject, OcrProject, QDistinct> distinctByImagePath(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'Image Path', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<OcrProject, OcrProject, QDistinct> distinctByResult(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'Result', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<OcrProject, OcrProject, QDistinct> distinctByTitle(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'Title', caseSensitive: caseSensitive);
    });
  }
}

extension OcrProjectQueryProperty
    on QueryBuilder<OcrProject, OcrProject, QQueryProperty> {
  QueryBuilder<OcrProject, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<OcrProject, String?, QQueryOperations> imagePathProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'Image Path');
    });
  }

  QueryBuilder<OcrProject, String?, QQueryOperations> resultProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'Result');
    });
  }

  QueryBuilder<OcrProject, String?, QQueryOperations> titleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'Title');
    });
  }
}
