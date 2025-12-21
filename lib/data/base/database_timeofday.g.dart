// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database_timeofday.dart';

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const TimeOfDayDBSchema = Schema(
  name: r'TimeOfDayDB',
  id: -1450383047751763439,
  properties: {
    r'hour': PropertySchema(id: 0, name: r'hour', type: IsarType.long),
    r'minute': PropertySchema(id: 1, name: r'minute', type: IsarType.long),
  },

  estimateSize: _timeOfDayDBEstimateSize,
  serialize: _timeOfDayDBSerialize,
  deserialize: _timeOfDayDBDeserialize,
  deserializeProp: _timeOfDayDBDeserializeProp,
);

int _timeOfDayDBEstimateSize(
  TimeOfDayDB object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _timeOfDayDBSerialize(
  TimeOfDayDB object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.hour);
  writer.writeLong(offsets[1], object.minute);
}

TimeOfDayDB _timeOfDayDBDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = TimeOfDayDB();
  object.hour = reader.readLong(offsets[0]);
  object.minute = reader.readLong(offsets[1]);
  return object;
}

P _timeOfDayDBDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension TimeOfDayDBQueryFilter
    on QueryBuilder<TimeOfDayDB, TimeOfDayDB, QFilterCondition> {
  QueryBuilder<TimeOfDayDB, TimeOfDayDB, QAfterFilterCondition> hourEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'hour', value: value),
      );
    });
  }

  QueryBuilder<TimeOfDayDB, TimeOfDayDB, QAfterFilterCondition> hourGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'hour',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<TimeOfDayDB, TimeOfDayDB, QAfterFilterCondition> hourLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'hour',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<TimeOfDayDB, TimeOfDayDB, QAfterFilterCondition> hourBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'hour',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<TimeOfDayDB, TimeOfDayDB, QAfterFilterCondition> minuteEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'minute', value: value),
      );
    });
  }

  QueryBuilder<TimeOfDayDB, TimeOfDayDB, QAfterFilterCondition>
  minuteGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'minute',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<TimeOfDayDB, TimeOfDayDB, QAfterFilterCondition> minuteLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'minute',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<TimeOfDayDB, TimeOfDayDB, QAfterFilterCondition> minuteBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'minute',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }
}

extension TimeOfDayDBQueryObject
    on QueryBuilder<TimeOfDayDB, TimeOfDayDB, QFilterCondition> {}
