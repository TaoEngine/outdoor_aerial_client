// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database_program.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetProgramDBCollection on Isar {
  IsarCollection<ProgramDB> get programDBs => this.collection();
}

const ProgramDBSchema = CollectionSchema(
  name: r'ProgramDB',
  id: 4327509004553568339,
  properties: {
    r'description': PropertySchema(
      id: 0,
      name: r'description',
      type: IsarType.string,
    ),
    r'end': PropertySchema(
      id: 1,
      name: r'end',
      type: IsarType.object,

      target: r'TimeOfDayDB',
    ),
    r'hosts': PropertySchema(id: 2, name: r'hosts', type: IsarType.stringList),
    r'like': PropertySchema(id: 3, name: r'like', type: IsarType.bool),
    r'name': PropertySchema(id: 4, name: r'name', type: IsarType.string),
    r'start': PropertySchema(
      id: 5,
      name: r'start',
      type: IsarType.object,

      target: r'TimeOfDayDB',
    ),
    r'status': PropertySchema(
      id: 6,
      name: r'status',
      type: IsarType.byte,
      enumMap: _ProgramDBstatusEnumValueMap,
    ),
    r'studio': PropertySchema(id: 7, name: r'studio', type: IsarType.long),
    r'type': PropertySchema(
      id: 8,
      name: r'type',
      type: IsarType.byte,
      enumMap: _ProgramDBtypeEnumValueMap,
    ),
    r'weekday': PropertySchema(
      id: 9,
      name: r'weekday',
      type: IsarType.byteList,
      enumMap: _ProgramDBweekdayEnumValueMap,
    ),
  },

  estimateSize: _programDBEstimateSize,
  serialize: _programDBSerialize,
  deserialize: _programDBDeserialize,
  deserializeProp: _programDBDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {r'TimeOfDayDB': TimeOfDayDBSchema},

  getId: _programDBGetId,
  getLinks: _programDBGetLinks,
  attach: _programDBAttach,
  version: '3.3.0',
);

