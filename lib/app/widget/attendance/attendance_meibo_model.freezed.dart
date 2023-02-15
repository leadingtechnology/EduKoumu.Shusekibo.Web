// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'attendance_meibo_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AttendanceMeiboModel _$AttendanceMeiboModelFromJson(Map<String, dynamic> json) {
  return _AttendanceMeiboModel.fromJson(json);
}

/// @nodoc
mixin _$AttendanceMeiboModel {
  @JsonKey(name: 'StudentKihonId', disallowNullValue: false)
  int? get studentKihonId => throw _privateConstructorUsedError;
  @JsonKey(name: 'StudentSeq', disallowNullValue: false)
  String? get studentSeq => throw _privateConstructorUsedError;
  @JsonKey(name: 'Gakunen', disallowNullValue: false)
  String? get gakunen => throw _privateConstructorUsedError;
  @JsonKey(name: 'ClassName', disallowNullValue: false)
  String? get className => throw _privateConstructorUsedError;
  @JsonKey(name: 'StudentNumber', disallowNullValue: false)
  String? get studentNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'PhotoImageFlg', disallowNullValue: false)
  bool? get photoImageFlg => throw _privateConstructorUsedError;
  @JsonKey(name: 'Name', disallowNullValue: false)
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'GenderCode', disallowNullValue: false)
  String? get genderCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'PhotoUrl', disallowNullValue: false)
  String? get photoUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'JokyoList', disallowNullValue: false)
  List<AttendanceStatusModel>? get jokyoList =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AttendanceMeiboModelCopyWith<AttendanceMeiboModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AttendanceMeiboModelCopyWith<$Res> {
  factory $AttendanceMeiboModelCopyWith(AttendanceMeiboModel value,
          $Res Function(AttendanceMeiboModel) then) =
      _$AttendanceMeiboModelCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'StudentKihonId', disallowNullValue: false)
          int? studentKihonId,
      @JsonKey(name: 'StudentSeq', disallowNullValue: false)
          String? studentSeq,
      @JsonKey(name: 'Gakunen', disallowNullValue: false)
          String? gakunen,
      @JsonKey(name: 'ClassName', disallowNullValue: false)
          String? className,
      @JsonKey(name: 'StudentNumber', disallowNullValue: false)
          String? studentNumber,
      @JsonKey(name: 'PhotoImageFlg', disallowNullValue: false)
          bool? photoImageFlg,
      @JsonKey(name: 'Name', disallowNullValue: false)
          String? name,
      @JsonKey(name: 'GenderCode', disallowNullValue: false)
          String? genderCode,
      @JsonKey(name: 'PhotoUrl', disallowNullValue: false)
          String? photoUrl,
      @JsonKey(name: 'JokyoList', disallowNullValue: false)
          List<AttendanceStatusModel>? jokyoList});
}

/// @nodoc
class _$AttendanceMeiboModelCopyWithImpl<$Res>
    implements $AttendanceMeiboModelCopyWith<$Res> {
  _$AttendanceMeiboModelCopyWithImpl(this._value, this._then);

  final AttendanceMeiboModel _value;
  // ignore: unused_field
  final $Res Function(AttendanceMeiboModel) _then;

  @override
  $Res call({
    Object? studentKihonId = freezed,
    Object? studentSeq = freezed,
    Object? gakunen = freezed,
    Object? className = freezed,
    Object? studentNumber = freezed,
    Object? photoImageFlg = freezed,
    Object? name = freezed,
    Object? genderCode = freezed,
    Object? photoUrl = freezed,
    Object? jokyoList = freezed,
  }) {
    return _then(_value.copyWith(
      studentKihonId: studentKihonId == freezed
          ? _value.studentKihonId
          : studentKihonId // ignore: cast_nullable_to_non_nullable
              as int?,
      studentSeq: studentSeq == freezed
          ? _value.studentSeq
          : studentSeq // ignore: cast_nullable_to_non_nullable
              as String?,
      gakunen: gakunen == freezed
          ? _value.gakunen
          : gakunen // ignore: cast_nullable_to_non_nullable
              as String?,
      className: className == freezed
          ? _value.className
          : className // ignore: cast_nullable_to_non_nullable
              as String?,
      studentNumber: studentNumber == freezed
          ? _value.studentNumber
          : studentNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      photoImageFlg: photoImageFlg == freezed
          ? _value.photoImageFlg
          : photoImageFlg // ignore: cast_nullable_to_non_nullable
              as bool?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      genderCode: genderCode == freezed
          ? _value.genderCode
          : genderCode // ignore: cast_nullable_to_non_nullable
              as String?,
      photoUrl: photoUrl == freezed
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      jokyoList: jokyoList == freezed
          ? _value.jokyoList
          : jokyoList // ignore: cast_nullable_to_non_nullable
              as List<AttendanceStatusModel>?,
    ));
  }
}

