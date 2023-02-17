// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'tokobi_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TokobiModel _$TokobiModelFromJson(Map<String, dynamic> json) {
  return _TokobiModel.fromJson(json);
}

/// @nodoc
mixin _$TokobiModel {
  @JsonKey(name: 'Date', disallowNullValue: false)
  DateTime? get tokobi => throw _privateConstructorUsedError;
  @JsonKey(name: 'YobiCd', disallowNullValue: false)
  String? get yobiCd => throw _privateConstructorUsedError;
  @JsonKey(name: 'WeekName', disallowNullValue: false)
  String? get weekName => throw _privateConstructorUsedError;
  @JsonKey(name: 'Jigen', disallowNullValue: false)
  int? get jigen => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsToday', disallowNullValue: false)
  bool? get isToday => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsEditable', disallowNullValue: false)
  bool? get isEditable => throw _privateConstructorUsedError;
  @JsonKey(name: 'StampedCount', disallowNullValue: false)
  int? get stampedCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'TotalCount', disallowNullValue: false)
  int? get totalCount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TokobiModelCopyWith<TokobiModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TokobiModelCopyWith<$Res> {
  factory $TokobiModelCopyWith(
          TokobiModel value, $Res Function(TokobiModel) then) =
      _$TokobiModelCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'Date', disallowNullValue: false)
          DateTime? tokobi,
      @JsonKey(name: 'YobiCd', disallowNullValue: false)
          String? yobiCd,
      @JsonKey(name: 'WeekName', disallowNullValue: false)
          String? weekName,
      @JsonKey(name: 'Jigen', disallowNullValue: false)
          int? jigen,
      @JsonKey(name: 'IsToday', disallowNullValue: false)
          bool? isToday,
      @JsonKey(name: 'IsEditable', disallowNullValue: false)
          bool? isEditable,
      @JsonKey(name: 'StampedCount', disallowNullValue: false)
          int? stampedCount,
      @JsonKey(name: 'TotalCount', disallowNullValue: false)
          int? totalCount});
}

/// @nodoc
class _$TokobiModelCopyWithImpl<$Res> implements $TokobiModelCopyWith<$Res> {
  _$TokobiModelCopyWithImpl(this._value, this._then);

  final TokobiModel _value;
  // ignore: unused_field
  final $Res Function(TokobiModel) _then;