int _programDBEstimateSize(
  ProgramDB object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.description;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount +=
      3 +
      TimeOfDayDBSchema.estimateSize(
        object.end,
        allOffsets[TimeOfDayDB]!,
        allOffsets,
      );
  bytesCount += 3 + object.hosts.length * 3;
  {
    for (var i = 0; i < object.hosts.length; i++) {
      final value = object.hosts[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.name.length * 3;
  bytesCount +=
      3 +
      TimeOfDayDBSchema.estimateSize(
        object.start,
        allOffsets[TimeOfDayDB]!,
        allOffsets,
      );
  bytesCount += 3 + object.weekday.length;
  return bytesCount;
}

void _programDBSerialize(
  ProgramDB object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.description);
  writer.writeObject<TimeOfDayDB>(
    offsets[1],
    allOffsets,
    TimeOfDayDBSchema.serialize,
    object.end,
  );
  writer.writeStringList(offsets[2], object.hosts);
  writer.writeBool(offsets[3], object.like);
  writer.writeString(offsets[4], object.name);
  writer.writeObject<TimeOfDayDB>(
    offsets[5],
    allOffsets,
    TimeOfDayDBSchema.serialize,
    object.start,
  );
  writer.writeByte(offsets[6], object.status.index);
  writer.writeLong(offsets[7], object.studio);
  writer.writeByte(offsets[8], object.type.index);
  writer.writeByteList(offsets[9], object.weekday.map((e) => e.index).toList());
}

ProgramDB _programDBDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ProgramDB();
  object.description = reader.readStringOrNull(offsets[0]);
  object.end =
      reader.readObjectOrNull<TimeOfDayDB>(
        offsets[1],
        TimeOfDayDBSchema.deserialize,
        allOffsets,
      ) ??
      TimeOfDayDB();
  object.hosts = reader.readStringList(offsets[2]) ?? [];
  object.id = id;
  object.like = reader.readBoolOrNull(offsets[3]);
  object.name = reader.readString(offsets[4]);
  object.start =
      reader.readObjectOrNull<TimeOfDayDB>(
        offsets[5],
        TimeOfDayDBSchema.deserialize,
        allOffsets,
      ) ??
      TimeOfDayDB();
  object.status =
      _ProgramDBstatusValueEnumMap[reader.readByteOrNull(offsets[6])] ??
      ProgramStatus.live;
  object.studio = reader.readLong(offsets[7]);
  object.type =
      _ProgramDBtypeValueEnumMap[reader.readByteOrNull(offsets[8])] ??
      ProgramType.integrate;
  object.weekday =
      reader
          .readByteList(offsets[9])
          ?.map(
            (e) => _ProgramDBweekdayValueEnumMap[e] ?? ProgramWeekday.monday,
          )
          .toList() ??
      [];
  return object;
}

P _programDBDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readObjectOrNull<TimeOfDayDB>(
                offset,
                TimeOfDayDBSchema.deserialize,
                allOffsets,
              ) ??
              TimeOfDayDB())
          as P;
    case 2:
      return (reader.readStringList(offset) ?? []) as P;
    case 3:
      return (reader.readBoolOrNull(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readObjectOrNull<TimeOfDayDB>(
                offset,
                TimeOfDayDBSchema.deserialize,
                allOffsets,
              ) ??
              TimeOfDayDB())
          as P;
    case 6:
      return (_ProgramDBstatusValueEnumMap[reader.readByteOrNull(offset)] ??
              ProgramStatus.live)
          as P;
    case 7:
      return (reader.readLong(offset)) as P;
    case 8:
      return (_ProgramDBtypeValueEnumMap[reader.readByteOrNull(offset)] ??
              ProgramType.integrate)
          as P;
    case 9:
      return (reader
                  .readByteList(offset)
                  ?.map(
                    (e) =>
                        _ProgramDBweekdayValueEnumMap[e] ??
                        ProgramWeekday.monday,
                  )
                  .toList() ??
              [])
          as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _ProgramDBstatusEnumValueMap = {'live': 0, 'replay': 1, 'suspended': 2};
const _ProgramDBstatusValueEnumMap = {
  0: ProgramStatus.live,
  1: ProgramStatus.replay,
  2: ProgramStatus.suspended,
};
const _ProgramDBtypeEnumValueMap = {
  'integrate': 0,
  'news': 1,
  'music': 2,
  'podcast': 3,
  'entertainment': 4,
  'sports': 5,
  'storytelling': 6,
  'educational': 7,
  'finance': 8,
  'health': 9,
};
const _ProgramDBtypeValueEnumMap = {
  0: ProgramType.integrate,
  1: ProgramType.news,
  2: ProgramType.music,
  3: ProgramType.podcast,
  4: ProgramType.entertainment,
  5: ProgramType.sports,
  6: ProgramType.storytelling,
  7: ProgramType.educational,
  8: ProgramType.finance,
  9: ProgramType.health,
};
const _ProgramDBweekdayEnumValueMap = {
  'monday': 0,
  'tuesday': 1,
  'wednesday': 2,
  'thursday': 3,
  'friday': 4,
  'saturday': 5,
  'sunday': 6,
};
const _ProgramDBweekdayValueEnumMap = {
  0: ProgramWeekday.monday,
  1: ProgramWeekday.tuesday,
  2: ProgramWeekday.wednesday,
  3: ProgramWeekday.thursday,
  4: ProgramWeekday.friday,
  5: ProgramWeekday.saturday,
  6: ProgramWeekday.sunday,
};

Id _programDBGetId(ProgramDB object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _programDBGetLinks(ProgramDB object) {
  return [];
}

void _programDBAttach(IsarCollection<dynamic> col, Id id, ProgramDB object) {
  object.id = id;
}

extension ProgramDBQueryWhereSort
    on QueryBuilder<ProgramDB, ProgramDB, QWhere> {
  QueryBuilder<ProgramDB, ProgramDB, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ProgramDBQueryWhere
    on QueryBuilder<ProgramDB, ProgramDB, QWhereClause> {
  QueryBuilder<ProgramDB, ProgramDB, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<ProgramDB, ProgramDB, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<ProgramDB, ProgramDB, QAfterWhereClause> idGreaterThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<ProgramDB, ProgramDB, QAfterWhereClause> idLessThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<ProgramDB, ProgramDB, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.between(
          lower: lowerId,
          includeLower: includeLower,
          upper: upperId,
          includeUpper: includeUpper,
        ),
      );
    });
  }
}