/// @nodoc
abstract class _$$_AttendanceMeiboModelCopyWith<$Res>
    implements $AttendanceMeiboModelCopyWith<$Res> {
  factory _$$_AttendanceMeiboModelCopyWith(_$_AttendanceMeiboModel value,
          $Res Function(_$_AttendanceMeiboModel) then) =
      __$$_AttendanceMeiboModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'StudentKihonId', disallowNullValue: false)
          int? studentKihonId,
      @JsonKey(name: 'StudentSeq', disallowNullValue: false)
          String? studentSeq,
      @JsonKey(name: 'Gakunen', disallowNullValue: false)
          String? gakunen,
      @JsonKey(name: 'ClassName', disallowNullValue: false)
          String? className,
      @JsonKey(name: 'StudentNumber', disallowNullValue: false)
          String? studentNumber,
      @JsonKey(name: 'PhotoImageFlg', disallowNullValue: false)
          bool? photoImageFlg,
      @JsonKey(name: 'Name', disallowNullValue: false)
          String? name,
      @JsonKey(name: 'GenderCode', disallowNullValue: false)
          String? genderCode,
      @JsonKey(name: 'PhotoUrl', disallowNullValue: false)
          String? photoUrl,
      @JsonKey(name: 'JokyoList', disallowNullValue: false)
          List<AttendanceStatusModel>? jokyoList});
}