  @override
  $Res call({
    Object? tokobi = freezed,
    Object? yobiCd = freezed,
    Object? weekName = freezed,
    Object? jigen = freezed,
    Object? isToday = freezed,
    Object? isEditable = freezed,
    Object? stampedCount = freezed,
    Object? totalCount = freezed,
  }) {
    return _then(_value.copyWith(
      tokobi: tokobi == freezed
          ? _value.tokobi
          : tokobi // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      yobiCd: yobiCd == freezed
          ? _value.yobiCd
          : yobiCd // ignore: cast_nullable_to_non_nullable
              as String?,
      weekName: weekName == freezed
          ? _value.weekName
          : weekName // ignore: cast_nullable_to_non_nullable
              as String?,
      jigen: jigen == freezed
          ? _value.jigen
          : jigen // ignore: cast_nullable_to_non_nullable
              as int?,
      isToday: isToday == freezed
          ? _value.isToday
          : isToday // ignore: cast_nullable_to_non_nullable
              as bool?,
      isEditable: isEditable == freezed
          ? _value.isEditable
          : isEditable // ignore: cast_nullable_to_non_nullable
              as bool?,
      stampedCount: stampedCount == freezed
          ? _value.stampedCount
          : stampedCount // ignore: cast_nullable_to_non_nullable
              as int?,
      totalCount: totalCount == freezed
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
abstract class _$$_TokobiModelCopyWith<$Res>
    implements $TokobiModelCopyWith<$Res> {
  factory _$$_TokobiModelCopyWith(
          _$_TokobiModel value, $Res Function(_$_TokobiModel) then) =
      __$$_TokobiModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'Date', disallowNullValue: false)
          DateTime? tokobi,
      @JsonKey(name: 'YobiCd', disallowNullValue: false)
          String? yobiCd,
      @JsonKey(name: 'WeekName', disallowNullValue: false)
          String? weekName,
      @JsonKey(name: 'Jigen', disallowNullValue: false)
          int? jigen,
      @JsonKey(name: 'IsToday', disallowNullValue: false)
          bool? isToday,
      @JsonKey(name: 'IsEditable', disallowNullValue: false)
          bool? isEditable,
      @JsonKey(name: 'StampedCount', disallowNullValue: false)
          int? stampedCount,
      @JsonKey(name: 'TotalCount', disallowNullValue: false)
          int? totalCount});
}

/// @nodoc
class __$$_TokobiModelCopyWithImpl<$Res> extends _$TokobiModelCopyWithImpl<$Res>
    implements _$$_TokobiModelCopyWith<$Res> {
  __$$_TokobiModelCopyWithImpl(
      _$_TokobiModel _value, $Res Function(_$_TokobiModel) _then)
      : super(_value, (v) => _then(v as _$_TokobiModel));

  @override
  _$_TokobiModel get _value => super._value as _$_TokobiModel;

  @override
  $Res call({
    Object? tokobi = freezed,
    Object? yobiCd = freezed,
    Object? weekName = freezed,
    Object? jigen = freezed,
    Object? isToday = freezed,
    Object? isEditable = freezed,
    Object? stampedCount = freezed,
    Object? totalCount = freezed,
  }) {
    return _then(_$_TokobiModel(
      tokobi: tokobi == freezed
          ? _value.tokobi
          : tokobi // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      yobiCd: yobiCd == freezed
          ? _value.yobiCd
          : yobiCd // ignore: cast_nullable_to_non_nullable
              as String?,
      weekName: weekName == freezed
          ? _value.weekName
          : weekName // ignore: cast_nullable_to_non_nullable
              as String?,
      jigen: jigen == freezed
          ? _value.jigen
          : jigen // ignore: cast_nullable_to_non_nullable
              as int?,
      isToday: isToday == freezed
          ? _value.isToday
          : isToday // ignore: cast_nullable_to_non_nullable
              as bool?,
      isEditable: isEditable == freezed
          ? _value.isEditable
          : isEditable // ignore: cast_nullable_to_non_nullable
              as bool?,
      stampedCount: stampedCount == freezed
          ? _value.stampedCount
          : stampedCount // ignore: cast_nullable_to_non_nullable
              as int?,
      totalCount: totalCount == freezed
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TokobiModel extends _TokobiModel {
  const _$_TokobiModel(
      {@JsonKey(name: 'Date', disallowNullValue: false)
          this.tokobi,
      @JsonKey(name: 'YobiCd', disallowNullValue: false)
          this.yobiCd,
      @JsonKey(name: 'WeekName', disallowNullValue: false)
          this.weekName,
      @JsonKey(name: 'Jigen', disallowNullValue: false)
          this.jigen,
      @JsonKey(name: 'IsToday', disallowNullValue: false)
          this.isToday,
      @JsonKey(name: 'IsEditable', disallowNullValue: false)
          this.isEditable,
      @JsonKey(name: 'StampedCount', disallowNullValue: false)
          this.stampedCount,
      @JsonKey(name: 'TotalCount', disallowNullValue: false)
          this.totalCount})
      : super._();

  factory _$_TokobiModel.fromJson(Map<String, dynamic> json) =>
      _$$_TokobiModelFromJson(json);

  @override
  @JsonKey(name: 'Date', disallowNullValue: false)
  final DateTime? tokobi;
  @override
  @JsonKey(name: 'YobiCd', disallowNullValue: false)
  final String? yobiCd;
  @override
  @JsonKey(name: 'WeekName', disallowNullValue: false)
  final String? weekName;
  @override
  @JsonKey(name: 'Jigen', disallowNullValue: false)
  final int? jigen;
  @override
  @JsonKey(name: 'IsToday', disallowNullValue: false)
  final bool? isToday;
  @override
  @JsonKey(name: 'IsEditable', disallowNullValue: false)
  final bool? isEditable;
  @override
  @JsonKey(name: 'StampedCount', disallowNullValue: false)
  final int? stampedCount;
  @override
  @JsonKey(name: 'TotalCount', disallowNullValue: false)
  final int? totalCount;

  @override
  String toString() {
    return 'TokobiModel(tokobi: $tokobi, yobiCd: $yobiCd, weekName: $weekName, jigen: $jigen, isToday: $isToday, isEditable: $isEditable, stampedCount: $stampedCount, totalCount: $totalCount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TokobiModel &&
            const DeepCollectionEquality().equals(other.tokobi, tokobi) &&
            const DeepCollectionEquality().equals(other.yobiCd, yobiCd) &&
            const DeepCollectionEquality().equals(other.weekName, weekName) &&
            const DeepCollectionEquality().equals(other.jigen, jigen) &&
            const DeepCollectionEquality().equals(other.isToday, isToday) &&
            const DeepCollectionEquality()
                .equals(other.isEditable, isEditable) &&
            const DeepCollectionEquality()
                .equals(other.stampedCount, stampedCount) &&
            const DeepCollectionEquality()
                .equals(other.totalCount, totalCount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(tokobi),
      const DeepCollectionEquality().hash(yobiCd),
      const DeepCollectionEquality().hash(weekName),
      const DeepCollectionEquality().hash(jigen),
      const DeepCollectionEquality().hash(isToday),
      const DeepCollectionEquality().hash(isEditable),
      const DeepCollectionEquality().hash(stampedCount),
      const DeepCollectionEquality().hash(totalCount));

  @JsonKey(ignore: true)
  @override
  _$$_TokobiModelCopyWith<_$_TokobiModel> get copyWith =>
      __$$_TokobiModelCopyWithImpl<_$_TokobiModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TokobiModelToJson(
      this,
    );
  }
}

abstract class _TokobiModel extends TokobiModel {
  const factory _TokobiModel(
      {@JsonKey(name: 'Date', disallowNullValue: false)
          final DateTime? tokobi,
      @JsonKey(name: 'YobiCd', disallowNullValue: false)
          final String? yobiCd,
      @JsonKey(name: 'WeekName', disallowNullValue: false)
          final String? weekName,
      @JsonKey(name: 'Jigen', disallowNullValue: false)
          final int? jigen,
      @JsonKey(name: 'IsToday', disallowNullValue: false)
          final bool? isToday,
      @JsonKey(name: 'IsEditable', disallowNullValue: false)
          final bool? isEditable,
      @JsonKey(name: 'StampedCount', disallowNullValue: false)
          final int? stampedCount,
      @JsonKey(name: 'TotalCount', disallowNullValue: false)
          final int? totalCount}) = _$_TokobiModel;
  const _TokobiModel._() : super._();

  factory _TokobiModel.fromJson(Map<String, dynamic> json) =
      _$_TokobiModel.fromJson;

  @override
  @JsonKey(name: 'Date', disallowNullValue: false)
  DateTime? get tokobi;
  @override
  @JsonKey(name: 'YobiCd', disallowNullValue: false)
  String? get yobiCd;
  @override
  @JsonKey(name: 'WeekName', disallowNullValue: false)
  String? get weekName;
  @override
  @JsonKey(name: 'Jigen', disallowNullValue: false)
  int? get jigen;
  @override
  @JsonKey(name: 'IsToday', disallowNullValue: false)
  bool? get isToday;
  @override
  @JsonKey(name: 'IsEditable', disallowNullValue: false)
  bool? get isEditable;
  @override
  @JsonKey(name: 'StampedCount', disallowNullValue: false)
  int? get stampedCount;
  @override
  @JsonKey(name: 'TotalCount', disallowNullValue: false)
  int? get totalCount;
  @override
  @JsonKey(ignore: true)
  _$$_TokobiModelCopyWith<_$_TokobiModel> get copyWith =>
      throw _privateConstructorUsedError;
}