extension ProgramDBQueryFilter
    on QueryBuilder<ProgramDB, ProgramDB, QFilterCondition> {
  QueryBuilder<ProgramDB, ProgramDB, QAfterFilterCondition>
  descriptionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'description'),
      );
    });
  }

  QueryBuilder<ProgramDB, ProgramDB, QAfterFilterCondition>
  descriptionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'description'),
      );
    });
  }

  QueryBuilder<ProgramDB, ProgramDB, QAfterFilterCondition> descriptionEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'description',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ProgramDB, ProgramDB, QAfterFilterCondition>
  descriptionGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'description',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ProgramDB, ProgramDB, QAfterFilterCondition> descriptionLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'description',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ProgramDB, ProgramDB, QAfterFilterCondition> descriptionBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'description',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ProgramDB, ProgramDB, QAfterFilterCondition>
  descriptionStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'description',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ProgramDB, ProgramDB, QAfterFilterCondition> descriptionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'description',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ProgramDB, ProgramDB, QAfterFilterCondition> descriptionContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'description',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ProgramDB, ProgramDB, QAfterFilterCondition> descriptionMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'description',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ProgramDB, ProgramDB, QAfterFilterCondition>
  descriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'description', value: ''),
      );
    });
  }

  QueryBuilder<ProgramDB, ProgramDB, QAfterFilterCondition>
  descriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'description', value: ''),
      );
    });
  }

  QueryBuilder<ProgramDB, ProgramDB, QAfterFilterCondition> hostsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'hosts',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ProgramDB, ProgramDB, QAfterFilterCondition>
  hostsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'hosts',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ProgramDB, ProgramDB, QAfterFilterCondition>
  hostsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'hosts',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ProgramDB, ProgramDB, QAfterFilterCondition> hostsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'hosts',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ProgramDB, ProgramDB, QAfterFilterCondition>
  hostsElementStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'hosts',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ProgramDB, ProgramDB, QAfterFilterCondition>
  hostsElementEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'hosts',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ProgramDB, ProgramDB, QAfterFilterCondition>
  hostsElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'hosts',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ProgramDB, ProgramDB, QAfterFilterCondition> hostsElementMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'hosts',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ProgramDB, ProgramDB, QAfterFilterCondition>
  hostsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'hosts', value: ''),
      );
    });
  }

  QueryBuilder<ProgramDB, ProgramDB, QAfterFilterCondition>
  hostsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'hosts', value: ''),
      );
    });
  }

  QueryBuilder<ProgramDB, ProgramDB, QAfterFilterCondition> hostsLengthEqualTo(
    int length,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'hosts', length, true, length, true);
    });
  }

  QueryBuilder<ProgramDB, ProgramDB, QAfterFilterCondition> hostsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'hosts', 0, true, 0, true);
    });
  }

  QueryBuilder<ProgramDB, ProgramDB, QAfterFilterCondition> hostsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'hosts', 0, false, 999999, true);
    });
  }

  QueryBuilder<ProgramDB, ProgramDB, QAfterFilterCondition> hostsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'hosts', 0, true, length, include);
    });
  }

  QueryBuilder<ProgramDB, ProgramDB, QAfterFilterCondition>
  hostsLengthGreaterThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'hosts', length, include, 999999, true);
    });
  }

  QueryBuilder<ProgramDB, ProgramDB, QAfterFilterCondition> hostsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'hosts',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<ProgramDB, ProgramDB, QAfterFilterCondition> idEqualTo(
    Id value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<ProgramDB, ProgramDB, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'id',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<ProgramDB, ProgramDB, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'id',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<ProgramDB, ProgramDB, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'id',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<ProgramDB, ProgramDB, QAfterFilterCondition> likeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'like'),
      );
    });
  }

  QueryBuilder<ProgramDB, ProgramDB, QAfterFilterCondition> likeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'like'),
      );
    });
  }

  QueryBuilder<ProgramDB, ProgramDB, QAfterFilterCondition> likeEqualTo(
    bool? value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'like', value: value),
      );
    });
  }

  QueryBuilder<ProgramDB, ProgramDB, QAfterFilterCondition> nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'name',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ProgramDB, ProgramDB, QAfterFilterCondition> nameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'name',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ProgramDB, ProgramDB, QAfterFilterCondition> nameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'name',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ProgramDB, ProgramDB, QAfterFilterCondition> nameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'name',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ProgramDB, ProgramDB, QAfterFilterCondition> nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'name',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ProgramDB, ProgramDB, QAfterFilterCondition> nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'name',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ProgramDB, ProgramDB, QAfterFilterCondition> nameContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'name',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ProgramDB, ProgramDB, QAfterFilterCondition> nameMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'name',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ProgramDB, ProgramDB, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'name', value: ''),
      );
    });
  }

  QueryBuilder<ProgramDB, ProgramDB, QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'name', value: ''),
      );
    });
  }

  QueryBuilder<ProgramDB, ProgramDB, QAfterFilterCondition> statusEqualTo(
    ProgramStatus value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'status', value: value),
      );
    });
  }

  QueryBuilder<ProgramDB, ProgramDB, QAfterFilterCondition> statusGreaterThan(
    ProgramStatus value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'status',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<ProgramDB, ProgramDB, QAfterFilterCondition> statusLessThan(
    ProgramStatus value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'status',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<ProgramDB, ProgramDB, QAfterFilterCondition> statusBetween(
    ProgramStatus lower,
    ProgramStatus upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'status',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<ProgramDB, ProgramDB, QAfterFilterCondition> studioEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'studio', value: value),
      );
    });
  }

  QueryBuilder<ProgramDB, ProgramDB, QAfterFilterCondition> studioGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'studio',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<ProgramDB, ProgramDB, QAfterFilterCondition> studioLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'studio',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<ProgramDB, ProgramDB, QAfterFilterCondition> studioBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'studio',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<ProgramDB, ProgramDB, QAfterFilterCondition> typeEqualTo(
    ProgramType value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'type', value: value),
      );
    });
  }

  QueryBuilder<ProgramDB, ProgramDB, QAfterFilterCondition> typeGreaterThan(
    ProgramType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'type',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<ProgramDB, ProgramDB, QAfterFilterCondition> typeLessThan(
    ProgramType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'type',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<ProgramDB, ProgramDB, QAfterFilterCondition> typeBetween(
    ProgramType lower,
    ProgramType upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'type',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<ProgramDB, ProgramDB, QAfterFilterCondition>
  weekdayElementEqualTo(ProgramWeekday value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'weekday', value: value),
      );
    });
  }

  QueryBuilder<ProgramDB, ProgramDB, QAfterFilterCondition>
  weekdayElementGreaterThan(ProgramWeekday value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'weekday',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<ProgramDB, ProgramDB, QAfterFilterCondition>
  weekdayElementLessThan(ProgramWeekday value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'weekday',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<ProgramDB, ProgramDB, QAfterFilterCondition>
  weekdayElementBetween(
    ProgramWeekday lower,
    ProgramWeekday upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'weekday',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<ProgramDB, ProgramDB, QAfterFilterCondition>
  weekdayLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'weekday', length, true, length, true);
    });
  }

  QueryBuilder<ProgramDB, ProgramDB, QAfterFilterCondition> weekdayIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'weekday', 0, true, 0, true);
    });
  }

  QueryBuilder<ProgramDB, ProgramDB, QAfterFilterCondition>
  weekdayIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'weekday', 0, false, 999999, true);
    });
  }

  QueryBuilder<ProgramDB, ProgramDB, QAfterFilterCondition>
  weekdayLengthLessThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'weekday', 0, true, length, include);
    });
  }

  QueryBuilder<ProgramDB, ProgramDB, QAfterFilterCondition>
  weekdayLengthGreaterThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'weekday', length, include, 999999, true);
    });
  }

  QueryBuilder<ProgramDB, ProgramDB, QAfterFilterCondition>
  weekdayLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'weekday',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }
}