/// @nodoc
class __$$_AttendanceMeiboModelCopyWithImpl<$Res>
    extends _$AttendanceMeiboModelCopyWithImpl<$Res>
    implements _$$_AttendanceMeiboModelCopyWith<$Res> {
  __$$_AttendanceMeiboModelCopyWithImpl(_$_AttendanceMeiboModel _value,
      $Res Function(_$_AttendanceMeiboModel) _then)
      : super(_value, (v) => _then(v as _$_AttendanceMeiboModel));

  @override
  _$_AttendanceMeiboModel get _value => super._value as _$_AttendanceMeiboModel;

  @override
  $Res call({
    Object? studentKihonId = freezed,
    Object? studentSeq = freezed,
    Object? gakunen = freezed,
    Object? className = freezed,
    Object? studentNumber = freezed,
    Object? photoImageFlg = freezed,
    Object? name = freezed,
    Object? genderCode = freezed,
    Object? photoUrl = freezed,
    Object? jokyoList = freezed,
  }) {
    return _then(_$_AttendanceMeiboModel(
      studentKihonId: studentKihonId == freezed
          ? _value.studentKihonId
          : studentKihonId // ignore: cast_nullable_to_non_nullable
              as int?,
      studentSeq: studentSeq == freezed
          ? _value.studentSeq
          : studentSeq // ignore: cast_nullable_to_non_nullable
              as String?,
      gakunen: gakunen == freezed
          ? _value.gakunen
          : gakunen // ignore: cast_nullable_to_non_nullable
              as String?,
      className: className == freezed
          ? _value.className
          : className // ignore: cast_nullable_to_non_nullable
              as String?,
      studentNumber: studentNumber == freezed
          ? _value.studentNumber
          : studentNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      photoImageFlg: photoImageFlg == freezed
          ? _value.photoImageFlg
          : photoImageFlg // ignore: cast_nullable_to_non_nullable
              as bool?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      genderCode: genderCode == freezed
          ? _value.genderCode
          : genderCode // ignore: cast_nullable_to_non_nullable
              as String?,
      photoUrl: photoUrl == freezed
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      jokyoList: jokyoList == freezed
          ? _value._jokyoList
          : jokyoList // ignore: cast_nullable_to_non_nullable
              as List<AttendanceStatusModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AttendanceMeiboModel extends _AttendanceMeiboModel {
  const _$_AttendanceMeiboModel(
      {@JsonKey(name: 'StudentKihonId', disallowNullValue: false)
          this.studentKihonId,
      @JsonKey(name: 'StudentSeq', disallowNullValue: false)
          this.studentSeq,
      @JsonKey(name: 'Gakunen', disallowNullValue: false)
          this.gakunen,
      @JsonKey(name: 'ClassName', disallowNullValue: false)
          this.className,
      @JsonKey(name: 'StudentNumber', disallowNullValue: false)
          this.studentNumber,
      @JsonKey(name: 'PhotoImageFlg', disallowNullValue: false)
          this.photoImageFlg,
      @JsonKey(name: 'Name', disallowNullValue: false)
          this.name,
      @JsonKey(name: 'GenderCode', disallowNullValue: false)
          this.genderCode,
      @JsonKey(name: 'PhotoUrl', disallowNullValue: false)
          this.photoUrl,
      @JsonKey(name: 'JokyoList', disallowNullValue: false)
          final List<AttendanceStatusModel>? jokyoList})
      : _jokyoList = jokyoList,
        super._();

  factory _$_AttendanceMeiboModel.fromJson(Map<String, dynamic> json) =>
      _$$_AttendanceMeiboModelFromJson(json);

  @override
  @JsonKey(name: 'StudentKihonId', disallowNullValue: false)
  final int? studentKihonId;
  @override
  @JsonKey(name: 'StudentSeq', disallowNullValue: false)
  final String? studentSeq;
  @override
  @JsonKey(name: 'Gakunen', disallowNullValue: false)
  final String? gakunen;
  @override
  @JsonKey(name: 'ClassName', disallowNullValue: false)
  final String? className;
  @override
  @JsonKey(name: 'StudentNumber', disallowNullValue: false)
  final String? studentNumber;
  @override
  @JsonKey(name: 'PhotoImageFlg', disallowNullValue: false)
  final bool? photoImageFlg;
  @override
  @JsonKey(name: 'Name', disallowNullValue: false)
  final String? name;
  @override
  @JsonKey(name: 'GenderCode', disallowNullValue: false)
  final String? genderCode;
  @override
  @JsonKey(name: 'PhotoUrl', disallowNullValue: false)
  final String? photoUrl;
  final List<AttendanceStatusModel>? _jokyoList;
  @override
  @JsonKey(name: 'JokyoList', disallowNullValue: false)
  List<AttendanceStatusModel>? get jokyoList {
    final value = _jokyoList;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'AttendanceMeiboModel(studentKihonId: $studentKihonId, studentSeq: $studentSeq, gakunen: $gakunen, className: $className, studentNumber: $studentNumber, photoImageFlg: $photoImageFlg, name: $name, genderCode: $genderCode, photoUrl: $photoUrl, jokyoList: $jokyoList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AttendanceMeiboModel &&
            const DeepCollectionEquality()
                .equals(other.studentKihonId, studentKihonId) &&
            const DeepCollectionEquality()
                .equals(other.studentSeq, studentSeq) &&
            const DeepCollectionEquality().equals(other.gakunen, gakunen) &&
            const DeepCollectionEquality().equals(other.className, className) &&
            const DeepCollectionEquality()
                .equals(other.studentNumber, studentNumber) &&
            const DeepCollectionEquality()
                .equals(other.photoImageFlg, photoImageFlg) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality()
                .equals(other.genderCode, genderCode) &&
            const DeepCollectionEquality().equals(other.photoUrl, photoUrl) &&
            const DeepCollectionEquality()
                .equals(other._jokyoList, _jokyoList));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(studentKihonId),
      const DeepCollectionEquality().hash(studentSeq),
      const DeepCollectionEquality().hash(gakunen),
      const DeepCollectionEquality().hash(className),
      const DeepCollectionEquality().hash(studentNumber),
      const DeepCollectionEquality().hash(photoImageFlg),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(genderCode),
      const DeepCollectionEquality().hash(photoUrl),
      const DeepCollectionEquality().hash(_jokyoList));

  @JsonKey(ignore: true)
  @override
  _$$_AttendanceMeiboModelCopyWith<_$_AttendanceMeiboModel> get copyWith =>
      __$$_AttendanceMeiboModelCopyWithImpl<_$_AttendanceMeiboModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AttendanceMeiboModelToJson(
      this,
    );
  }
}

abstract class _AttendanceMeiboModel extends AttendanceMeiboModel {
  const factory _AttendanceMeiboModel(
          {@JsonKey(name: 'StudentKihonId', disallowNullValue: false)
              final int? studentKihonId,
          @JsonKey(name: 'StudentSeq', disallowNullValue: false)
              final String? studentSeq,
          @JsonKey(name: 'Gakunen', disallowNullValue: false)
              final String? gakunen,
          @JsonKey(name: 'ClassName', disallowNullValue: false)
              final String? className,
          @JsonKey(name: 'StudentNumber', disallowNullValue: false)
              final String? studentNumber,
          @JsonKey(name: 'PhotoImageFlg', disallowNullValue: false)
              final bool? photoImageFlg,
          @JsonKey(name: 'Name', disallowNullValue: false)
              final String? name,
          @JsonKey(name: 'GenderCode', disallowNullValue: false)
              final String? genderCode,
          @JsonKey(name: 'PhotoUrl', disallowNullValue: false)
              final String? photoUrl,
          @JsonKey(name: 'JokyoList', disallowNullValue: false)
              final List<AttendanceStatusModel>? jokyoList}) =
      _$_AttendanceMeiboModel;
  const _AttendanceMeiboModel._() : super._();

  factory _AttendanceMeiboModel.fromJson(Map<String, dynamic> json) =
      _$_AttendanceMeiboModel.fromJson;

  @override
  @JsonKey(name: 'StudentKihonId', disallowNullValue: false)
  int? get studentKihonId;
  @override
  @JsonKey(name: 'StudentSeq', disallowNullValue: false)
  String? get studentSeq;
  @override
  @JsonKey(name: 'Gakunen', disallowNullValue: false)
  String? get gakunen;
  @override
  @JsonKey(name: 'ClassName', disallowNullValue: false)
  String? get className;
  @override
  @JsonKey(name: 'StudentNumber', disallowNullValue: false)
  String? get studentNumber;
  @override
  @JsonKey(name: 'PhotoImageFlg', disallowNullValue: false)
  bool? get photoImageFlg;
  @override
  @JsonKey(name: 'Name', disallowNullValue: false)
  String? get name;
  @override
  @JsonKey(name: 'GenderCode', disallowNullValue: false)
  String? get genderCode;
  @override
  @JsonKey(name: 'PhotoUrl', disallowNullValue: false)
  String? get photoUrl;
  @override
  @JsonKey(name: 'JokyoList', disallowNullValue: false)
  List<AttendanceStatusModel>? get jokyoList;
  @override
  @JsonKey(ignore: true)
  _$$_AttendanceMeiboModelCopyWith<_$_AttendanceMeiboModel> get copyWith =>
      throw _privateConstructorUsedError;
}