extension ProgramDBQueryObject
    on QueryBuilder<ProgramDB, ProgramDB, QFilterCondition> {
  QueryBuilder<ProgramDB, ProgramDB, QAfterFilterCondition> end(
    FilterQuery<TimeOfDayDB> q,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'end');
    });
  }

  QueryBuilder<ProgramDB, ProgramDB, QAfterFilterCondition> start(
    FilterQuery<TimeOfDayDB> q,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'start');
    });
  }
}

extension ProgramDBQueryLinks
    on QueryBuilder<ProgramDB, ProgramDB, QFilterCondition> {}

extension ProgramDBQuerySortBy on QueryBuilder<ProgramDB, ProgramDB, QSortBy> {
  QueryBuilder<ProgramDB, ProgramDB, QAfterSortBy> sortByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<ProgramDB, ProgramDB, QAfterSortBy> sortByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<ProgramDB, ProgramDB, QAfterSortBy> sortByLike() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'like', Sort.asc);
    });
  }

  QueryBuilder<ProgramDB, ProgramDB, QAfterSortBy> sortByLikeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'like', Sort.desc);
    });
  }

  QueryBuilder<ProgramDB, ProgramDB, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<ProgramDB, ProgramDB, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<ProgramDB, ProgramDB, QAfterSortBy> sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<ProgramDB, ProgramDB, QAfterSortBy> sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<ProgramDB, ProgramDB, QAfterSortBy> sortByStudio() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'studio', Sort.asc);
    });
  }

  QueryBuilder<ProgramDB, ProgramDB, QAfterSortBy> sortByStudioDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'studio', Sort.desc);
    });
  }

  QueryBuilder<ProgramDB, ProgramDB, QAfterSortBy> sortByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<ProgramDB, ProgramDB, QAfterSortBy> sortByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }
}

extension ProgramDBQuerySortThenBy
    on QueryBuilder<ProgramDB, ProgramDB, QSortThenBy> {
  QueryBuilder<ProgramDB, ProgramDB, QAfterSortBy> thenByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<ProgramDB, ProgramDB, QAfterSortBy> thenByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<ProgramDB, ProgramDB, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<ProgramDB, ProgramDB, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<ProgramDB, ProgramDB, QAfterSortBy> thenByLike() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'like', Sort.asc);
    });
  }

  QueryBuilder<ProgramDB, ProgramDB, QAfterSortBy> thenByLikeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'like', Sort.desc);
    });
  }

  QueryBuilder<ProgramDB, ProgramDB, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<ProgramDB, ProgramDB, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<ProgramDB, ProgramDB, QAfterSortBy> thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<ProgramDB, ProgramDB, QAfterSortBy> thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<ProgramDB, ProgramDB, QAfterSortBy> thenByStudio() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'studio', Sort.asc);
    });
  }

  QueryBuilder<ProgramDB, ProgramDB, QAfterSortBy> thenByStudioDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'studio', Sort.desc);
    });
  }

  QueryBuilder<ProgramDB, ProgramDB, QAfterSortBy> thenByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<ProgramDB, ProgramDB, QAfterSortBy> thenByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }
}

extension ProgramDBQueryWhereDistinct
    on QueryBuilder<ProgramDB, ProgramDB, QDistinct> {
  QueryBuilder<ProgramDB, ProgramDB, QDistinct> distinctByDescription({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'description', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ProgramDB, ProgramDB, QDistinct> distinctByHosts() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hosts');
    });
  }

  QueryBuilder<ProgramDB, ProgramDB, QDistinct> distinctByLike() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'like');
    });
  }

  QueryBuilder<ProgramDB, ProgramDB, QDistinct> distinctByName({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ProgramDB, ProgramDB, QDistinct> distinctByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status');
    });
  }

  QueryBuilder<ProgramDB, ProgramDB, QDistinct> distinctByStudio() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'studio');
    });
  }

  QueryBuilder<ProgramDB, ProgramDB, QDistinct> distinctByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'type');
    });
  }

  QueryBuilder<ProgramDB, ProgramDB, QDistinct> distinctByWeekday() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'weekday');
    });
  }
}

extension ProgramDBQueryProperty
    on QueryBuilder<ProgramDB, ProgramDB, QQueryProperty> {
  QueryBuilder<ProgramDB, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<ProgramDB, String?, QQueryOperations> descriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'description');
    });
  }

  QueryBuilder<ProgramDB, TimeOfDayDB, QQueryOperations> endProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'end');
    });
  }

  QueryBuilder<ProgramDB, List<String>, QQueryOperations> hostsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hosts');
    });
  }

  QueryBuilder<ProgramDB, bool?, QQueryOperations> likeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'like');
    });
  }

  QueryBuilder<ProgramDB, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<ProgramDB, TimeOfDayDB, QQueryOperations> startProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'start');
    });
  }

  QueryBuilder<ProgramDB, ProgramStatus, QQueryOperations> statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }

  QueryBuilder<ProgramDB, int, QQueryOperations> studioProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'studio');
    });
  }

  QueryBuilder<ProgramDB, ProgramType, QQueryOperations> typeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'type');
    });
  }

  QueryBuilder<ProgramDB, List<ProgramWeekday>, QQueryOperations>
  weekdayProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'weekday');
    });
  }
}
